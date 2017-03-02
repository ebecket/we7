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
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.List")]
    [ControlDescription(Name = "Article_List", Desc = "Article_List")]
    public partial class Article_Default_HeadlineList : ThinkmentDataControl
    {
        private List<Article> articles;
        private Channel channel;
        private Article picArticle;
    
        [Parameter(Title = "栏目", Type = "Channel", Required = true )]
        public string OwnerID = String.Empty;

        [Parameter(Title = "控件每页记录", Type = "Number", DefaultValue="10")]
        public int PageSize = 10;
   
        [Parameter(Title = "标题长度", Type = "Number",DefaultValue="30")]
        public int TitleLength = 30;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int FirstTitleLength = 30;

        [Parameter(Title = "摘要长度", Type = "Number", DefaultValue = "100")]
        public int SummaryLength = 100;

        [Parameter(Title = "日期格式", Type = "String",DefaultValue="MM-dd")]
        public string DateFormat = "MM-dd";

        [Parameter(Title = "包含子栏目", Type = "Boolean",DefaultValue="1")]
        public bool IncludeChildren;

        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "")]
        public string CssClass;

        [Parameter(Title = "自定义ID", Type = "String", DefaultValue = "")]
        public string ID;

      
        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "缩略图标签", Type = "KeyValueSelector", Data = "thumbnail", DefaultValue = "flash")]
        public string ThumbnailTag = "flash";

        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;

        protected List<Article> Articles
        {
            get
            {
                if (articles == null)
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
                    if (PicArticle != null) c.Add(CriteriaType.NotEquals, "ID", PicArticle.ID);
                    Order[] os = new Order[] { new Order("Updated", OrderMode.Desc) };
                    articles = Assistant.List<Article>(c, os, 0, PageSize);                    
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
 
        protected Article PicArticle
        {
            get
            {
                if (picArticle == null)
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
                    Order[] os = new Order[] { new Order("Updated", OrderMode.Desc) };
                    List<Article> list = Assistant.List<Article>(c, os, 0, 1);
                    if (list != null && list.Count > 0)
                    {
                        picArticle = list[0];
                    }
                }
                return picArticle;
            }
            set { picArticle = value; }
        } 
    }
}