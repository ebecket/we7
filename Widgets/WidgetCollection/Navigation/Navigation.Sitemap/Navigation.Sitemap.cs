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
using We7.Framework;
using We7.CMS.Common;
using System.Collections.Generic;
using Thinkment.Data;
using We7.CMS.WebControls.Core;
using We7.CMS.WebControls;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Navigation", Icon = "Navigation", Description = "Navigation", DefaultType = "Navigation.Sitemap")]
    [ControlDescription(Desc = "Navigation")]
    public partial class Navigation_Sitemap : ThinkmentDataControl
    {
        private List<Channel> topChannels;
       
        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "ChannelNav")]
        public string CssClass;

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

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
        /// 自定义的css样式
        /// </summary>
        protected virtual string Css
        {
            get
            {
                return CssClass;
            }
        }

        public List<Channel> TopChannels
        {
            get
            {
                if (topChannels == null)
                {
                    topChannels = GetPublicChannels(We7Helper.EmptyGUID);
                    foreach (Channel channel in topChannels)
                    {
                        channel.SubChannels = GetPublicChannels(channel.ID);
                        if (channel.SubChannels.Count > 0)
                            channel.HaveSon = true;
                    }
                }
                return topChannels;
            }
        }

        private List<Channel> GetPublicChannels(string parentId)
        {
            Criteria c = new Criteria(CriteriaType.Equals, "ParentID", parentId);
            c.Add(CriteriaType.Equals, "State", 1);
            c.Add(CriteriaType.Equals, "SecurityLevel", 0);
            List<Channel> list = null;
            if (Assistant.Count<Channel>(c) > 0)
            {
                list = Assistant.List<Channel>(c, new Order[] { new Order("Index"), new Order("Updated"), new Order("ID") });
            }
            else
            {
                list = new List<Channel>();
            }
            return list;
        }
    }
}