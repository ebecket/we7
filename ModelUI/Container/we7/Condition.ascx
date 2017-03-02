<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Condition.ascx.cs" Inherits="We7.Model.UI.Container.we7.Condition" %>
<script type="text/C#" runat="server">

    protected override void LoadContainer()
    {
        InitContainer();
        InitQueryParamHandler(delegate(We7.Model.Core.PanelContext ctx)
        {
            string OwnerID = Request["oid"];
            if (OwnerID != null)
            {
                ctx.QueryFields["OwnerID"] = OwnerID;
                ctx.QueryFields.IndexOf("OwnerID").Operator = We7.Model.Core.OperationType.EQUER;
            }
        });
        if (!IsPostBack)
        {
            Refresh();
        }        
    }
</script>

<div style="display: block; width: 100%">
    <table id="tblQuery" runat="server" cellpadding="0" style="width: auto;" cellspacing="1">
        <tr runat="server" id="trQuery">
            <td>
                <asp:Button ID="bttnQuery" CommandName="query" runat="server" Text="查询" OnClick="bttnQuery_Click"
                    CssClass="button_style" />
            </td>
        </tr>
    </table>
    <ul class="subsubsub">
        <li>
            <asp:LinkButton ID="lnkAll" CommandName="query" OnClick="lnkAll_Click" runat="server"
                CssClass="current">全部<span class="count">(<%=GetCount(ArticleStates.All)%>)</span></asp:LinkButton>|</li><li>
                    <asp:LinkButton ID="lnkPublish" CommandName="query" OnClick="lnkPublish_Click" runat="server">已发布<span class="count">(<%=GetCount(ArticleStates.Started)%>)</span></asp:LinkButton>|</li><li>
                        <asp:LinkButton ID="lnkDraft" CommandName="query" OnClick="lnkDraft_Click" runat="server">草稿<span class="count">(<%=GetCount(ArticleStates.Stopped)%>)</span></asp:LinkButton>|</li><li>
                            <asp:LinkButton ID="lnkAudit" CommandName="query" OnClick="lnkAudit_Click" runat="server">审核中<span class="count">(<%=GetCount(ArticleStates.Checking)%>)</span></asp:LinkButton>|</li><li>
                                <asp:LinkButton ID="lnkOverdue" CommandName="query" OnClick="lnkOverdue_Click" runat="server">过期<span class="count">(<%=GetCount(ArticleStates.Overdued)%>)</span></asp:LinkButton></li>
    </ul>
    <ul class="subsubsub" style="display: none;">
        <asp:Literal ID="StateLiteral" runat="server"></asp:Literal>
        <asp:Literal ID="IncludeSubLiteral" runat="server"></asp:Literal>
    </ul>
    <p>
    </p>
</div>
