<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireList.aspx.cs"
    Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionnaireList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>选择一个问卷</title>
    <link rel="stylesheet" type="text/css" href="../theme/classic/css/main.css" media="screen" />
    <script src="<%=AppPath%>/cgi-bin/DialogHelper.js" type="text/javascript"></script>
    <script src="<%=AppPath%>/cgi-bin/search.js" type="text/javascript"></script>
    <script type="text/javascript">
        function onSelectHyperLinkClick(id, title) {
            var v = id;
            var t = title;
            weCloseDialog(v, t);
        }

        function onCancelHyperLinkClick() {
            weCloseDialog(null, null);
        }
    </script>
</head>
<body id="classic"  style="padding-left:10px;padding-right:10px">
    <form id="frm" runat="server">
    <h2>
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/logo_template.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="选择一个问卷">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="">
            </asp:Label>
        </span>
    </h2>
    <div class="toolbar">
        <li class="smallButton4">
            <asp:HyperLink ID="CancelHyperLink" runat="server" NavigateUrl="javascript:onCancelHyperLinkClick();">取消</asp:HyperLink>
        </li>
        <li class="smallButton4">
            <asp:HyperLink ID="RefreshHyperLink" runat="server" NavigateUrl="javascript:window.location.Reload();">刷新</asp:HyperLink>
        </li>
    </div>
    <div style="display:table;min-height:35px;width:100%">
        <asp:GridView ID="DetailGridView" runat="server" AutoGenerateColumns="False" 
            GridLines="Horizontal" CssClass="List" >
            <Columns>
                <asp:TemplateField HeaderText="名称">
                    <ItemTemplate>
                        <a href="javascript:onSelectHyperLinkClick('<%# Eval("ID", "{0}") %>','<%# Eval("Title", "{0}") %>');" title="点击选中" >
                        <%# String.IsNullOrEmpty(Eval("Title", "{0}"))?"未命名标题":Eval("Title","{0}") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" DataFormatString="{0}" HeaderText="描述" />
                <asp:BoundField DataField="State" DataFormatString="{0}" HeaderText="状态" />
                <asp:BoundField DataField="Created" DataFormatString="{0}" HeaderText="创建时间" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
