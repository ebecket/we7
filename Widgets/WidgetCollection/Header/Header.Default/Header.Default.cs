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
using We7.Framework.Config;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Header", Icon = "Header", Description = "Header", DefaultType = "Header.Default")]
    [ControlDescription("Header_Default")]
    public partial class Header_Default : BaseControl
    {      
        [Parameter(Title = "CSS", Type = "String", DefaultValue = "Header")]
        public string CssClass;
        protected virtual string Css
        {
            get
            {
                return CssClass;
            }
        }
 

        protected void Page_Load(object sender, EventArgs e)
        {
        }
       
        public string LogoPath
        {
            get
            {
                if (String.IsNullOrEmpty(GeneralConfigs.GetConfig().SiteLogo))
                {
                    return ThemePath + "/images/logo.gif";
                }
                else
                {
                    return GeneralConfigs.GetConfig().SiteLogo;
                }
            }
        }

        public string SiteName
        {
            get { return GeneralConfigs.GetConfig().SiteTitle; }
        }     
    }
}