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
    /// <summary>
    /// 文章列表数据提供者
    /// </summary>
    [ControlGroupDescription(Label = "Article", Icon = "Article", Description = "Article", DefaultType = "Article.MultiList")]
    [ControlDescription(Name = "Article_MultiList", Desc = "Article_MultiList")]
    public partial class Article_OaMultiList : ThinkmentDataControl
    {
        /// <summary>
        /// 文章业务助手
        /// </summary>
        protected ArticleHelper ArticleHelper
        {
            get { return HelperFactory.GetHelper<ArticleHelper>(); }
        }

        /// <summary>
        /// 栏目业务助手
        /// </summary>
        protected ChannelHelper ChannelHelper
        {
            get { return HelperFactory.GetHelper<ChannelHelper>(); }
        }
        private List<Channel> channels;
        private Channel channel;
        /// <summary>
        /// 栏目ID
        /// </summary>
        [Parameter(Title = "栏目", Type = "Channel", Required = true)]
        public string OwnerID = String.Empty;

        /// <summary>
        /// 显示记录条数
        /// </summary>
        [Parameter(Title = "显示记录条数", Type = "Number", DefaultValue = "10")]
        public int PageSize = 10;

        /// <summary>
        /// 标题长度
        /// </summary>
        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "100")]
        public int TitleLength = 100;

        /// <summary>
        /// 日期格式
        /// </summary>
        [Parameter(Title = "日期格式", Type = "String", DefaultValue = "[MM-dd]")]
        public string DateFormat = "[MM-dd]";

        /// <summary>
        /// 是否包含子栏目
        /// </summary>
        [Parameter(Title = "是否包含子栏目", Type = "Boolean", DefaultValue = "1")]
        public bool IncludeChildren;

        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Silde")]
        public string CssClass;

        /// <summary>
        /// 缩略图标签
        /// </summary>
        [Parameter(Title = "缩略图标签", Type = "KeyValueSelector", Data = "thumbnail", DefaultValue = "flash")]
        public string ThumbnailTag = "flash";

        /// <summary>
        /// 自定义图标样式
        /// </summary>
        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        /// <summary>
        /// Tags标签
        /// </summary>
        [Parameter(Title = "Tags标签", Type = "Tags", DefaultValue = "")]
        public string Tags;


        /// <summary>
        /// 自定义图标
        /// </summary>
        protected virtual string CustomIcon
        {
            get
            {
                return Icon;
            }
        }

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
        /// 子栏目信息
        /// </summary>
        protected List<Channel> Channels
        {
            get
            {
                if (channels == null)
                {
                    channels = GetChannels(Channel.ID);
                    foreach (Channel channel in channels)
                    {
                        channel.Channels = GetChannels(channel.ID);
                        foreach (Channel ch in channel.Channels)
                        {
                            ch.Articles = ArticleHelper.QueryArticlesByChannel(ch.ID, IncludeChildren, 0, 10);
                        }
                    }
                }
                return channels;
            }
        }

        /// <summary>
        /// 子栏目信息
        /// </summary>
        private List<Channel> GetChannels(string parentId)
        {
            Criteria c = new Criteria(CriteriaType.Equals, "ParentID", parentId);
            c.Add(CriteriaType.Equals, "State", 1);
            return Assistant.List<Channel>(c, new Order[] { new Order("Index"), new Order("Updated"), new Order("ID") });
        }

        /// <summary>
        /// 自定义的css样式
        /// </summary>
        protected virtual string Css
        {
            get
            {
                return CssClass;
            }
        }
    }
}
