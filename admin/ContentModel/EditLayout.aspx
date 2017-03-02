<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/theme/classic/content.Master"
    AutoEventWireup="true" CodeBehind="EditLayout.aspx.cs" Inherits="We7.CMS.Web.Admin.ContentModel.EditLayout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="内容模型页面布局"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="包括录入表单的自定义与管理用列表的自定义">
            </asp:Label>
        </span>
    </h2>
    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/tags.css" media="all" />
    <link href="/Admin/Ajax/jquery/ui1.8.1/css/ui-lightness/jquery-ui-1.8.1.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="/Admin/ContentModel/js/Common.js" type="text/javascript"></script>
    <script src="/Admin/Ajax/jquery/ui1.8.1/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
    <link href="/Admin/ContentModel/css/formbuilder.css" rel="stylesheet" type="text/css" />
    <script src="<%=AppPath%>/cgi-bin/article.js" type="text/javascript"></script>
    <script src="<%=AppPath%>/cgi-bin/cookie.js" type="text/javascript"></script>
    <script src="<%=AppPath%>/cgi-bin/tags.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function iframeAutoFit() {
            try {
                if (window != parent) {
                    var a = parent.document.getElementsByTagName("IFRAME");
                    for (var i = 0; i < a.length; i++) //author:meizz
                    {
                        if (a[i].contentWindow == window) {
                            var h1 = 0, h2 = 0;
                            a[i].parentNode.style.height = a[i].offsetHeight + "px";
                            a[i].style.height = "10px";
                            if (document.documentElement && document.documentElement.scrollHeight) {
                                h1 = document.documentElement.scrollHeight;
                            }
                            if (document.body) h2 = document.body.scrollHeight;
                            var h = Math.max(h1, h2);
                            if (document.all) { h += 4; }
                            if (window.opera) { h += 1; }
                            a[i].style.height = a[i].parentNode.style.height = h + "px";
                        }
                    }
                }
            }
            catch (ex) { }
        }
        if (window.attachEvent) {
            window.attachEvent("onload", iframeAutoFit);
        }
        else if (window.addEventListener) {
            window.addEventListener('load', iframeAutoFit, false);
        }
    </script>
    <script type="text/javascript" src="/Admin/cgi-bin/CheckBrowser.js"></script>
    <div id="mycontent">
        <div class="Tab menuTab">
            <ul class="Tabs">
                <asp:Label runat="server" ID="MenuTabLabel"></asp:Label>
            </ul>
        </div>
        <div class="clear">
        </div>
        <div id="rightWrapper">
            <div id="container" style="display: table">
                <asp:PlaceHolder runat="server" ID="ContentHolder"></asp:PlaceHolder>
            </div>
        </div>
    </div>
    <!---formbuilder-->
    <script src="/Admin/ContentModel/js/FormBuilder/Jquery.extend.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/We7.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Control.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Field.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/TextBox.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/CheckBox.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/CheckBoxList.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/DropdownList.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/FileUpload.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Password.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/RadioButton.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/RadioButtonList.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/TextArea.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/SelectInput.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/CategoryDropdownList.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/GovSN.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/DepartmentEx.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Editor.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/XMLSelect.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/GUID.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Number.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/DateTime.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/DateTimeLabel.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/ChannelSelect.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Thumbnail.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Label.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/RelationSelect.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/Attachment.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/ThumbnailEx.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/TypeProperty.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/ChildrenTable.js" type="text/javascript"></script>
    <script src="/Admin/ContentModel/js/FormBuilder/ChildrenTableHorizontal.js" type="text/javascript"></script>
	<script src="/Admin/ContentModel/js/FormBuilder/MultiUploadify.js" type="text/javascript"></script>
</asp:Content>
