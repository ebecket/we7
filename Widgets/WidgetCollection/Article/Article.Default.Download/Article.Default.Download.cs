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
using We7.CMS.Common.Enum;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.Download")]
    [ControlDescription(Name = "Article_Download")]
    public partial class Article_Default_Download : ThinkmentDataControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ThisArticle.ContentType == Convert.ToInt32(TypeOfArticle.LinkArticle))
            {
                Response.Redirect(ThisArticle.ContentUrl, true);
            }
            if (Attachments != null && Attachments.Count > 0)
            {
                Response.Redirect(Attachments[0].DownloadUrl, true);
            }
        }
        
        protected ArticleHelper ArticleHelper
        {
            get { return HelperFactory.GetHelper<ArticleHelper>(); }
        }
   
        protected ChannelHelper ChannelHelper
        {
            get { return HelperFactory.GetHelper<ChannelHelper>(); }
        }

        protected AttachmentHelper AttachmentHelper
        {
            get { return HelperFactory.GetHelper<AttachmentHelper>(); }
        }
     
        private Article thisArticle;       
     
        private List<Attachment> attachments;
     
        private Channel channel;
      
        [Parameter(Title = "栏目", Type = "Channel", Required = true)]
        public string OwnerID = String.Empty;
      
        [Parameter(Title = "相关文章条数", Type = "Number", DefaultValue = "3")]
        public int PageSize = 3;
     
        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int TitleLength = 30;
     
        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[MM-dd]")]
        public string DateFormat = "[MM-dd]";
      
        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;
   
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "ArticleView_Default")]
        public string CssClass;

        public string ArticleID
        {
            get
            {
                return ArticleHelper.GetArticleIDFromURL();
            }
        }
     
        protected Channel Channel
        {
            get
            {
                if (channel == null)
                {                   
                    if (string.IsNullOrEmpty(OwnerID))
                    {
                        OwnerID = ChannelHelper.GetChannelIDFromURL();
                    }
                    channel = ChannelHelper.GetChannel(OwnerID, null) ?? new Channel();
                }
                return channel;
            }
        }
    
        protected Article ThisArticle
        {
            get
            {
                if (thisArticle == null)
                {
                    if (!We7Helper.IsEmptyID(ArticleID))
                    {
                        Criteria c = new Criteria(CriteriaType.Equals, "ID", ArticleID);
                        c.Add(CriteriaType.Equals, "State", 1);
                        Order[] os = new Order[] { new Order("Updated", OrderMode.Desc) };
                        List<Article> aList = Assistant.List<Article>(c, os, 0, 1);
                        if (aList != null && aList.Count > 0)
                        {
                            thisArticle = aList[0];
                        }
                    }
                }
                return thisArticle ?? new Article();
            }
        }
      

        protected List<Attachment> Attachments
        {
            get
            {
                if (attachments == null)
                {
                    if (!We7Helper.IsEmptyID(ArticleID))
                    {
                        List<Attachment> aList = AttachmentHelper.GetAttachments(ArticleID);
                        if (aList != null && aList.Count > 0)
                        {
                            attachments = aList;
                        }
                    }
                }
                return attachments;
            }
        } 
    }
}