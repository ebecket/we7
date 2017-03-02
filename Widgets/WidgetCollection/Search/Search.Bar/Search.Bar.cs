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
    [ControlGroupDescription(Label = "Search", Icon = "Search", Description = "Search", DefaultType = "Search.Bar")]
    [ControlDescription("Search_Bar")]
    public partial class Search_Bar : BaseControl
    {
    }
}