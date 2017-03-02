<%@ Page Language="c#" AutoEventWireup="false" Inherits="We7.CMS.Install.upgrade" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%=header%>
<body class="pubbox_login">
    <form id="Form1" method="post" runat="server">
    <div>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="12" bgcolor="#999"
            class="login">
            <tr>
                <td bgcolor="#ffffff">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="8">
                                    <tr>
                                        <td align="left">
                                            <h1>
                                                升级<%=ProductBrand%>站点引擎</h1>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-left: 80px; padding-right: 20px;">
                                <label id="ShowErrorLabel" runat="server" style="display: none; color: #FF3300; font-size: x-large;
                                    font-weight: bold; width: 80%; height: 120px;">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="180">
                                <%=logo%>
                            </td>
                            <td valign="top" width="520">
                                <asp:Panel runat="server" ID="NewversionPanel" Visible="false" Font-Bold="true">
                                    <h2>
                                        <asp:Label runat="server" ID="NewVersionLabel"></asp:Label></h2>
                                    <p style="margin-bottom: 10px">
                                        <asp:Button ID="DownloadInstallButton" runat="server" Text="自动升级" Enabled="true"
                                            class="bprimarypub80"></asp:Button>
                                        <asp:HyperLink ID="DownloadLocalHyperLink" runat="server" Text="下载升级包到本地" Enabled="true"
                                            class="bprimarypub80"></asp:HyperLink>
                                    </p>
                                    <hr style="height: 1px; text-align: left" />
                                </asp:Panel>
                                <div>
                                    请先在本地文件夹下选择 .ZIP更新包，或.DLL文件，.XML数据库结构文件，然后分两步点击按钮进行更新：（1）上传；（2）更新<br />
                                    <asp:FileUpload runat="server" ID="UpdateFileUpload" CssClass="Btn" />
                                   
                                    <p>
                                     <br />
                                    （1）
                                    <asp:Button ID="UploadButton" runat="server" Text="上传更新包" Enabled="true" CssClass="Btn">
                                    </asp:Button>
                                    </p>
                                    <p>
                                        <asp:Label runat="server" ID="UploadSummary"></asp:Label>
                                    </p>
                                    <p>
                                        <asp:Literal runat="server" ID="UnZipLiteral"></asp:Literal>
                                    </p>
                                    <asp:Panel runat="server" ID="BackUpPanel" Visible="false">
                                        <br />
                                        <asp:CheckBox runat="server" ID="BackUpCheckBox" Text="覆盖之前备份原来系统文件" />（/_backup/2.0.0.backup.zip）
                                        <br />
                                        <asp:CheckBox runat="server" ID="ClearOldCheckBox" Text="清除掉旧文件" />
                                        <span style="color: Red">（注：如果您的根目录下新增了自有文件夹，请去掉勾，升级完成后手工删除！） </span>
                                        <br />
                                    </asp:Panel>
                                    <br />
                                    <p>
                                    （2）
                                     <asp:Button ID="CopyFilesButton" runat="server" Text="开始更新" Enabled="true" class="Btn">
                                    </asp:Button>
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <div style="margin: 10px 20px 30px 10px; text-align: right">
                                   
                                   <input type="button" onclick="javascript:window.location.href='succeed.aspx';"  Enabled="true" class="bprimarypub80" ID="FinishButton" runat="server" value="更新完毕!"  />
                                  <%-- 	  	<input type="button" onclick="javascript:window.location.href='succeed.aspx';"  Enabled="true" class="bprimarypub80" ID="ResetButton" runat="server" value="重启网站"  />--%>
                                    	<input type="button" onclick="javascript:window.location.href='upgrade-db.aspx?from=upgrade.aspx';"  value="重建数据库" class="bprimarypub80" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <%=footer%>
    </form>
</body>
</html>
