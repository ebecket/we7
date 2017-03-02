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
using We7.Model.Core.Data;
using We7.Framework.Util;
using System.ComponentModel;

namespace We7.CMS.Web.Widgets
{
    /// <summary>
    /// 文章分页控件列表
    /// </summary>
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.PagedList")]
    [ControlDescription(Desc = "Article_PagedList")]
    public partial class Article_Default_PagedList : ThinkmentDataControl
    {
        private List<Article> articles;
        private Channel channel;
        private Criteria criteria;
   
        [Children]
        public ControlPager Pager = new ControlPager();
    
        [Parameter(Title = "栏目", Type = "Channel", Required = true )]
        public string OwnerID = String.Empty;

    
        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int TitleLength = 30;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "100")]
        public int SummaryLength = 100;     
     
        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[MM-dd]")]
        public string DateFormat = "[MM-dd]";
     
        [Parameter(Title = "包含子栏目", Type = "Boolean", DefaultValue = "true")]
        public bool IncludeChildren;
   
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "PagedArticleList_Default")]
        public string CssClass;

        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "缩略图标签", Type = "KeyValueSelector", Data = "thumbnail", DefaultValue = "flash")]
        public string ThumbnailTag = "flash";

        public string KeyWord
        {
            get
            {
                if (Request["keywords"] == null || Request["keywords"].ToString().Trim().Length < 1 )
                    return string.Empty;
                else
                    return We7Helper.RemoveHtml(Request["keywords"].ToString());
            }
        }
  
        protected Channel Channel
        {
            get
            {
                if (channel == null)
                {
                    ChannelHelper helper = HelperFactory.GetHelper<ChannelHelper>();
                    if (string.IsNullOrEmpty(OwnerID))
                    {
                        OwnerID = helper.GetChannelIDFromURL();
                    }
                    channel = helper.GetChannel(OwnerID, null) ?? new Channel();
                }
                return channel;
            }
        }
    
        protected List<Article> Articles
        {
            get
            {
                if (articles == null)
                {
                    int pageIndex = Pager.PageIndex, startIndex, pageItemsCount;
                    Utils.BuidlPagerParam(Pager.RecordCount, Pager.PageSize, ref pageIndex, out startIndex, out pageItemsCount);
                    Order[] os = new Order[] { new Order("IsShow", OrderMode.Desc), new Order("Updated", OrderMode.Desc) };
                    articles = Assistant.List<Article>(criteria, os, startIndex, pageItemsCount);
                }
                return articles;
            }
        }       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitCriteria();          
                Pager.RecordCount = Assistant.Count<Article>(criteria);
            }
        }

        private void InitCriteria()
        {
            criteria = new Criteria(CriteriaType.None);
            if (string.IsNullOrEmpty(KeyWord))
            {
                if (IncludeChildren && Channel != null)
                {
                    criteria.Add(CriteriaType.Like, "ChannelFullUrl", Channel.FullUrl + "%");
                }
                else
                {
                    criteria.Add(CriteriaType.Equals, "OwnerID", Channel.ID);
                }
            }
            string tag = Request["tag"];
            if (!String.IsNullOrEmpty(tag))
            {
                criteria.Add(CriteriaType.Like, "Tags", "%" + HttpUtility.UrlDecode(tag) + "%");
            }

            string title = Request["title"];
            if (!String.IsNullOrEmpty(title))
            {
                criteria.Add(CriteriaType.Like, "Title", "%" + title + "%");
            }

            string channel = Request["channel"];
            if (!String.IsNullOrEmpty(channel))
            {
                Channel ch = HelperFactory.Instance.GetHelper<ChannelHelper>().GetChannel(channel, null);
                if (ch != null)
                {
                    criteria.Add(CriteriaType.Like, "ChannelFullUrl", ch.FullUrl + "%");
                }
            }

            string author = Request["author"];
            if (!String.IsNullOrEmpty(author))
            {
                criteria.Add(CriteriaType.Equals, "Author", author);
            }

            if (!string.IsNullOrEmpty(KeyWord))
            {
                Criteria keyCriteria = new Criteria(CriteriaType.None);
                keyCriteria.Mode = CriteriaMode.Or;
                keyCriteria.AddOr(CriteriaType.Like, "Title", "%" + KeyWord + "%");
                keyCriteria.AddOr(CriteriaType.Like, "Description", "%" + KeyWord + "%");                
                criteria.Criterias.Add(keyCriteria);
            }
            criteria.Add(CriteriaType.Equals, "State", 1);
        }

        protected string ToUrl(string type, string strUrl)
        {
            string retUrl = strUrl;
            if (type == "all")
            {
                retUrl = string.Format("{0}?type={1}", strUrl, type);
            }
            return retUrl;
        }
    }
}