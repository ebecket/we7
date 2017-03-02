using System;
using System.Collections.Generic;
using System.Web;
using System.Globalization;
using We7.CMS.WebControls;
using We7.CMS.WebControls.Core;
using We7.CMS.Common;
using Thinkment.Data;
using System.Text.RegularExpressions;


namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.TabList")]
    [ControlDescription(Name = "En_Article_TabList", Desc = "Article_TabList")]
    public partial class En_Article_Default_TabList : ThinkmentDataControl
    {
        [Parameter(Title = "Tags", Type = "Tags", DefaultValue = "")]
        public string Tags;

        protected ArticleHelper ArticleHelper
        {
            get
            {
                return HelperFactory.GetHelper<ArticleHelper>();
            }
        }

        [Parameter(Title = "栏目一", Type = "Channel", Required = true, Weight = 10)]
        public string OwnerID1 = String.Empty;

        [Parameter(Title = "栏目二", Type = "Channel", Required = true, Weight = 9)]
        public string OwnerID2 = String.Empty;

        [Parameter(Title = "栏目三", Type = "Channel", Required = true, Weight = 8)]
        public string OwnerID3 = String.Empty;

        [Parameter(Title = "栏目四", Type = "Channel", Required = false, Weight = 7)]
        public string OwnerID4 = String.Empty;

        [Parameter(Title = "栏目五", Type = "Channel", Required = false, Weight = 6)]
        public string OwnerID5 = String.Empty;

        [Parameter(Title = "栏目六", Type = "Channel", Required = false, Weight = 5)]
        public string OwnerID6 = String.Empty;

        [Parameter(Title = "栏目七", Type = "Channel", Required = false, Weight = 4)]
        public string OwnerID7 = String.Empty;

        [Parameter(Title = "栏目八", Type = "Channel", Required = false, Weight = 3)]
        public string OwnerID8 = String.Empty;

        [Parameter(Title = "栏目九", Type = "Channel", Required = false, Weight = 2)]
        public string OwnerID9 = String.Empty;

        [Parameter(Title = "栏目十", Type = "Channel", Required = false, Weight = 1)]
        public string OwnerID10 = String.Empty;

        [Parameter(Title = "控件每页记录", Type = "Number", DefaultValue = "10", Required = false)]
        public int PageSize = 10;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "80")]
        public int TitleLength = 80;

        [Parameter(Title = "摘要长度", Type = "Number", DefaultValue = "100")]
        public int SummaryLength = 100;

        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[dd.MM]")]
        public new string DateFormat = "[dd.MM]";

        [Parameter(Title = "包含子栏目", Type = "Boolean", DefaultValue = "1")]
        public bool IncludeChildren;

        [Parameter(Title = "缩略图标签", Type = "KeyValueSelector", Data = "thumbnail", DefaultValue = "flash")]
        public string ThumbnailTag = "flash";

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Info")]
        public string CssClass;

        private List<Channel> channellist;

        protected List<Channel> ChannelList
        {
            get
            {
                if (channellist == null)
                {
                    List<string> ListOwnerID = new List<string>(); ;
                    if (!string.IsNullOrEmpty(OwnerID1))
                        ListOwnerID.Add(OwnerID1);
                    if (!string.IsNullOrEmpty(OwnerID2))
                        ListOwnerID.Add(OwnerID2);
                    if (!string.IsNullOrEmpty(OwnerID3))
                        ListOwnerID.Add(OwnerID3);
                    if (!string.IsNullOrEmpty(OwnerID4))
                        ListOwnerID.Add(OwnerID4);
                    if (!string.IsNullOrEmpty(OwnerID5))
                        ListOwnerID.Add(OwnerID5);
                    if (!string.IsNullOrEmpty(OwnerID6))
                        ListOwnerID.Add(OwnerID6);
                    if (!string.IsNullOrEmpty(OwnerID7))
                        ListOwnerID.Add(OwnerID7);
                    if (!string.IsNullOrEmpty(OwnerID8))
                        ListOwnerID.Add(OwnerID8);
                    if (!string.IsNullOrEmpty(OwnerID9))
                        ListOwnerID.Add(OwnerID9);
                    if (!string.IsNullOrEmpty(OwnerID10))
                        ListOwnerID.Add(OwnerID10);

                    channellist = new List<Channel>();
                    for (int i = 0; i < ListOwnerID.Count; i++)
                    {
                        Criteria c = new Criteria();
                        c.Mode = CriteriaMode.And;
                        c.Add(CriteriaType.Equals, "State", 1);
                        c.Add(CriteriaType.Equals, "ID", ListOwnerID[i]);
                        List<Channel> templist = Assistant.List<Channel>(c, null);
                        if (templist != null || templist.Count > 0)
                        {
                            channellist.Add(templist[0]);
                        }
                    }
                    for (int i = 0; i < channellist.Count; i++)
                    {
                        Criteria ac = new Criteria(CriteriaType.None);
                        if (IncludeChildren)
                        {
                            ac.Add(CriteriaType.Like, "ChannelFullUrl", channellist[i].FullUrl + "%");
                        }
                        else
                        {
                            ac.Add(CriteriaType.Equals, "OwnerID", channellist[i].ID);
                        }
                        ac.Add(CriteriaType.Equals, "State", 1);
                        Order[] os = new Order[] { new Order("IsShow", OrderMode.Desc), new Order("Updated", OrderMode.Desc) };
                        channellist[i].Articles = Assistant.List<Article>(ac, os, 0, PageSize);
                    }
                }
                return channellist;
            }
        }

        protected string ToEnglishDateTime(DateTime dt)
        {
            string ret = "";
            String format = "MMM.dd,yyyy";
            ret = (dt != null) ? dt.ToString(format, DateTimeFormatInfo.InvariantInfo) : "";
            return ret;
        }
    }
}