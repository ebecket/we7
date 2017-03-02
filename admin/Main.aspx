<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" Inherits="We7.CMS.BasePage" %>

<script type="text/C#" runat="server">
    protected override bool NeedAnAccount
    {
        get
        {
            return false;
        }
    }
    protected override bool NeedAnPermission
    {
        get
        {
            return false;
        }
    }    
 
    protected void Page_Load(object sender, EventArgs e)
    {           
    }    
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
   <iframe name="main" id="main" width="100%" height="700" src="<%=Request.QueryString["url"].ToString() %>" scrolling="auto" frameborder="0"></iframe>
</asp:Content>
