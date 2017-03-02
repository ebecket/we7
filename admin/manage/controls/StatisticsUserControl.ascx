<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticsUserControl.ascx.cs" Inherits="We7.CMS.Web.Admin.StatisticsUserControl" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Panel ID="PanelContent" runat="server" Width="100%">
<script src="<%=AppPath%>/cgi-bin/setday.js"></script> 
<div> 
     <table width="300">
        <tr>
            <td >
                 ���������ؼ���
            </td>
            <td>
                <asp:TextBox ID="KeyWordTextBox" runat="server" Width="140px"></asp:TextBox>
            </td>
            <td>
                �ķÿͣ�ʱ���
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
               <td width="50"></td> 
        </tr>
    </table>
    </div>
<h3>�ÿ��б�<asp:Label ID="KeywordLabel" runat="server" Text="">
            </asp:Label> </h3>
<asp:GridView ID="GridViewUser" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="List" CellSpacing="0" GridLines="Horizontal">
<AlternatingRowStyle BackColor="#fcfcfc"  />
    <Columns>
        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:CheckBox ID="chkItem" runat="server" />
                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/admin/manage/StatisticsDetail.aspx?type=0&amp;id={0}"
        DataTextField="VisitorIP" DataTextFormatString="{0}" HeaderText="�ÿ�IP" >
        <ItemStyle Width="120px" />
    </asp:HyperLinkField>
    <asp:BoundField DataField="City" HeaderText="����" >
        <ItemStyle Width="80px" />
    </asp:BoundField>
    <asp:BoundField DataField="VisitDate" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm}"  HtmlEncode="false" >
        <ItemStyle Width="110px" Font-Size="11px" />
    </asp:BoundField>
    <asp:HyperLinkField DataNavigateUrlFields="Url" DataNavigateUrlFormatString="{0}"
        DataTextField="Url" DataTextFormatString="{0}" HeaderText="���" Target="_blank" >
        <ItemStyle Width="230px" CssClass="wordwrap" />
    </asp:HyperLinkField>

    <asp:BoundField DataField="PageView" HeaderText="���" >
        <ItemStyle Width="40px" />
    </asp:BoundField>
    
    <asp:HyperLinkField DataNavigateUrlFields="HttpReferer" DataNavigateUrlFormatString="{0}"
        DataTextField="SearchEngine"  DataTextFormatString="{0}" HeaderText="��·" Target="_blank" >
        <ItemStyle CssClass="wordwrap" />
    </asp:HyperLinkField> 
   
    </Columns>
</asp:GridView>
<div style="display:none">
<asp:CheckBox ID="AllCheckBox" runat="server" AutoPostBack="true" Text="" OnCheckedChanged="AllCheckBox_CheckedChanged" />ȫѡ&nbsp;&nbsp;
<asp:LinkButton ID="lBtnDelete" runat="server" OnClick="lBtnDelete_Click">ɾ��</asp:LinkButton>
</div>
<div class="pagination">
    <p>
        <WEC:Pager ID="Pager" PageSize="25" PageIndex="0" runat="server" OnFired="Pager_Fired" />
    </p>
</div>
</asp:Panel>
<asp:Label ID="lblNoRecord" runat="server" Text=""></asp:Label>