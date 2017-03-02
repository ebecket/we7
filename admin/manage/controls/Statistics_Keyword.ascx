<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics_Keyword.ascx.cs" Inherits="We7.CMS.Web.Admin.Statistics_Keyword" %>
<script src="<%=AppPath%>/cgi-bin/setday.js"></script> 
<div> 
     <table width="300">
        <tr>
            <td >
                 ���г�����
            </td>
            <td>
                <asp:TextBox ID="KeyWordTextBox" runat="server" Width="140px"></asp:TextBox>
            </td>
            <td>
                ��<%=KeyTitle%>����
            </td>
            <td>
                <input id="starttime" onclick="setday(this)" name="starttime" runat="server" style="width: 92px" />
            </td>
            <td>
                ��</td>
            <td>
            </td>
            <td>
                <input id="endtime" onclick="setday(this)" name="endtime" runat="server" style="width: 90px" /></td>
          <td>
          <asp:Button ID="OKButton" runat="server" Text="ȷ��" Height="25px" OnClick="OKButton_Click" Width="80px" />
                </td>
               <td width="100"></td> 
        </tr>
    </table>
    </div>
<h3>
    <%=KeyTitle%> <asp:Label ID="KeywordLabel" runat="server" Text="">
            </asp:Label> [����������] </h3>
<asp:GridView ID="GridViewKeywords" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="List" BorderWidth="0px" CellPadding="0">
<AlternatingRowStyle BackColor="#fcfcfc" BorderWidth="0px"  />
    <Columns>
        <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <%# Eval("KeyValue", "{0}")%>
                <%#GetDetailLink(Eval("KeyValue", "{0}"))%>
            </ItemTemplate>
        </asp:TemplateField>
    <asp:BoundField DataField="Count" HeaderText="����" >
        <ItemStyle Width="80px" />
    </asp:BoundField>
    <asp:BoundField DataField="Percent" HeaderText="����"  DataFormatString="{0:N1}%" HtmlEncode="False" >
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