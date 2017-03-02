<%@ Page Language="C#" AutoEventWireup="true" Inherits="We7.CMS.BasePage" %>

<script type="text/C#" runat="server">
    protected override bool NeedAnAccount
    {
        get
        {
            return false;
        }
    }
    protected override bool NeedAnPermission
    {
        get
        {
            return false;
        }
    }
    protected override MasterPageMode MasterPageIs
    {
        get
        {
            return MasterPageMode.None;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isAjax = IsAjaxRequest();
        if (isAjax)
        {
            string token = Request.Form["token"];
            string rememberMe = Request.Form["rememberMe"];
            if (string.IsNullOrEmpty(token))
            {
                JsonResult(false);
            }
            Wtp.WcfServices.SSOService.ISSOPartnerService SSOPartnerService = new Wtp.WcfServices.SSOService.SSOPartnerServiceClient();
            Wtp.WcfServices.SSOService.SSOUser user = SSOPartnerService.ValidateToken(token);
            if (string.IsNullOrEmpty(user.UserName) || Guid.Empty.Equals(user.SessionToken))
            {
                JsonResult(false);
            }

            //DateTime issueDate = DateTime.Now;
            //DateTime expireDate = issueDate.AddMonths(1);
            //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.UserName, issueDate, issueDate.AddMinutes(20), String.Equals("true", rememberMe, StringComparison.OrdinalIgnoreCase), user.SessionToken.ToString());

            //string protectedTicket = FormsAuthentication.Encrypt(ticket);

            //HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, protectedTicket);
            //if (ticket.IsPersistent)
            //{
            //    cookie.Expires = expireDate;
            //}
            //cookie.HttpOnly = true;

            //HttpContext.Current.Response.Cookies.Add(cookie);

            if (CheckLocalAdministrator(user.UserName))
            {
                We7.CMS.Accounts.Security.SetAccountID(We7Helper.EmptyGUID);
            }
            else
            {
                We7.CMS.Common.PF.Account act = AccountHelper.GetAccountByLoginName(user.UserName);
                if (act != null)
                {
                    We7.CMS.Accounts.Security.SetAccountID(act.ID);
                }
                else
                {
                    JsonResult(false);
                }
            }
            Session["SSOUser"] = user.UserName;
            JsonResult(true);
        }
    }

    private bool CheckLocalAdministrator(string loginName)
    {
        if (String.Compare(loginName, We7.Framework.Config.SiteConfigs.GetConfig().AdministratorName, true) == 0)
            return true;
        else
            return false;
    }

    private bool IsAjaxRequest()
    {
        return (Request["X-Requested-With"] == "XMLHttpRequest") || ((Request.Headers != null) && (Request.Headers["X-Requested-With"] == "XMLHttpRequest"));
    }

    private void JsonResult(object data)
    {
        if (data != null)
        {
            Response.ContentType = "application/json";
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            Response.Write(serializer.Serialize(data));
            Response.Flush();
            Response.End();
        }
    }
    
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>统一账号认证</title>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/jquery.min.js"></script>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/spark.global.js"></script>
    <link type="text/css" rel="stylesheet" href="http://static.wisesoe.com/Themes/Shared/spark.global.css" />
    <script type="text/javascript">

        $(function () {
            $(".load-auth").loadWcfAuth({
                localLogonUrl: '<%="/Admin/Signin.aspx?from=auth&returnUrl=" + (Request["returnUrl"] ?? "/Admin/")%>',
                redirectUrl: '<%=Request["returnUrl"] ?? "/Admin/"%>',
                localAuthUrl: '/Admin/Authenticate.aspx',
                ajax: {
                    url: "http://account.wisesoe.com/WcfServices/SSOService.svc/Account/RequestToken?callback=?"
                }
            });
        });
		
    </script>
</head>
<body>
    <div class="load-auth">
    </div>
</body>
</html>
