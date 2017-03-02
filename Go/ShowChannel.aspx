<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowChannel.aspx.cs" Inherits="We7.CMS.Web.ShowChannel" ValidateRequest="false" %>
<script type="text/C#" runat="server">
    protected override void Initialize()
    {
        if (ThisChannel == null && ColumnMode != "search")
        {
            Response.StatusCode = 404;            
            Response.End();
            return;
        }
        base.Initialize();
    }

</script>