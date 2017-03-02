<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navigation.ChannelNav.cs"
    Inherits="We7.CMS.Web.Widgets.Navigation_ChannelNav" %>

<script type="text/C#" runat="server">
    [ControlDescription(Desc = "Navigation_ChannelNav")]
    string MetaData;    
</script>

<div class="<%= CssClass %>">
    <strong>
        <%=Channel.Name%></strong>
</div>