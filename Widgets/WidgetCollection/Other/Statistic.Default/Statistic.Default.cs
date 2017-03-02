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
using System.Text;
using We7.CMS.WebControls;
using We7.CMS.WebControls.Core;
using We7.Framework;
using We7.CMS.Common;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Statistic", Icon = "Statistic", Description = "Statistic", DefaultType = "Statistic.Default")]
    [ControlDescription(Desc = "Statistic_Default")]
    public partial class Statistic_Default : BaseControl
    {        

        /// </summary>
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
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Statistic_Default")]
        public string CssClass;

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

        protected virtual VisiteCount GetVisitorCount()
        {
            PageVisitorHelper helper = ((HelperFactory)Application[Framework.HelperFactory.ApplicationID]).GetHelper<PageVisitorHelper>();
            DateTime oldest = helper.GetOldestTime();
            if (oldest < DateTime.Today)
                helper.MigrateToHistory();
            return helper.GetCurrentVisiteCount();
        }

        protected virtual int OnlineCount
        {
            get
            {
                return (int)Context.Application[PageVisitorHelper.OnlinePeopleApplicationKey]; ;
            }
        }
    }
}