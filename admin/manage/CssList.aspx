<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CssList.aspx.cs" Inherits="We7.CMS.Web.Admin.cssEditor.CssList" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

                 <h2 class="title" >
                            <span id="icon-page" ></span>
                            <asp:Label ID="NameLabel" runat="server" Text="Css样式管理">
                            </asp:Label>
                            <span class="summary">
                                <asp:Label ID="SummaryLabel" runat="server" Text="修改当前模板的样式文件">
                                </asp:Label>
                            </span>
                        </h2>
                        <div class="toolbar">
                            <asp:HyperLink ID="NewHyperLink" NavigateUrl="CssDetail.aspx" runat="server">
                                新建</asp:HyperLink>
                            <span> </span>
                            <%--<asp:HyperLink ID="UploadHyperLink" NavigateUrl="~/TemplateUpload.aspx" runat="server">
                                <asp:Image ID="UploadImage" runat="server" ImageUrl="~/admin/Images/icon_upload.gif" />
                                上传模板</asp:HyperLink>
                            <span>|</span>--%>
                            <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="CssList.aspx" runat="server">
                                刷新</asp:HyperLink>
                        </div>
                        <div>
                            <asp:GridView ID="CssGridView" runat="server" AutoGenerateColumns="False" CssClass="List"  GridLines="Horizontal"
                                ShowFooter="True">
                                <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="Name" DataNavigateUrlFormatString="CssDetail.aspx?file={0}"
                                        DataTextField="Name" DataTextFormatString="{0}" HeaderText="名称" />
                                    <asp:HyperLinkField DataNavigateUrlFields="Name" DataNavigateUrlFormatString="CssDelete.aspx?file={0}"
                                        DataTextField="Name" DataTextFormatString="删除" HeaderText="" />
                                </Columns>
                            </asp:GridView>
                        </div>
</asp:Content>

