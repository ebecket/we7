<%@ Page Title="" Language="C#" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master"
    AutoEventWireup="true" CodeBehind="QuestionDesinger.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionDesigner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
    <link href="Style/Style.css" rel="stylesheet" type="text/css" />

  <div class="wrap">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="问卷编辑">
        </asp:Label>
        <span class="summary"></span>
    </h2>
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 问卷编辑
    </div>
  </div>

    <ul id="QuestionType">
        <li><a id="#RadioQuestion" href="javascript:Qst.QstCrt('radio')">单选题</a></li>
        <li><a id="#CheckboxQuestion" href="javascript:Qst.QstCrt('checkbox')">多选题</a></li>
        <li><a id="#TextQuestion" href="javascript:Qst.QstCrt('text')">填空题</a></li>
        <li style="float:right"><a href="#" onclick="GoPreview()">预览</a></li>
    </ul>
    <div id="RadioQuestion" onmouseup="this.style.display='none'" class="list">
        <ul>
            <li><a href="javascript:Qst.QstCrt('radio')">列表单选</a></li>
            <li><a href="javascript:Qst.QstCrt('radioOther')">组合单选</a></li>
            <li><a href="javascript:Qst.QstCrt('select')">下拉框</a></li>
        </ul>
    </div>
    <div id="CheckboxQuestion" onmouseup="this.style.display='none'" class="list">
        <ul>
            <li><a href="javascript:Qst.QstCrt('checkbox')">列表多选</a></li>
            <li><a href="javascript:Qst.QstCrt('checkboxOther')">组合多选</a></li>
        </ul>
    </div>
    <div id="TextQuestion" onmouseup="this.style.display='none'" class="list">
        <ul>
            <li><a href="javascript:Qst.QstCrt('text')">单行文本</a></li>
            <li><a href="javascript:Qst.QstCrt('multiLine')">多行文本</a></li>
            <li><a href="javascript:Qst.QstCrt('textarea')">填空题</a></li>
            <li><a href="javascript:Qst.QstCrt('custom')">自定义内容</a></li>
        </ul>
    </div>
    <div id="QuestionBody">
    </div>
    <div style="padding:10px; margin-top:20px;">
      <input type="button" name="edtRedirect" id="edtRedirect" value="完成" onclick="finish()" />
    </div>
    <script type="text/javascript" src="Js/QuestionDesigner.js"></script>
    <script type="text/javascript">
        if (Qst.GetUrlParms("QuestionnaireTypeID") == "") {
            alert("参数传递错误！");
            history.back();
        }
        else {
            Qst.LoadQuestion(Qst.GetUrlParms("QuestionnaireTypeID"));
        }

        function GoPreview() {
            window.location.href = 'QuestionPreview.aspx?QuestionnaireTypeID=' + Qst.GetUrlParms("QuestionnaireTypeID");
        }

        function finish() {
            debugger;
            var url = "QuestionnaireMng.aspx";
            var Parms = "";
            $(".QuestionItem").each(function (i) {
                var OrderId = $(this).find("#QuestionID").html().replace(".", "").replace(/\s*/, "");
                var ID = $(this).find("#ID").val();
                Parms += OrderId + "|" + ID + ",";
            });
            $.post("Ajax/Ajax.ashx", { act: "QstnaireFinish", Parms: Parms }, function (result) {
                location.href = url;
            }); 
        }

        (function () {
            $("#QuestionType a").bind("mouseover", function () {
                $("div[id$='Question']").css("display", "none");
                var id = $(this).attr("id");
                $(id).css("display", "block").css("position", "absolute").css("left", $(this).position().left).css("top", $(this).position().top + 26);
            });
        })()        
    </script>
</asp:Content>
