<%@ Page Language="C#" AutoEventWireup="true" Inherits="System.Web.UI.Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>统一账号退出</title>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/jquery.min.js"></script>
    <script type="text/javascript" src="http://static.wisesoe.com/Themes/Shared/spark.global.js"></script>
    <link type="text/css" rel="stylesheet" href="http://static.wisesoe.com/Themes/Shared/spark.global.css" />
    <script type="text/javascript">

        $(function () {
            $(".load-logout").loadWcfLogout({
                localLogonUrl: '/admin/Signin.aspx?action=logout',
                ajax: {
                    url: "http://account.wisesoe.com/WcfServices/SSOService.svc/Account/Logout?callback=?"
                }
            });
        });		
    </script>
</head>
<body>
    <div class="load-logout">
    </div>
</body>
</html>
