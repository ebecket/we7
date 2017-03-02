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
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.Single")]
    [ControlDescription(Desc = "Article_Single")]
    public partial class Article_Default_Single : ThinkmentDataControl
    {
  
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

        /// <summary>
        /// 同级栏目
        /// </summary>
        private List<Channel> channels;
        /// <summary>
        /// 当前栏目
        /// </summary>
        private Channel channel;
        /// <summary>
        /// 当前文章
        /// </summary>
        private Article article;
        /// <summary>
        /// 附件
        /// </summary>
        private List<Attachment> attachments;
        /// <summary>
        /// 栏目ID
        /// </summary>
        [Parameter(Title = "栏目", Type = "Channel", Required = true)]
        public string OwnerID = String.Empty;

        /// <summary>
        /// 标题长度
        /// </summary>
        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int TitleLength = 30;

        /// <summary>
        /// 日期格式
        /// </summary>
        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[MM-dd]")]
        public string DateFormat = "[MM-dd]";

        /// <summary>
        /// 是否包含子栏目
        /// </summary>
        [Parameter(Title = "包含子栏目", Type = "Boolean", DefaultValue = "true")]
        public bool IncludeChildren;

        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "PagedArticleList_Default")]
        public string CssClass;

        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;

        /// <summary>
        /// 当前栏目信息
        /// </summary>
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

        /// <summary>
        /// 同级栏目信息
        /// </summary>
        protected List<Channel> Channels
        {
            get
            {
                if (channels == null)
                {
                    Criteria c = new Criteria(CriteriaType.Equals, "ParentID", Channel.ParentID);
                    c.Add(CriteriaType.Equals, "State", 1);
                    channels = Assistant.List<Channel>(c, new Order[] { new Order("Updated"), new Order("ID") });
                }
                return channels;
            }
        }

        /// 获得当前栏目下的第一篇文章
        /// </summary>
        /// <returns></returns>
        protected Article Article
        {
            get
            {
                if (article == null)
                {
                    Criteria c = new Criteria(CriteriaType.Equals, "ChannelFullUrl", Channel.FullUrl);
                    c.Add(CriteriaType.Equals, "Title", Channel.Name);
                    c.Add(CriteriaType.Equals, "State", 1);
                    Order[] os = new Order[] { new Order("Updated", OrderMode.Desc) };
                    List<Article> aList = Assistant.List<Article>(c, os, 0, 1);
                    if (aList != null && aList.Count > 0)
                    {
                        article = aList[0];
                    }
                }
                return article ?? new Article();
            }
        }

        protected List<Attachment> Attachments
        {
            get
            {
                if (attachments == null)
                {
                    if (!We7Helper.IsEmptyID(Article.ID))
                    {
                        List<Attachment> aList = AttachmentHelper.GetAttachments(Article.ID);
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