<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Publish_account.ascx.cs"
    Inherits="We7.CMS.Web.Admin.Publish_account" %>

<script src="<%=AppPath%>/cgi-bin/setday.js"></script>

<script type="text/javascript" language="javascript">
    function hasChild(obj) {
        var parentID = obj.parentElement.id;
        var myID = parentID.replace("_MyGroup", "_HasChildTextBox");
        var has = document.getElementById(myID);
        if (has) {
            if (has.value == "true") return true;
            else {
                alert("此处已没有子栏目！");
                return false;
            }
        }
    }
    function closewin() {
        setTimeout("alert.close()", 5000)
    } 
</script>

<div style="display: <%= SelectVisble %>">
    <table width="300">
        <tr>
            <td>
                仅列出
            </td>
            <td>
                <asp:TextBox ID="KeyWordTextBox" runat="server" Width="140px"></asp:TextBox>
            </td>
            <td>
                下的<%=KeyTitle%>，从
            </td>
            <td>
                <input id="starttime" onclick="setday(this)" name="starttime" runat="server" style="width: 92px" />
            </td>
            <td>
                到
            </td>
            <td>
            </td>
            <td>
                <input id="endtime" onclick="setday(this)" name="endtime" runat="server" style="width: 90px" />
            </td>
            <td>
                <asp:Button ID="OKButton" runat="server" Text="确定" Height="25px" OnClick="OKButton_Click"
                    Width="80px" />
            </td>
            <td width="100">
            </td>
        </tr>
    </table>
</div>
<h3>
    <%=KeyTitle%>
    <asp:Label ID="KeywordLabel" runat="server" Text="">
    </asp:Label>
    [按总数排序]
</h3>
<div id="position">
    <asp:Literal ID="PagePathLiteral" runat="server"></asp:Literal>
</div>
<div onload="closewin()">
    <asp:GridView ID="GridViewKeywords" runat="server" AutoGenerateColumns="False" Width="100%"
        CssClass="List" BorderWidth="0px" CellPadding="0" OnRowDataBound="GridViewKeywords_RowDataBound">
        <AlternatingRowStyle BackColor="#fcfcfc" BorderWidth="0px" />
        <Columns>
            <asp:TemplateField HeaderText="名称">
                <ItemTemplate>
                    <%if (IsChannel)
                      {%>
                    <span id="MyGroup" runat="server"><a href="/admin/manage/PublishStatisticses.aspx?tab=channel&ChannelID=<%#Eval("ChannelID","{0}") %>"
                        onclick="return hasChild(this);">
                        <%#Eval("KeyValue","{0}") %></a>
                        <asp:Label ID="ChannelIDLabel" runat="server" Text='<%#Eval("ChannelID","{0}") %>'
                            Style="display: none"></asp:Label>
                        <asp:TextBox ID="HasChildTextBox" runat="server" Style="display: none"></asp:TextBox>
                    </span>
                    <%}
                      else
                      {%>
                    <%# Eval("KeyValue", "{0}")%>
                    <%} %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Count" HeaderText="发布数">
                <ItemStyle Width="50px" />
            </asp:BoundField>
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
            <asp:BoundField DataField="Clicks" HeaderText="点击量">
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="ClickPercent" HeaderText="比例" DataFormatString="{0:N1}%"
                HtmlEncode="False">
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemStyle CssClass="percentCcontainer" />
                <ItemTemplate>
                    <img src="/admin/images/0.gif" style="width: <%# Convert.ToDouble(Eval("ClickPercent", "{0}"))*140/100+1 %>px;
                        height: 10px; background-color: #114890; margin-left: -3px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
