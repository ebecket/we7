<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhotoUpload.ascx.cs"
    Inherits="We7.CMS.Web.Admin.ChannelModule.PhotoUpload" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»上传照片组<br>
            <img src="/admin/images/bulb.gif" align="absmiddle" /><label class="block_info">上传照片组。</label>
        </dt>
        <dd>
            <table id="personalForm" cellpadding="0" cellspacing="0" style="margin-bottom: 50px">
                <tr id="linkSpan" runat="server">
                    <td class="formTitle">
                        选择图片
                    </td>
                    <td class="formValue">
                        <asp:FileUpload Style="position: relative" ID="filePhotot" runat="server"></asp:FileUpload>
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">
                        尺寸
                    </td>
                    <td class="formValue">
                        <asp:DropDownList ID="ddlSize" runat="server">
                        </asp:DropDownList> <br/>如果仅作图片存档，请使用默认值240*160
                        <script type="text/javascript">
                            $("select option[value='240*160']:first").attr("selected", "selected");                        
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="padding-top: 15px; padding-left: 0px">
                        <input class="Btn" id="SaveButton2" runat="server" type="submit" value="添加图片" onserverclick="SaveButton_ServerClick"/>
                    </td>
                </tr>
            </table>
            <hr />
            <ul class="photo_list">
                <asp:Repeater ID="dlstPhotos" runat="server" OnItemCommand="dlstPhotos_ItemCommand">                   
                    <ItemTemplate>
                        <li>
                            <div style="padding: 3px; border: solid #e6e6e6 1px; background: #f6f6f6; margin-bottom: 5px;">
                                <a href="<%# Container.DataItem.ToString().Replace("_S.", ".") %>" target="_blank"><img src="<%# Container.DataItem %>" style="border: 0;" alt="" /></a>
                            </div>
                            <asp:Button ID="bttnDel" runat="server" Text="删除" CommandName="del" />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </dd>
    </dl>
</div>
