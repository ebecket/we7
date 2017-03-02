<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="We7.Model.UI.Container.we7.List" %>
<link href="/ModelUI/skin/List.css" rel="stylesheet" type="text/css" />
<asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" OnRowEditing="gvList_RowEditing"
	OnRowDeleting="gvList_RowDeleting" CssClass="List" CellPadding="0" GridLines="Horizontal"
	RowStyle-VerticalAlign="Top" CellSpacing="0" ShowHeader="true" OnRowDataBound="gvList_RowDataBound"
	OnRowCommand="gvList_RowCommand" BorderWidth="1">
	<AlternatingRowStyle CssClass="alter" HorizontalAlign="Center" />
	<RowStyle HorizontalAlign="Center" />
	<HeaderStyle HorizontalAlign="Center" />
	<Columns>
		<asp:TemplateField>
			<ItemStyle Width="25" HorizontalAlign="Center" />
			<HeaderStyle Width="25" HorizontalAlign="Center" />
			<HeaderTemplate>
				<asp:CheckBox ID="chkID" runat="server" onclick="$('input[type=checkbox]').attr('checked', this.checked)" />
				<%--<input type="checkbox" onclick="$('input[type=checkbox]').attr('checked', this.checked)" />--%>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:CheckBox ID="chkID" runat="server" />
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
<div class="ulList">
	<ul id="ulList" runat="server" visible="false">
	</ul>
	<div style="clear: left">
	</div>
</div>
<div style="visibility: hidden">
	<asp:Button ID="DelBtn" runat="server" Text="Button" OnClick="DelBtn_Click" />
	<input id="delID" runat="server" type="hidden" />
</div>
<script type="text/javascript">
	function Del(id) {
		if (confirm("确认删除？")) {
			$("#<%=delID.ClientID %>").val(id);
			$("#<%=DelBtn.ClientID %>").click();
		} 
	}
	function Edit(url) {
		document.location.href = url;
	}
	$(".actionbar input").click(function () {
		$(".actionbar input:checked").each(function (i) {
			$("#<%=delID.ClientID %>").val($("#<%=delID.ClientID %>").val()+"|"+$(this).attr("class"));
		});
		
	});
</script>
