<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facultyDefault.aspx.cs" Inherits="SOE.OldDbWorker.facultyDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <fieldset>
            <legend>映射</legend>旧数据栏目：
            <asp:DropDownList ID="OldDbCate1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="OldDbCate2" runat="server">
            </asp:DropDownList>
            时间范围：
            <asp:TextBox runat="server" ID="StartTime"></asp:TextBox>
            -<asp:TextBox runat="server" ID="EndTime"></asp:TextBox>&nbsp;
            <asp:Button ID="ShowOldArticles" runat="server" Text="显示栏目下文章" OnClick="ShowOldArticles_Click" />&nbsp;
            <asp:Button ID="Button1" runat="server" Text="显示多点系统文章" onclick="Button1_Click" />
            <br />
            <br />
            新数据库栏目：
            <asp:DropDownList ID="NewDbCate" runat="server">
            </asp:DropDownList>&nbsp;
            <asp:Button ID="ImportToNewDb" runat="server" Text="导入教师简介" 
                OnClick="ImportToFaculty_Click" />&nbsp;
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="导入教师简介(英)" 
                onclick="Button2_Click" />
            成功：<asp:Label ID="Finish" runat="server" Text="0"></asp:Label>条 失败：<asp:Label ID="Fail"
                runat="server" Text="0"></asp:Label>条
        </fieldset>
        <fieldset>
            <legend>数据</legend>共有<asp:Label ID="Total" runat="server" Text="0"></asp:Label>
            条
            <asp:GridView ID="Articles" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                PageSize="10" OnPageIndexChanging="Articles_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Title" HeaderText="标题" />
                    <asp:BoundField DataField="UpDateTime" HeaderText="发布时间" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="Articles1" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                PageSize="10" OnPageIndexChanging="Articles_PageIndexChanging1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Title" HeaderText="标题" />
                    <asp:BoundField DataField="UpDateTime" HeaderText="发布时间" />
                </Columns>
            </asp:GridView>
        </fieldset>
    </div>
    </form>
    <asp:Label ID="Msg" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="SucMsg" runat="server" Text=""></asp:Label>
</body>
</html>
