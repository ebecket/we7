<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Subject_Rule.ascx.cs" Inherits="We7.CMS.Web.Admin.ScoreManager.Controls.Subject_Rule" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
 <div class="toolbar">
   <a href="/admin/ScoreManager/EditScoreRule.aspx?subject=<%=SubjectID %>">新增</a>
   <a href="/admin/ScoreManager/EditScoreSubject.aspx?id=<%=SubjectID %>&tab=3">刷新</a>
   <a href="/admin/ScoreManager/ScoreSubjectList.aspx">返回</a>
</div>
<WEC:MessagePanel ID="Msg" runat="server" Width="900px">
</WEC:MessagePanel>
<div class="list">
    <asp:GridView ID="RulesGridView" runat="server" AutoGenerateColumns="False"
                 CssClass="List" EmptyDataText="暂无数据!" CellPadding="0" CellSpacing="0" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="序号">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>                
            <asp:BoundField HeaderText="规则名称" DataField="Name" />
            <asp:BoundField HeaderText="显示名称" DataField="Title" />
            <asp:TemplateField HeaderText="来源ID">
                <ItemTemplate>
                    <%# Eval("Source.Title")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="分数" DataField="Score" />
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                     <a href="/admin/ScoreManager/EditScoreRule.aspx?subject=<%# Eval("SubjectID") %>&id=<%# Eval("ID") %>">编辑</a>|
                     <asp:LinkButton ID="deleteButton" runat="server" 
                        OnClientClick="return confirm('确认删除？');" OnCommand="onLineButton_Click" 
                        Text="删除" CommandArgument='<%# Eval("ID") %>' CommandName="DeleteRule" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>       

</div>
