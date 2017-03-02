<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkDetail.aspx.cs" Inherits="We7.CMS.Web.Admin.LinkDetail" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script src="<%=AppPath%>/cgi-bin/setday.js"></script> 
   <script language="javascript">
   function onSaveButtonClick() {
    document.getElementById("<%=SaveButton.ClientID %>").click();
}
   </script> 
                 <h2 class="title" >
                            <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
                            <asp:Label ID="LogLabel" runat="server" Text="友情链接编辑">
                            </asp:Label>
                            <span class="summary">
                                <asp:Label ID="LinkSummaryLabel" runat="server" Text="">
                                </asp:Label>
                            </span>
                        </h2>
                        <WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
                        <div class="toolbar">
                            <asp:HyperLink ID="ReturnHyperLink" NavigateUrl="Links.aspx" runat="server">
                                <asp:Image ID="CreateImage" runat="server" ImageUrl="~/admin/Images/icon_return.gif" />
                                返回</asp:HyperLink>
                                <span> </span>
                            <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="Links.aspx" runat="server">
                                <asp:Image ID="RefreshImage" runat="server" ImageUrl="~/admin/Images/icon_refresh.gif" />
                                刷新</asp:HyperLink>
                                <span> </span>
                                <asp:HyperLink ID="QueryHyperLink" NavigateUrl="javascript:onSaveButtonClick()" runat="server">
                                <asp:Image ID="QueryImage" runat="server" ImageUrl="~/admin/Images/icon_save.gif" />
                                保存
                            </asp:HyperLink>
                        </div>
                        <asp:Panel ID="MessagePanel" runat="Server" Visible="false">
                               <asp:Image ID="MessageImage" runat="server" ImageUrl="~/admin/Images/icon_warning.gif" />
                               <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                        </asp:Panel> 

                <div>
                            <table >
                             <tr>
                                    <th>
                                        项目
                                    </th>
                                    <th>
                                        内容
                                    </th>
                                    <th>
                                        &nbsp;
                                    </th>
                                </tr>
                                <tr valign="top">
                                    <td style="height: 30px">
                                        标题</td>
                                    <td>
                                        <asp:TextBox ID="TitleTextBox" runat="server"  Width="300px"></asp:TextBox>
                                    </td>                                    
                               </tr>
                                <tr valign="top">
                                    <td style="height: 30px">
                                        URL&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="UrlTextBox" runat="server"  Width="298px"></asp:TextBox>
                                    </td>                                    
                               </tr>
                                <tr valign="top">
                                    <td style="height: 30px">
                                        标签</td>
                                    <td>
                                        <asp:TextBox ID="TagTextBox" runat="server" ></asp:TextBox>
                                    </td>                                    
                               </tr>
                                <tr valign="top">
                                    <td style="height: 30px">
                                        顺序号</td>
                                    <td>
                                        <asp:TextBox ID="OrderName" runat="server" ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="OrderName"
                                            ErrorMessage="必须输入数字" ValidationExpression="^[0-9]{0,10}"></asp:RegularExpressionValidator></td>                                    
                               </tr>
                                <tr valign="top">
                                    <td style="height: 33px">
                                        图片&nbsp;</td>
                                    <td style="height: 33px">
                                        <asp:FileUpload ID="ImageFileUpload" runat="server" /></td>                                    
                               </tr>
                                <tr valign="top">
                                    <td style="height: 33px">
                                    </td>
                                    <td style="height: 33px">
                                        <asp:Image ID="ThumbnailImage" runat="server" Visible="false" /></td>
                                </tr>
                            </table> 
                           
                        </div>
                            <div style="display: none">
                                <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save" />
                            </div>
</asp:Content>
