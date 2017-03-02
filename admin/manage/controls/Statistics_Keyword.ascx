<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics_Keyword.ascx.cs" Inherits="We7.CMS.Web.Admin.Statistics_Keyword" %>
<script src="<%=AppPath%>/cgi-bin/setday.js"></script> 
<div> 
     <table width="300">
        <tr>
            <td >
                 仅列出包含
            </td>
            <td>
                <asp:TextBox ID="KeyWordTextBox" runat="server" Width="140px"></asp:TextBox>
            </td>
            <td>
                的<%=KeyTitle%>，从
            </td>
            <td>
                <input id="starttime" onclick="setday(this)" name="starttime" runat="server" style="width: 92px" />
            </td>
            <td>
                到</td>
            <td>
            </td>
            <td>
                <input id="endtime" onclick="setday(this)" name="endtime" runat="server" style="width: 90px" /></td>
          <td>
          <asp:Button ID="OKButton" runat="server" Text="确定" Height="25px" OnClick="OKButton_Click" Width="80px" />
                </td>
               <td width="100"></td> 
        </tr>
    </table>
    </div>
<h3>
    <%=KeyTitle%> <asp:Label ID="KeywordLabel" runat="server" Text="">
            </asp:Label> [按总数排序] </h3>
<asp:GridView ID="GridViewKeywords" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="List" BorderWidth="0px" CellPadding="0">
<AlternatingRowStyle BackColor="#fcfcfc" BorderWidth="0px"  />
    <Columns>
        <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <%# Eval("KeyValue", "{0}")%>
                <%#GetDetailLink(Eval("KeyValue", "{0}"))%>
            </ItemTemplate>
        </asp:TemplateField>
    <asp:BoundField DataField="Count" HeaderText="总量" >
        <ItemStyle Width="80px" />
    </asp:BoundField>
    <asp:BoundField DataField="Percent" HeaderText="比例"  DataFormatString="{0:N1}%" HtmlEncode="False" >
    <ItemStyle Width="100px" /> 
    </asp:BoundField>
    <asp:TemplateField  >
   <ItemStyle CssClass="percentCcontainer" /> 
            <ItemTemplate>
               <img src="/admin/images/0.gif"  style="width:<%# Convert.ToDouble(Eval("Percent", "{0}"))*140/100+1 %>px;height:10px;background-color: #114890;margin-left:-3px" />            
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>