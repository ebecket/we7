<%@ Control Language="C#" AutoEventWireup="true" Codebehind="db_backup.ascx.cs"
    Inherits="We7.CMS.Web.Admin.controls.db_backup" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»数据库备份<br />
            <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info">数据库备份为压缩包，您可以下载到本地妥善保存。</label>
        </dt>
    </dl>
    <div style="display:table;width:100%;padding-left:50px">
       <p>
            <h3 class="summary2">
            备份文件名：
            </h3>
            <asp:TextBox  ID="DatabaseTextBox" runat="server"  Width="150" Enabled="true" ></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="ExecuteButton" runat="server" Height="25px" OnClick="ExecuteButton_Click"
            Text="开始备份" Width="151px" class="Btn" /><br />
        </p>
    </div>
    <div>
     <asp:Literal runat="server" ID="FileListLiteral"></asp:Literal>
    </div>
</div>
