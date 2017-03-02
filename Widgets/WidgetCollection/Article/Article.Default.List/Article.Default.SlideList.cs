using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using We7.CMS.Common;
using System.Collections.Generic;
using We7.Framework;
using We7.CMS.WebControls;
using Thinkment.Data;
using We7.CMS.WebControls.Core;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.SlideList")]
    [ControlDescription(Name = "Article_SlideList", Desc = "Article_SlideList")]
    public partial class Article_Default_SlideList : ThinkmentDataControl
    {
        private List<Article> articles;
        private Channel channel;

        [Parameter(Title = "栏目", Type = "Channel", Required = true)]
        public string OwnerID = String.Empty;

        [Parameter(Title = "显示记录条数", Type = "Number", DefaultValue = "6")]
        public int PageSize = 6;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "100")]
        public int TitleLength = 100;

        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[MM-dd]")]
        public string DateFormat = "[MM-dd]";

        [Parameter(Title = "是否包含子栏目", Type = "Boolean", DefaultValue = "1")]
        public bool IncludeChildren;

        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Silde")]
        public string CssClass;

        [Parameter(Title = "缩略图标签", Type = "KeyValueSelector", Data = "thumbnail", DefaultValue = "flash")]
        public string ThumbnailTag = "flash";

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;
      
        protected List<Article> Articles
        {
            get
            {
                if (articles == null)
                {
                    articles = GetData();
                }
                return articles;
            }
            set { articles = value; }
        }
        protected Channel Channel
        {
            get
            {
                if (channel == null)
                {
                    ChannelHelper helper = HelperFactory.GetHelper<ChannelHelper>();
                    channel = helper.GetChannel(OwnerID, null) ?? new Channel();
                }
                return channel;
            }
        }
        private List<Article> GetData()
        {
            Criteria c = new Criteria(CriteriaType.None);
            if (IncludeChildren)
            {
                c.Add(CriteriaType.Like, "ChannelFullUrl", Channel.FullUrl + "%");
            }
            else
            {
                c.Add(CriteriaType.Equals, "OwnerID", OwnerID);
            }
            c.Add(CriteriaType.Equals, "State", 1);
            c.Add(CriteriaType.Equals, "IsImage", 1);
            c.Add(CriteriaType.Equals, "IsShow", 1);
            Order[] os = new Order[] { new Order("Updated", OrderMode.Desc) };
            articles = Assistant.List<Article>(c, os, 0, PageSize);
            return articles;
        }
    }
}
