<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="We7.CMS.Web.Admin.Signin" %>

<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录<%=ProductBrand%>网站管理中心</title>
    <script src="/admin/cgi-bin/DialogHelper.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/jquery.min.js"></script>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/spark.global.js"></script>
    <script type="text/javascript" src="/admin/theme/classic/js/common.js"></script>
    <link type="text/css" rel="stylesheet" href="http://static.wisesoe.com/Themes/Shared/spark.global.css" />
    <style type="text/css">
        *
        {
            padding-right: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            margin: 0px;
            padding-top: 0px;
        }
        BODY
        {
            color: #333;
            text-align: center;
            background-color: #FBFBFB;
        }
        BODY
        {
            font: 12px/1.5em Arial;
        }
        TD
        {
            font: 12px/1.5em Arial;
        }
        TH
        {
            font: 12px/1.5em Arial;
        }
        .loginbox
        {
            margin: 180px auto 60px;
            text-align: left;
        }
        TD
        {
        }
        .logo
        {
            padding-right: 70px;
            padding-left: 0px;
            background: url(/admin/images/login_logo.gif) no-repeat 100% 50%;
            padding-bottom: 30px;
            width: 226px;
            padding-top: 110px;
            text-align: right;
        }
        .logo P
        {
            margin: -50px 0px 0px;
        }
        table.loginform
        {
            margin-top: 10px;
        }
        .loginform TH
        {
            padding-right: 3px;
            padding-left: 3px;
            font-size: 12px;
            padding-bottom: 3px;
            padding-top: 3px;
            color: #666;
        }
        .loginform TD
        {
            padding-right: 3px;
            padding-left: 3px;
            font-size: 12px;
            padding-bottom: 3px;
            padding-top: 3px;
            color: #666;
        }
        .t_input
        {
            border-right: #eee 1px solid;
            padding-right: 2px;
            border-top: #666 1px solid;
            padding-left: 2px;
            padding-bottom: 3px;
            border-left: #666 1px solid;
            padding-top: 3px;
            border-bottom: #eee 1px solid;
        }
        .submit
        {
            background-image: url(/admin/images/login_button.jpg);
            background-repeat: no-repeat;
            background-color: Transparent;
            border-bottom-style: none;
            width: 73px;
            height: 26px;
            cursor: pointer;
            border-width: 0px;
        }
        .click-logon
        {
            background-image: url(/admin/images/login_button2.jpg);
            background-repeat: no-repeat;
            background-color: Transparent;
            border-bottom-style: none;
            width: 100px;
            height: 26px;
            cursor: pointer;
            border-width: 0px;
        }
        .footer
        {
            left: 50%;
            margin-left: -250px;
            width: 500px;
            color: #999;
            bottom: 10px;
            position: absolute;
        }
        A
        {
            color: #2366a8;
            text-decoration: none;
        }
        A:hover
        {
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript">
        function checkTopWindow() {
            if (window != top) {
                top.location = window.location;
            }
        }

        $(function () {
            $(".click-logon").clickWcfLogon({
                localAuthenticateUrl: '<%="/Admin/Authenticate.aspx?returnUrl=" + (Request["returnUrl"] ?? "/Admin/")%>',
                messages: {
                    error: "登录失败",
                    userNotExist: "用户名不存在！",
                    pswNotMatch: "密码与用户名不匹配！",
                    userLocked: "用户被禁用",
                    userDisabled: "连续密码错误，用户被锁定"
                },
                ajax: {
                    url: "http://account.wisesoe.com/WcfServices/SSOService.svc/Account/Logon?callback=?"
                }
            });
        });
    </script>
</head>
<body id="classic">
    <form id="mainForm" runat="server">
    <%--<WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>--%>
    <table class="loginbox" cellpadding="0" callspacing="0">
        <tbody>
            <tr>
                <td class="logo">
                    <p>
                        请输入你的用户名、密码，登录到本站，维护本站信息</p>
                </td>
                <td>
                    <table class="loginform" cellpadding="0" callspacing="0" style="height: 120px">
                        <tbody>
                            <tr>
                                <th>
                                    登录名：
                                </th>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Columns="30"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    密 码：
                                </th>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Columns="30"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr id="tbAuthenCode2" runat="server" visible="false">
                                <th>
                                    验证码：
                                </th>
                                <td>
                                    <asp:TextBox ID="CodeNumberTextBox" runat="server" Columns="30" />
                                </td>
                                <td>
                                    <img alt="x" src="/Admin/cgi-bin/controls/CaptchaImage/SmallJpegImage.aspx" runat="server"
                                        id="Img2" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <!--<asp:Button ID="SubmitButton" runat="server" Text="" ToolTip="登陆" OnClick="SubmitButton_Click"
                                        CssClass="submit"/>-->
                                    <input class="click-logon" type="button" title="统一账号登陆" />
                                    <a href="/">返回首页</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <%if (Request["from"] == "auth")
                                      {%>
                                    <div class="ajax-error">
                                        统一账户登录已经过期请重新登录或者统一账号在该系统没有权限！</div>
                                    <%}
                                      else
                                      {%>
                                    <div class="ajax-error" style="display: none;">
                                    </div>
                                    <%} %>
                                    <asp:Label ID="MessageLabel" runat="server" Text="" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <p>
    </p>
    <p class="footer">
        <asp:Literal ID="CopyrightLiteral" runat="server"></asp:Literal>
    </p>
    </form>
</body>
</html>
