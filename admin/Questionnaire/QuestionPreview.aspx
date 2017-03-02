<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/theme/classic/ContentNoMenu.Master" AutoEventWireup="true" CodeBehind="QuestionPreview.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionPreview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
   <link href="Style/Style.css" rel="stylesheet" type="text/css" />
   <style>
       #QuestionBody {padding:10px;}
   </style>

  <div class="wrap">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="问卷预览">
        </asp:Label>
        <span class="summary"></span>
    </h2>
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 问卷预览
    </div>
  </div>
  <div id="QuestionBody">
  
  </div>
  <script type="text/javascript">
      $.get("Ajax/Ajax.ashx?act=LoadQst&IsEdit=false&ID=<%=ID %>", function (_result_) {
          $("#QuestionBody").html(_result_);
      })
  </script>
</asp:Content>
