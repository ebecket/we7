<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master"
    CodeBehind="StatisticsMonths.aspx.cs" Inherits="We7.CMS.Web.Admin.manage.StatisticsMonths" %>

<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <script type="text/javascript" language="javascript">
        function iframeAutoFit() {
            try {
                if (window != parent) {
                    var a = parent.document.getElementsByTagName("IFRAME");
                    for (var i = 0; i < a.length; i++) //author:meizz
                    {
                        if (a[i].contentWindow == window) {
                            var h1 = 0, h2 = 0;
                            a[i].parentNode.style.height = a[i].offsetHeight + "px";
                            a[i].style.height = "10px";
                            if (document.documentElement && document.documentElement.scrollHeight) {
                                h1 = document.documentElement.scrollHeight;
                            }
                            if (document.body) h2 = document.body.scrollHeight;
                            var h = Math.max(h1, h2);
                            if (document.all) { h += 4; }
                            if (window.opera) { h += 1; }
                            a[i].style.height = a[i].parentNode.style.height = h + h * 0.3 + "px";
                        }
                    }
                }
            }
            catch (ex) { }
        }
        if (window.attachEvent) {
            window.attachEvent("onload", iframeAutoFit);
        }
        else if (window.addEventListener) {
            window.addEventListener('load', iframeAutoFit, false);
        }

        function orderByMonth() {
            var monthButton = document.getElementById("<%=OrderByMonthButton.ClientID %>");
            monthButton.click();
        }

        function orderByCount() {
            var countButton = document.getElementById("<%=OrderByCountButton.ClientID %>");
            countButton.click();
        }
    </script>

    <h2>
    </h2>
    <div>
        <div>
            <div style="float: right; display: none">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请填写1000-9999年之间的四位正整数"
                    ControlToValidate="YearTextBox" ValidationExpression="^[1-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>请输入年份：<asp:TextBox
                        ID="YearTextBox" runat="server"></asp:TextBox>
                <input type="button" class="button" id="QueryButton" runat="server" value="按年份统计"
                    onserverclick="QueryButton_ServerClick" /></div>
            <h3>
                月访问量列表</h3>
        </div>
        <div id="position">
            <asp:Literal ID="PagePathLiteral" runat="server"></asp:Literal>
        </div>
        <asp:GridView ID="GridViewKeywords" runat="server" AutoGenerateColumns="False" Width="700px"
            CssClass="List" BorderWidth="0px" CellPadding="0">
            <AlternatingRowStyle BackColor="#fcfcfc" BorderWidth="0px" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:HyperLink ID="OrderByMonthHyperLink" NavigateUrl="javascript:orderByMonth();"
                            runat="server"><span style="text-decoration:underline">月份</span></asp:HyperLink>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("KeyValue", "{0}")%>月
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:HyperLink ID="OrderByCountHyperLink" NavigateUrl="javascript:orderByCount();"
                            runat="server"><span style="text-decoration:underline">总量</span></asp:HyperLink>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("Count", "{0}")%>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Percent" HeaderText="比例" DataFormatString="{0:N1}%" HtmlEncode="False">
                    <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemStyle CssClass="percentCcontainer" />
                    <ItemTemplate>
                        <img src="/admin/images/0.gif" style="width: <%# Convert.ToDouble(Eval("Percent", "{0}"))*140/100+1 %>px;
                            height: 10px; background-color: #114890; margin-left: -3px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div style="display: none">
        <asp:Button ID="OrderByMonthButton" runat="server" Text="OrderByMonth" OnClick="OrderByMonthButton_Click" />
        <asp:Button ID="OrderByCountButton" runat="server" Text="OrderByCount" OnClick="OrderByCountButton_Click" />
    </div>
</asp:Content>
