<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="File.aspx.cs" Inherits="SOE.OldDbWorker.File" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        请将旧上传文件文件夹admin\manage\file拷贝至_data\file，以下操作将重命名其中文件名。<br />        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改文件名" />
        成功：<asp:Label ID="Finish" runat="server" Text="0"></asp:Label>条 失败：<asp:Label ID="Fail"
            runat="server" Text="0"></asp:Label>条
        <hr />
        <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
