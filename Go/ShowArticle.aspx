<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowArticle.aspx.cs" Inherits="We7.CMS.Web.ShowArticle" ValidateRequest="false" %>
<script type="text/C#" runat="server">
    protected override void Initialize()
    {
        if (string.IsNullOrEmpty(ModelName) && ThisArticle == null)
        {
            Response.StatusCode = 404;
            Response.End();
            return;
        }
        base.Initialize();
    }
</script>