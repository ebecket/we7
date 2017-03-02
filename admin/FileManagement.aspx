<%@ Page Language="C#" AutoEventWireup="true" Codebehind="FileManagement.aspx.cs"
    Inherits="We7.CMS.Web.Admin.FileManagement" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

<input type="hidden" id="hdDemoSite"
             value='<%= We7.Framework.Config.GeneralConfigs.GetConfig().IsDemoSite.ToString().ToLower() %>' />
    <script type="text/javascript">
function showFolder(dir, filter) {
    weShowModelDialog("Folder.aspx?folder=" + dir + "&filter=" + filter+"&UploadID=<%=Guid.NewGuid() %>");
}

function showTemplates() {
    showFolder("<%=TemplatePath %>", "*");
}

function showImages() {
    showFolder("_data", "*");
}
    </script>
<script language="javascript">
var StyleSheetPath="<%=ThemePath%>/";
function switchSysBar()
{
    var obj = document.getElementById("switchPoint");
    if (obj.alt == "�ر���Ŀ��")
    {
        obj.alt = "����Ŀ��";
        obj.src = "" + StyleSheetPath + "Images/tree_open.gif";
        document.getElementById("frmTitle").style.display="none";
    }
    else
    {
        obj.alt = "�ر���Ŀ��";
        obj.src = "" + StyleSheetPath + "Images/tree_close.gif";
        document.getElementById("frmTitle").style.display="";
    }
}
</script>
       <h2 class="title">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_article.gif" />
            <asp:Label ID="NameLabel" runat="server" Text="����վ���ļ�">
            </asp:Label>
            <span class="summary">
                <asp:Label ID="SummaryLabel" runat="server" Text="">
                �����ʹ���ļ������ܣ�ĳЩ�����ܿ��ܵ���վ���޷��������С�
                </asp:Label>
            </span>
        </h2>

        <script type="text/javascript" src="<%=AppPath%>/ajax/FolderTreeController.js"></script><!-- ��ʼ�� -->
        <table style="border:solid 0px #eee; width:100%"><tr>
        <td style="width:170px" valign="top" id="frmTitle">
        <div id="tree-div" style="overflow:visible; height:400px;width:170px;border:0px solid #fff; "></div>
        </td>
        <td onclick="switchSysBar()"  valign="top"  style="cursor:hand;width: 12px">
                <img id="switchPoint" src="<%=ThemePath%>/images/tree_close.gif" alt="�ر���Ŀ��" style="border: 0px;
                   " />
        </td>
        <td align="left" valign="top" >
                 <div id="rightTabs" >
                 <iframe  id="ifRightDetail" name="ifRightDetail" frameborder="0" src="Help/WelcomeToFiles.aspx" height="300" width="100%" scrolling="no"  height="500" ></iframe>
                 </div>
        </td></tr>
        </table> 
          <script language="javascript">
        function initIframeSrc()
        {
            if(QueryString('folder') && QueryString('folder') !="")
            {
                var url="Folder.aspx?noSelect=1&folder="+QueryString('folder');
                 if(document.getElementById("ifRightDetail"))
                        document.getElementById("ifRightDetail").src=url;
            }
        }
        initIframeSrc();
        </script>
</asp:Content>
