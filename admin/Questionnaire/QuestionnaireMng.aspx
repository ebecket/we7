<%@ Page Title="" Language="C#" 
MasterPageFile="../theme/classic/content.Master"
 AutoEventWireup="true" CodeBehind="QuestionnaireMng.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionnaireMng" %>
 <%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
  <style type="text/css">
      #QuestionBody {padding:10px;}
	  #QuestionBody a{ text-decoration:none;}
	  #QuestionBody #Info{ height:50px;}
      #QuestionBody #Info span{font-size:16px; font-weight:bold;}
      #QuestionBody #Info .btn{float:right; width:150; text-align:center; border:1px solid ; padding:8px;}  
	  #QuestionBody .Items{margin:2px auto 8px auto;}
	  #QuestionBody .ItemsOut{border:2px solid #CCCCCC;}
	  #QuestionBody .ItemsHover{border:2px solid #FDB553;}
	  #QuestionBody a.Title{ font-size:14px;}
	  #QuestionBody tr{height:28px;}
	  #QuestionBody td{padding:0 10px;}
	  #QuestionBody ul{float: left; margin: 1px 0 1px -3px; padding:6px; width: auto; font-size:13px;}
	  #QuestionBody ul li{clear:none; display:inline-block; float:left; padding:0 4px; list-style-type: none; margin:2px 0; width:auto;}
	  #QuestionBody ul li a{ background-position:7px 4px; display:inline-block; cursor:pointer; color:#666; line-height:22px; background-repeat:no-repeat; padding:2px 7px 2px 24px;}
	  #QuestionBody #DesignQ,#Analyze,#Result{display:none;}	  
	  
	  .run{ background:url(Image/run.gif);}
	  .view{ background:url(Image/application_form.gif)}
	  .report{ background:url(Image/chart_bar.gif);}
	  .entries{ background:url(Image/application_view_list.gif);}
	  .review{ background:url(Image/Outbox.gif);}
	  .delete{ background:url(Image/cross.gif);}
	  #QuestionBody .OptList{ width:120px; position:absolute;}
	  #QuestionBody .OptList ul{ margin:0; padding:0; overflow:hidden;}
	  #QuestionBody .OptList li{ margin:0 0 0 -8px; padding:4px 0; list-style:none;}
  </style>
  <div id="QuestionBody">
    <div class="wrap">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="问卷管理">
        </asp:Label>
        <span class="summary"></span>
    </h2>
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理
        </a>
    </div>
    <div class="toolbar">
      <a href="QuestionNaire.aspx">设计新问卷</a>
    </div>
    </div>
    <% 
        if (questions.Count > 0)
        {
            foreach (We7.CMS.Common.Questionnaire item in questions)
            {
    %>
    <div class="Items ItemsOut">
      <table width="100%" border="0" cellpadding="6" cellspacing="3">
        <tr>
          <td><a href="#" class="Title"><%=string.IsNullOrEmpty(item.Title)?"未命名标题":item.Title%></a></td>
          <td align="right">
             <span title='<%=string.Format("发布于{0}",item.Created) %>'><%=item.Created.ToString("yyyy-MM-dd") %></span> 
             答卷：<strong><%=item.UseHits %></strong> 
             状态：<span><%=item.State == 1 ? "发布" : (item.State == 2 ? "停止" : "草稿")%></span>   
             <span title="不公开问卷通常用于企业内部员工调查、客户满意度调查等；公开问卷通常市场调查、民意调查等。">
              <label for="edtPublic">公开</label>
              <input id="edtPublic" name="edtPublic" checked="checked" onclick="javascript:setTimeout()" type="checkbox" />
             </span>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <ul>
              <li><b><a href="javascript:QuestionnaireMng.QstPublish('<%=item.ID %>')" class="run">发布问卷</a></b></li>
            </ul>
            <ul>
              <li>|</li>
            </ul>
            <ul>
              <li><a href="#DesignQ" class="view" rel="<%=item.ID %>">问卷管理</a></li>
              <li><a href="#Analyze" class="report" rel="<%=item.ID %>">统计分析</a></li>
              <li><a href="#Result" class="entries" rel="<%=item.ID %>">查看|下载</a></li>
              <!--<li><a href="#" class="review">评论管理</a></li>-->
            </ul>
            <ul>
              <li>|</li>
            </ul>
            <ul>
              <li><a href="javascript:void(0)" class="delete" onclick="QuestionnaireMng.Delete('<%=item.ID %>',$('#currentDiv'))">删除</a></li>
            </ul>
          </td>
        </tr>
      </table>
    </div>
    <% 
            }
        }
        else
        {
    %>
    <div style="margin:10 auto; text-align:center; font-size:16px; font-weight:bold;">您还没有创建问卷的记录，是否现在<a href="QuestionNaire.aspx" title="点击创建问卷">创建</a>？</div>
    <%
        } 
    %>
    <div id="DesignQ" class="OptList">
      <ul>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#DesignQ').parent())" rel="QuestionPreview.aspx?QuestionnaireTypeID=" title="查看问卷">查看问卷</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#DesignQ').parent())" rel="QuestionDesinger.aspx?QuestionnaireTypeID=" title="编辑问卷">编辑问卷</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#DesignQ').parent())" rel="QuestionnarieSetting.aspx?QuestionnaireTypeID=" title="问卷设置">问卷设置</a></li>
        <!--<li><a href="javascript:void(0)" onclick="" rel="" title="设置用户填写完问卷后显示的信息">完成问卷</a></li>-->
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#DesignQ').parent())" rel="QuestionPreview.aspx?act=Print&QuestionnaireTypeID=" title="打印/导出到Word">打印</a></li>
      </ul>
    </div>
    <div id="Analyze" class="OptList">
      <ul>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Analyze').parent())" rel="StatisticsSingleQuestion.aspx?QuestionnaireID=" title="以表格、饼状图、柱状图等方式查看每道题的统计数据">单题统计</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Analyze').parent())" rel="StatisticsIndex.aspx?" title="查看包含统计分析数据的报告，并可以下载到WORD、PDF ">分析报告</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Analyze').parent())" rel="#" title="包括来源渠道分析，时间段分析以及地理位置分析">来源分析</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Analyze').parent())" rel="#" title="完成率分析">完成率</a></li>
      </ul>
    </div>
    <div id="Result" class="OptList">
      <ul>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Result').parent())" rel="#" title="查看单份答卷详细内容并可以标记是否已经处理">浏览答卷</a></li>
        <li><a href="javascript:void(0)" onclick="QuestionnaireMng.Href(this,$('#Result').parent())" rel="#" title="以Excel、CSV格式下载答卷数据（可以导入到SPSS分析）">下载答卷</a></li>
      </ul>
    </div>
  </div>
    <script src="Js/QuestionnaireMng.js" type="text/javascript"></script>
  <script type="text/javascript">
      $(".Items").each(function () {
          $(this).bind("mouseover", function () {
              $(this).addClass("ItemsHover");
              $(this).removeClass("ItemsOut");
              $(this).attr("id", "currentDiv");
          });
          $(this).bind("mouseout", function () {
              $(this).removeClass("ItemsHover");
              $(this).addClass("ItemsOut");
              $(this).removeAttr("id");
          });
      });

      $("ul").find("a[href]").each(function () {
          var obj = $(this).attr("href");
          var position = $(this).parent().position();
          var left = $(this).position().left;
          var top = $(this).position().top;
		  var width=$(this).parent().width();
          $(this).hover(function () {
              $(this).append($(obj));
			  $(this).css("background-color","#DFF4FF");
              $(obj).css("display", "block").css("width",width).css("top", top + 20).css("left", left).css("background-color","#DFF4FF");
          },
          function () {
              $(this).css("background-color", "");
              $(obj).css("display", "none").css("background-color","");
          });
      });
  </script>
</asp:Content>
