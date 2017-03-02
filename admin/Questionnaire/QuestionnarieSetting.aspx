<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/theme/classic/ContentNoMenu.Master" AutoEventWireup="true" CodeBehind="QuestionnarieSetting.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionnarieSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
  <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
  <style>
    #QuestionBody {padding:10px;}
	#QuestionBody ul{width:auto;}
	#QuestionBody ul li{ float:left; padding:4px; cursor:pointer;}
  </style>
  <script src="/Admin/Ajax/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
  
  <div class="wrap">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="问卷设置">
        </asp:Label>
        <span class="summary"></span>
    </h2>
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 问卷设置
    </div>
  </div>
  <div class="toolbar">
    <ul>
      <li><a href="javascript:void(0)" rel="#BaseInfo">基本信息</a></li>
      <li><a href="javascript:void(0)" rel="#Access">访问级别</a></li>
      <li><a href="javascript:void(0)" rel="#NoRepeat">防重复填写</a></li>
      <li><a href="javascript:void(0)" rel="#EndCondition">结束条件</a></li>
    </ul>
  </div>
  <div id="QuestionBody">     
    <div id="BaseInfo">
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td><strong>问卷名称：</strong></td>
          <td><label>
              <input type="text" name="edtTitle" id="edtTitle" value='<%=string.IsNullOrEmpty(questionnaire.Title)?"未命名标题":questionnaire.Title %>' />
            </label></td>
        </tr>
        <tr>
          <td valign="top"><strong>问卷说明：</strong></td>
          <td><label>
              <textarea name="edtDescription" id="edtDescription" cols="60" rows="6"><%=string.IsNullOrEmpty(questionnaire.Description)?"请填写关于此问卷的说明":questionnaire.Description%></textarea>
            </label></td>
        </tr>
        <tr>
          <td><strong>问卷分类：</strong></td>
          <td><label>
              <select name="edtCategory" id="edtCategory">
                <option value="">---请选择分类---</option>
                <%
                    foreach (We7.CMS.Common.QuestionnaireType it in lsTypes)
                    {
                %>
                <option value="<%=it.ID %>" <%=it.ID==questionnaire.TypeID?"selected='selected'":"" %>><%=it.TypeName%></option>
                <% 
                        if (it.Children.Count > 0)
                        {
                            foreach (We7.CMS.Common.QuestionnaireType item in it.Children)
                            { 
                %>
                <option value="<%=item.ID %>" <%=item.ID==questionnaire.TypeID?"selected='selected'":"" %>>&nbsp;&nbsp;<%=item.TypeName%></option>
                <%
                            }
                        }
                    }
                %>
              </select>
            </label></td>
        </tr>
      </table>
    </div>
    <div id="Access">
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <!--<tr>
          <td><strong>问卷公开级别：</strong></td>
          <td><label for="edtPublic">
              <input type="radio" name="edtPublic" id="edtPublic" value="edtPublic" />
              公开 </label>
            <label for="edtPrivate">
              <input type="radio" name="edtPrivate" id="edtPrivate" value="edtPrivate" />
              不公开 </label></td>
        </tr>-->
        <tr>
          <td><strong>需要登录：</strong></td>
          <td><label>
              <input type="radio" name="edtLogin" id="edtVerify" value="true" <%=questionnaire.IsNeedLogin?"checked":"" %> />
              是</label>
            <label>
              <input type="radio" name="edtLogin" id="edtPublic" value="false" <%=!questionnaire.IsNeedLogin?"checked":"" %> />
              否</label></td>
        </tr>
        <tr>
          <td><strong>问卷提交跳转：</strong></td>
          <td><label>
              <input type="radio" name="edtRedirect" id="edtTip" value="0" <%=questionnaire.SuccessConfig==0?"checked":"" %> />
              提示信息 </label>
            <label>
              <input type="radio" name="edtRedirect" id="edtStatistic" value="1" <%=questionnaire.SuccessConfig==1?"checked":"" %> />
              统计结果 </label></td>
        </tr>
        <tr>
          <td><strong>密码类型：</strong></td>
          <td><label>
              <input type="radio" name="edtPwd" id="edtEmptyPwd" value="false" <%=string.IsNullOrEmpty(questionnaire.Password)?"checked":"" %> />
              不设置密码</label>
            <label>
              <input type="radio" name="edtPwd" id="edtPwd" value="true" <%=!string.IsNullOrEmpty(questionnaire.Password)?"checked":"" %> />
              设置密码               
            </label><input type="password" name="edtPassword" id="edtPassword" style='display:<%=string.IsNullOrEmpty(questionnaire.Password)?"none":"" %>' /></td>
        </tr>
      </table>
    </div>
    <div id="NoRepeat">
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td><strong>使用验证码：
            <label>
              <input type="radio" name="edtVerifyCode" id="edtVerifyCode" value="true" <%=questionnaire.IsNeedLogin?"checked":"" %> />
              是</label>
            <label>
              <input type="radio" name="edtVerifyCode" id="edtNoVerifyCode" value="false" <%=!questionnaire.IsNeedLogin?"checked":"" %> />
              否</label>
            </strong></td>
        </tr>
        <tr>
          <td><input name="edtIPForbid" type="checkbox" value="true" id="edtIPForbid" <%=questionnaire.IpRepeat?"checked":"" %> />
            <label for="edtIPForbid">IP地址限制</label></td>
        </tr>
      </table>
    </div>
    <div id="EndCondition">
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td><strong>过期时间：</strong></td>
          <td><label>日期
              <input type="text" name="edtExpireDate" id="edtExpireDate" onfocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})" value="<%=questionnaire.ExpireDate.ToString("yyyy-MM-dd") %>" />
            </label>
            小时
            <select name="edtExpireTime" id="edtExpireTime">
              <option selected="selected" value="0">0点</option>
              <option value="1">1点</option>
              <option value="2">2点</option>
              <option value="3">3点</option>
              <option value="4">4点</option>
              <option value="5">5点</option>
              <option value="6">6点</option>
              <option value="7">7点</option>
              <option value="8">8点</option>
              <option value="9">9点</option>
              <option value="10">10点</option>
              <option value="11">11点</option>
              <option value="12">12点</option>
              <option value="13">13点</option>
              <option value="14">14点</option>
              <option value="15">15点</option>
              <option value="16">16点</option>
              <option value="17">17点</option>
              <option value="18">18点</option>
              <option value="19">19点</option>
              <option value="20">20点</option>
              <option value="21">21点</option>
              <option value="22">22点</option>
              <option value="23">23点</option>
            </select></td>
        </tr>
      </table>
    </div>
    <div id="Notify" style="background:Red; color:White; font-weight:bold; display:none; padding:4px;"></div>
    <label>
      <input type="button" name="edtPost" id="edtPost" value="保存设置" />
    </label>
    <script type="text/javascript">
        $("ul").find("a").each(function (i) {
            var elementID = $(this).attr("rel");
            if (i != 0) {
                $(elementID).css("display", "none");
            }
            else {
                $(elementID).attr("class", "currentItem");
            }
            $(this).bind("click", function () {
                $(elementID).fadeIn("slow");
                if (elementID.substr(1) != $(".currentItem").attr("id")) {
                    $(".currentItem").hide().removeAttr("class");
                    $(elementID).attr("class", "currentItem");
                }

            });
        });
        $("input[name='edtPwd']").bind("click", function () {
            if ($(this).attr("id") == "edtPwd") {
                $("#edtPassword").show();
            } else {
                $("#edtPassword").hide();
            }
        });

        $("#edtPost").bind("click", function () {
            var Data = "act=QstSetting&ID=<%=ID %>";
            $("#QuestionBody").find("input:text,input:password,input:checked,input:selected,select,textarea").each(function () {
                Data += "&" + $(this).attr("name") + "=" + $(this).val();
            });
            $.ajax({
                url: "Ajax/Ajax.ashx",
                data: Data,
                type: "POST",
                success: function (_result_) {
                    var json = eval("(" + _result_ + ")");
                    if (json.Result == "success") {
                        $("#Notify").fadeIn("slow").html("设置成功！");
                        setTimeout(function () {
                            $("#Notify").hide();
                        }, "3000");
                    }
                }
            });
        })
  </script>
  </div>
</asp:Content>
