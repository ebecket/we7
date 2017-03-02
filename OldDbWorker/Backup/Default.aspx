<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SOE.OldDbWorker.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <fieldset>
            请将旧access数据库拷贝至app_data，重命名为SOE.mdb。<br/>
            <legend>映射</legend>旧数据栏目：
            <asp:DropDownList ID="OldDbCate" runat="server">
            </asp:DropDownList>
            时间范围：
            <asp:TextBox runat="server" ID="StartTime"></asp:TextBox>
            -<asp:TextBox runat="server" ID="EndTime"></asp:TextBox>
            <asp:Button ID="ShowOldArticles" runat="server" Text="显示栏目下文章" OnClick="ShowOldArticles_Click" />
            <asp:Button ID="ShowOldLectures" runat="server" Text="显示讲座" OnClick="ShowOldLectures_Click" />
            <br />
            <br />
            新数据库栏目：
            <asp:DropDownList ID="NewDbCate" runat="server">
            </asp:DropDownList>
            <asp:Button ID="ImportToNewDb" runat="server" Text="导入文章至新数据库" OnClick="ImportToNewDb_Click" />
            <asp:Button ID="ImportLecturesToNewDb" runat="server" Text="导入讲座至新数据库" OnClick="ImportLecturesToNewDb_Click" />
            成功：<asp:Label ID="Finish" runat="server" Text="0"></asp:Label>条 失败：<asp:Label ID="Fail"
                runat="server" Text="0"></asp:Label>条
        </fieldset>
        <fieldset>
            <legend>数据</legend>共有<asp:Label ID="Total" runat="server" Text="0"></asp:Label>
            条
            <asp:GridView ID="Articles" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                PageSize="10" OnPageIndexChanging="Articles_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="PubID" HeaderText="ID" />
                    <asp:BoundField DataField="PubName" HeaderText="标题" />
                    <asp:BoundField DataField="PubTime" HeaderText="发布时间" />
                    <asp:BoundField DataField="UserID" HeaderText="发布人" />
                    <asp:BoundField DataField="FileMun" HeaderText="附件" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="Lectures" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                PageSize="10" OnPageIndexChanging="Lectures_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="LectureID" HeaderText="ID" />
                    <asp:BoundField DataField="LectureName" HeaderText="讲座人" />
                    <asp:BoundField DataField="Lecture" HeaderText="主题" />
                    <asp:BoundField DataField="LectureTime" HeaderText="时间" />
                    <asp:BoundField DataField="LectureAddress" HeaderText="地点" />
                </Columns>
            </asp:GridView>
        </fieldset>
    </div>
    </form>
    <asp:Label ID="Msg" runat="server" Text=""></asp:Label>
</body>
</html>
