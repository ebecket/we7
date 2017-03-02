<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.Bar.cs" Inherits="We7.CMS.Web.Widgets.Search_Bar" %>

<script type="text/C#" runat="server">
    [ControlDescription("Search_Bar")]
    string MetaData;
</script>

<div class="<%=CssClass %>" id="search">
    <span class="l"></span><span class="r"></span>
    <form action="Search.aspx" method="get">
    <p>
        <input type="text" name="keywords" /></p>
    <button type="button">
        搜索</button>
    </form>
</div>

<script type="text/javascript">
    $(function() {
        $("#search button").click(function() {
            var form = $("#search form")
            if (form.find("input").val()) {
                form.submit();
            } else {
                alert("请输入要搜索的关键词！");
            }
        });
    });
</script>

