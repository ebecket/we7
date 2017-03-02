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
using System.ComponentModel;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Footer", Icon = "Footer", Description = "Footer", DefaultType = "Footer.Default")]
    [ControlDescription(Desc = "Footer_Default")]
    public partial class Footer_Default : BaseControl
    {
        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Footer")]
        public string CssClass;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}