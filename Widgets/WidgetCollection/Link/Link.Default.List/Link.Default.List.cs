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
using We7.CMS.WebControls.Core;
using We7.CMS.WebControls;
using System.Collections.Generic;
using We7.CMS.Common;
using Thinkment.Data;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Link", Icon = "Link", Description = "Link", DefaultType = "Link.Default")]
    [ControlDescription(Desc = "Link", Author = "Link")]
    public partial class Link_Default_List : ThinkmentDataControl
    {
        [Parameter(Title = "控件每页记录", Type = "Number", DefaultValue = "10")]
        public int PageSize = 10;
     
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "LinkList_Default")]
        public string CssClass;

        private List<Link> items;

        [Parameter(Title = "标签", Type = "Tags", DefaultValue = "")]
        public string Tag = "";

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int TitleLength = 30;
        
        protected List<Link> Items
        {
            get
            {
                if (items == null)
                {
                    Criteria c = new Criteria(CriteriaType.None);
                    if (!String.IsNullOrEmpty(Tag))
                    {
                        c.Add(CriteriaType.Equals, "Tag", Tag);
                    }
                    Order[] os = new Order[] { new Order("OrderNumber"), new Order("Updated", OrderMode.Desc) };
                    items = Assistant.List<Link>(c, os, 0, PageSize);
                }
                return items;
            }
            set { items = value; }
        }
    }
}