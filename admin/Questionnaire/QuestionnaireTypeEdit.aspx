<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireTypeEdit.aspx.cs"
    Inherits="We7.CMS.Web.Admin.QuestionnaireTypeEdit" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" %>

<%--MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master"--%>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<%--<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">--%>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script language="JavaScript" type="text/javascript">
        function display1(Q_subtree, Q_img) {

            if (Q_subtree.style.display == "none") {
                Q_subtree.style.display = "";
                Q_img.src = "image/tree_collapse.gif";
            }
            else {
                Q_subtree.style.display = "none";
                Q_img.src = "image/tree_expand.gif";
            }
        }

        function del_sort(id, tag) {

            if (tag.toLowerCase() == "false") {
                var msg = window.confirm("该目录下的问卷也会被删除,\n你真的要删除该目录吗?");
                if (msg == true) {
                    var hdfDelID = document.getElementById("<%=hdfDelID.ClientID %>");
                    hdfDelID.value = id;
                    var btnDel = document.getElementById("<%=btnDel.ClientID %>");
                    btnDel.click();
                }
            }
            else
                alert("该目录下还有子目录,不能删除!");
        }

        function chang_news_sort(id, type_name) {
            var hdfUpdate = document.getElementById("<%=hdfUpdate.ClientID %>");
            var oldName = document.getElementById("OldName");
            oldName.readOnly = false;
            oldName.value = type_name;
            hdfUpdate.value = id;
            oldName.readOnly = true;
        }

        function Update() {
            var newName = document.getElementById("NewName").value;
            var txtNewName = document.getElementById("<%=txtNewName.ClientID %>");
            var btnUpdate = document.getElementById("<%=btnUpdate.ClientID %>");
            txtNewName.value = newName;
            btnUpdate.click();
        }
        function Cancel() {
            var oldName = document.getElementById("OldName");
            oldName.readOnly = false;
            oldName.value = "";
            oldName.readOnly = true;
            document.getElementById("NewName").value = "";
        }
        function Add() {
            var typeName = document.getElementById("typeName").value;
            var txtTypeName = document.getElementById("<%=txtTypeName.ClientID %>");
            var btnAdd = document.getElementById("<%=btnAdd.ClientID %>");
            txtTypeName.value = typeName;
            btnAdd.click();
        }
    </script>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
    <h2 class="title">
        <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="TitleLabel2" runat="server" Text="问卷类别管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="">
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <a href="CatTypeMgr.aspx">自定义类别</a>><a href="CategoryList.aspx?typeId="></a>><asp:Literal
            ID="TitleLabel" runat="server" Text="数据项"></asp:Literal></div>
    <div id="DIV1">
        <div id="conbox">
            <table width="100%" cellspacing="0" cellpadding="5" border="0" align="center" class="p9"
                bordercolordark="#FFFFFF" bordercolorlight="#000000">
                <tbody>
                    <tr>
                        <td width="50%" valign="top" height="206" align="center" class="p9">
                            <table width="100%" height="199" cellspacing="2" cellpadding="2" border="0" class="p9">
                                <tbody>
                                    <tr>
                                        <td height="22" bgcolor="#f0f0f0">
                                            现有问卷目录列表：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="center">
                                            <table width="300" cols="5" cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td width="16" style="line-height: 16px;">
                                                        </td>
                                                        <td width="16" style="line-height: 16px;">
                                                        </td>
                                                        <td width="15" style="line-height: 16px;">
                                                        </td>
                                                        <td width="230" style="line-height: 16px;">
                                                        </td>
                                                        <td width="23" style="line-height: 16px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="16" style="line-height: 16px;">
                                                            <img border="no" src="Image/tree_collapse.gif">
                                                        </td>
                                                        <td colspan="3" style="line-height: 16px;">
                                                            目录名
                                                        </td>
                                                        <td>
                                                            删除
                                                        </td>
                                                    </tr>
                                                    <%
                                                        for (int i = 0; i < lsTypes.Count; i++)
                                                        {
                                                            string id = lsTypes[i].ID;
                                                            string name = lsTypes[i].TypeName;
                                                            bool isHasChildren = lsTypes[i].Children.Count > 0 ? true : false;
                                                    %>
                                                    <tr>
                                                        <td width="16" style="line-height: 16px;">
                                                            <img src='Image/<%=i==lsTypes.Count-1?"tree_end.gif":"tree_split.gif"%>'>
                                                        </td>
                                                        <td width="16" style="line-height: 16px;">
                                                            <span <%if(isHasChildren){%>onclick="javascript:display1(document.all.subtree<%=i%>,document.all.img<%=i%>);"
                                                                <%} %> style="" id="zhugan2">
                                                                <img width="15" id="img<%=i%>" name="img<%=i%>" height="16" border="0" src='Image/<%=isHasChildren?"tree_collapse.gif":"tree_leaf.gif"%>'>
                                                            </span>
                                                        </td>
                                                        <td colspan="2" style="line-height: 16px;">
                                                            <a onclick="javascript:chang_news_sort('<%=id%>','<%=name%>');" href="#here">
                                                                <%=name%></a>
                                                        </td>
                                                        <td width="23" style="line-height: 16px;">
                                                            <a href="javascript:del_sort('<%=id%>','<%=isHasChildren.ToString()%>')"><b>×</b></a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        if (isHasChildren)
                                                        {
                                                            List<We7.CMS.Common.QuestionnaireType> lsChildren = lsTypes[i].Children;
                                                            string tempTab = "--";
                                                            for (int j = 0; j < lsChildren.Count; j++)
                                                            {
                                                                We7.CMS.Common.QuestionnaireType levleTwo = lsChildren[j];
                                                                
                                                           
                                                    %>
                                                    <tr id="subtree<%=i%>">
                                                        <td colspan="5" style="line-height: 16px;">
                                                            <table width="100%" cols="5" cellspacing="0" cellpadding="0" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="16" style="line-height: 16px;">
                                                                            <%=j == lsChildren.Count - 1 && i == lsTypes.Count - 1 ? "" : "<img src='Image/tree_vertline.gif' />"%> 
                                                                        </td>
                                                                        <td width="16" style="line-height: 16px;">
                                                                            <img src='Image/<%=j==lsChildren.Count-1?"tree_end.gif":"tree_split.gif"%>'>
                                                                        </td>
                                                                        <td width="15" style="line-height: 16px;">
                                                                            <img width="15" height="16" border="0" src="Image/tree_leaf.gif">
                                                                        </td>
                                                                        <td width="230" style="line-height: 16px;">
                                                                            <a onclick="javascript:chang_news_sort('<%=levleTwo.ID%>','<%=levleTwo.TypeName%>');"
                                                                                href="#here">
                                                                                <%=levleTwo.TypeName%></a>
                                                                        </td>
                                                                        <td width="23" style="line-height: 16px;">
                                                                            <a href="javascript:del_sort('<%=levleTwo.ID%>','false')"><b>×</b></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <%      }
                                                    }

                                                    }
                                                    %>
                                                    <input type="hidden" name="id"><input type="hidden" name="rootchild"><input type="hidden"
                                                        value="del" name="sort_action">
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td width="50%" valign="top" height="206" align="center" class="p9">
                            <table width="100%" height="96" cellspacing="2" cellpadding="2" border="0" class="box">
                                <tbody>
                                    <tr>
                                        <td height="22" bgcolor="#f0f0f0">
                                            新增问卷类别:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="8">
                                            目录名:
                                            <input type="text" style="width: 230px; height: 22px;" class="p9" name="typeName"
                                                id="typeName">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="21">
                                            所属于:
                                            <asp:DropDownList ID="ddlParent" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="2">
                                            操 作:
                                            <input type="button" class="p9" style="width: 60px; height: 22px;" value="新增" id="addButton"
                                                name="addButton" onclick="Add()" />
                                            <input type="reset" class="p9" style="width: 60px; height: 22px;" value="取消" name="cancelAdd" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br>
                            <table width="100%" height="84" cellspacing="2" cellpadding="2" border="0" class="box">
                                <tbody>
                                    <tr>
                                        <td height="22" bgcolor="#f0f0f0">
                                            修改问卷目录:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="2">
                                            原目录名:
                                            <input type="text" readonly="" style="width: 230px; height: 22px;" class="p9" name="OldName"
                                                id="OldName">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="2">
                                            新目录名:
                                            <input type="text" style="width: 230px; height: 22px;" class="p9" name="NewName"
                                                id="NewName">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="7">
                                            操 作:
                                            <input type="button" id="updateButton" class="p9" style="width: 60px; height: 22px;"
                                                value="修改" name="updateButton" onclick="Update()">
                                            <input type="reset" id="btnCancel" class="p9" style="width: 60px; height: 22px;"
                                                value="取消" name="btnCancel">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--</asp:Content>--%>
        <div style="display: none">
            <asp:HiddenField ID="hdfUpdate" runat="server" />
            <asp:Button ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click" />
            <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtTypeName" runat="server"></asp:TextBox>
            <input id="btnAdd" runat="server" type="button" onserverclick="btnAdd_Click" />
            <asp:HiddenField ID="hdfDelID" runat="server" />
            <asp:Button ID="btnDel" runat="server" Text="Save" OnClick="btnDel_Click" />
        </div>
</asp:Content>
