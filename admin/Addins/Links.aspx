<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Links.aspx.cs" Inherits="We7.CMS.Web.Admin.Links" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls"
    TagPrefix="WEC" %>
<asp:content id="We7Content" contentplaceholderid="MyContentPlaceHolder" runat="server">
    <script src="<%=AppPath%>/cgi-bin/setday.js"></script>
    <script type="text/javascript">
  function SelectAll(tempControl) 
    { 
        var theBox=tempControl; 
        xState=theBox.checked;     

        elem=theBox.form.elements; 
        for(i=0;i<elem.length;i++) 
        if(elem[i].type=="checkbox" && elem[i].id!=theBox.id) 
        { 
        if(elem[i].checked!=xState) 
	        elem[i].click(); 
        } 
      }   
      
    function onDeleteButtonClick() {
        document.getElementById("<%=DeleteBtn.ClientID %>").click();
    }
   
   function onQueryButtonClick() {
        document.getElementById("<%=QueryButton.ClientID %>").click();
    }
     
    </script>
                 <h2 class="title" >
                            <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
                            <asp:Label ID="LogLabel" runat="server" Text="友情链接管理">
                            </asp:Label>
                            <span class="summary">
                                <asp:Label ID="LogSummaryLabel" runat="server" Text="">
                                </asp:Label>
                            </span>
                        </h2>
                        <div class="toolbar">
                            <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="Links.aspx" runat="server">
                                刷新</asp:HyperLink>
                            <span> </span>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="Linkdetail.aspx" runat="server">
                                添加</asp:HyperLink>
                            <span> </span>
                            <asp:HyperLink ID="DeleteHyperLink" NavigateUrl="javascript:onDeleteButtonClick();"
                                runat="server">
                                删除
                            </asp:HyperLink>
                            <span>  </span>
                            <asp:HyperLink ID="QueryHyperLink" NavigateUrl="javascript:onQueryButtonClick()"
                                runat="server">
                                查询
                            </asp:HyperLink>
                        </div>
                        <asp:Panel ID="QueryPanel" runat="server" Width="100%">
                            <table class='tree'>
                                <tr valign="top">
                                    <td style="height: 30px">
                                        名称
                                        <asp:TextBox ID="UserTextBox" runat="server"></asp:TextBox>&nbsp; 标签<asp:TextBox
                                            ID="TagTextBox" runat="server"></asp:TextBox></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="MessagePanel" runat="Server" Visible="false">
                            <asp:Image ID="MessageImage" runat="server" ImageUrl="~/admin/Images/icon_warning.gif" />
                            <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="LinkListPanel" runat="server" Width="100%" Visible="False">
                            <div style="min-height: 350px;">
                                <asp:GridView ID="DataGridView" runat="server" AutoGenerateColumns="False" Width="100%"
                                    ShowFooter="True" DataKeyNames="ID">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkHeader" runat="server" onclick="javascript:SelectAll(this);"
                                                    AutoPostBack="false" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkItem" runat="server" />
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="linkdetail.aspx?id={0}"
                                            DataTextField="Title" DataTextFormatString="{0}" HeaderText="标题">
                                            <HeaderStyle Width="200px" />
                                        </asp:HyperLinkField>
                                        <asp:BoundField HeaderText="标签" DataField="Tag"></asp:BoundField>
                                        <asp:BoundField HeaderText="时间" DataField="Created"></asp:BoundField>
                                         <asp:BoundField HeaderText="顺序号" DataField="OrderNumber"></asp:BoundField>
                                        <asp:TemplateField HeaderText="图片">
                                            <ItemTemplate>
                                                <%#CheckImage(Eval("Thumbnail"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField >
                    <ItemTemplate>
                      <a href="linkdetail.aspx?id=<%# Eval("ID") %>">编辑</a>
                    </ItemTemplate>
                </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="pagination">
                                <p>
                                    <WEC:Pager ID="Pager" PageSize="15" PageIndex="0" runat="server" OnFired="Pager_Fired" />
                                </p>
                            </div>
                        </asp:Panel>
                        <div style="display: none">
                            <asp:Button ID="QueryButton" runat="server" OnClick="QueryButton_Click" Text="Query" />
                            <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click" />
                        </div>
                        <asp:Panel ID="CreateNewPanel" runat="server" Width="100%" Visible="false">
                        </asp:Panel>
</asp:content>
