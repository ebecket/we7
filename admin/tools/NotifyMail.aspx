<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotifyMail.aspx.cs" Inherits="We7.CMS.Web.Admin.NotifyMail"   %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>

<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="批量发送邮件">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="可以批量发送通知邮件给会员">
            </asp:Label>
        </span>
    </h2>
    <WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
    <table width="100%">
        <tbody id="user" style="display: block;">
            <tr>
                <td class="item_title" colspan="2">
                    接收邮件用户名称</td>
            </tr>
            <tr>
                <td class="vtop rowform">
			 <script type="text/javascript">
function isMaxLen(o){
var nMaxLen=o.getAttribute? parseInt(o.getAttribute("maxlength")):"";
 if(o.getAttribute && o.value.length>nMaxLen){
 o.value=o.value.substring(0,nMaxLen)
}}</script>
                    <textarea id="usernamelist" class="FormBase" cols="0" name="usernamelist" 
                        onblur="this.className='FormBase';" onfocus="this.className='FormFocus';" 
                        onkeyup="return isMaxLen(this)" rows="0" style="height: 40px; width: 400px;" runat="server"></textarea>
                要发送的用户名列表,以&quot;,&quot;进行分割</td>
                <td class="vtop">
                    </td>
            </tr>
        </tbody>
        <tr>
            <td class="item_title" colspan="2">
                邮件标题</td>
        </tr>
        <tr>
            <td class="vtop rowform">
                <input id="subjectInput" class="txt" name="subject" onblur="this.className='txt';"  runat="server"
                    onfocus="this.className='txt_focus';" size="30" style="width: 400px;" 
                    type="text" /><span id="_ctl0" controltovalidate="subject" 
                    display="Dynamic" errormessage="&lt;font color=red&gt;请务必输入内容!&lt;/font&gt;" 
                    evaluationfunction="RequiredFieldValidatorEvaluateIsValid" initialvalue="" 
                    style="color: Red; display: none;"><font color="red">请务必输入内容!</font></span>
            </td>
            <td class="vtop">
            </td>
        </tr>
        <tr>
            <td class="item_title" colspan="2">
                邮件内容</td>
        </tr>
        <tr>
            <td class="vtop rowform">
                <textarea id="body_posttextarea" cols="80" name="body:posttextarea"  runat="server"
                    onblur="this.className='';" onfocus="this.className='areamouseover';" rows="18"></textarea>
            </td>
            <td class="vtop">
            </td>
        </tr>
    </table>
    <div class="Navbutton">
        <asp:Button ID="BatchSendEmail"  class="Btn"  runat="server"  type="button" 
            Text="发送" onclick="BatchSendEmail_Click" />
    </div>

</asp:Content>
