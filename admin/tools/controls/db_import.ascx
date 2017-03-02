<%@ Control Language="C#" AutoEventWireup="true" Codebehind="db_import.ascx.cs"
    Inherits="We7.CMS.Web.Admin.controls.db_import" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<script type="text/javascript">
var ok=true;
function hideall()
{
            hide("tr1");
            hide("tr2");
            hide("tr3");
            hide("tr4");
            hide("tr5");
            document.getElementById("<%=DbTypeDropDownList.ClientID %>").selectValue = 0;
}
function DbTypeChange(type)
{
    switch(type)
    {
        case "SqlServer":
        case "MySql":
            show("tr1");
            show("tr2");
            show("tr3");
            show("tr4");
            hide("tr5");
            break;
        case "Oracle":
            show("tr1");
            hide("tr2");
            show("tr3");
            show("tr4");
            hide("tr5");
            
            break;
        case "SQLite":
        case "Access":
            hide("tr1");
            hide("tr2");
            hide("tr3");
            hide("tr4");
            show("tr5");
        break;
        default:
            hideall();
            break;
    }
}

function SelectChange()
{
    DbTypeChange(document.getElementById("<%=DbTypeDropDownList.ClientID %>").value);
    ok=true;
}

function hide(id)
{
    document.getElementById(id).style.display = "none";
}

function show(id)
{
    document.getElementById(id).style.display = "";
}
</script>
<WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»数据库导入<br />
            <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info">您可以将其他子站点或以前备份的数据库数据导入现有网站</label>
        </dt>
    </dl>
    <div style="display:table;width:100%;padding-left:50px">
    <p>
     <h3 class="summary2">您要导入哪个数据库的数据？注意：请确保您要导入的数据库在现在库中已有完整结构的空库，并有对应的XML映射文件！</h3>
     <h3 class="summary2" style="color:Red">警告：导入为替代性数据导入，您导入的目标数据库中对应的数据表将会被清空！</h3>
    </p>
    <table cellspacing="0" cellpadding="8" style="width:300px" border="0" >
                <tr>
                    <td style="background-color: #f5f5f5">
                        数据库类型:</td>
                    <td style="background-color: #f5f5f5; ">
                    <asp:DropDownList ID="DbTypeDropDownList" runat="server" onchange="SelectChange(this)">
                            <asp:ListItem Value="0">请选择数据库类型</asp:ListItem>
                            <asp:ListItem Value="SqlServer">SqlServer</asp:ListItem>
                            <asp:ListItem Value="MySql">MySql</asp:ListItem>
                            <asp:ListItem Value="Oracle">Oracle</asp:ListItem>
							<asp:ListItem Value="SQLite">SQLite</asp:ListItem>
                            <asp:ListItem Value="Access">Access</asp:ListItem>
                      </asp:DropDownList>
                    </td>
                </tr>
                <tr id="tr1">
                    <td style="background-color: #f5f5f5">
                        服务器名或IP地址:</td>
                    <td style="background-color: #f5f5f5;  ">
                    <asp:TextBox  ID="ServerTextBox" runat="server" Width="150" Enabled="true" >(local)</asp:TextBox>
                     </td>
                </tr>
                <tr id="tr2">
                    <td style="background-color: #f5f5f5">
                        数据库名称:</td>
                    <td style="background-color: #f5f5f5;  ">
                    <asp:TextBox  ID="DatabaseTextBox" runat="server"  Width="150" Enabled="true" >We7_CMS</asp:TextBox>
                     </td>
                </tr>
                <tr id="tr3">
                    <td style="background-color: #f5f5f5">
                        数据库用户名称:</td>
                    <td style="background-color: #f5f5f5; ">
                    <asp:TextBox  ID="UserTextBox" runat="server" Enabled="true"  Width="150"></asp:TextBox>
                     *<span id="msg3"></span></td>
                </tr>
                <tr id="tr4">
                    <td style="background-color: #f5f5f5">
                        数据库用户密码:</td>
                    <td style="background-color: #f5f5f5;  ">
                    <asp:TextBox   ID="PasswordTextBox" runat="server"  Width="150" Enabled="true"
                            TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr id="tr5">
                    <td style="background-color: #f5f5f5">
                        数据库文件:</td>
                    <td style="background-color: #f5f5f5;  ">
                    <asp:TextBox  ID="DbFileNameTextBox" runat="server"  Width="150px"   ></asp:TextBox>
                    默认路径/App_Data/DB下
                     </td>
                </tr>
                  <tr>
                    <td></td>
                    <td >
                    
                   </td>
                </tr>
    </table>
    
    <asp:Button ID="ExecuteButton" runat="server" Height="25px" OnClick="ExecuteButton_Click"
            Text="开始导入" Width="151px" class="Btn" /><br />
    </div>
     <script type="text/javascript">
            hideall();
    </script>
</div>
