<%@ Page Language="C#" MasterPageFile="~/Admin/theme/classic/ContentNoMenu.Master"
    AutoEventWireup="true" CodeBehind="QuestionNaire.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.QuestionNaire" %>

<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script src="/Admin/Ajax/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="wrap">
        <h2 class="title">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
            <asp:Label ID="NameLabel" runat="server" Text="新建问卷">
            </asp:Label>
            <span class="summary"></span>
        </h2>
        <div id="position">
            <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>
                问卷管理</a> > 新建问卷
        </div>
    </div>
    <div style="margin: 10px auto; width: 80%;">
        <fieldset style="border: solid 1px; padding: 10px; margin: 4px auto;">
            <legend style="font-weight: 800; background: #fff; padding: 3px 6px; border: #b6b6b6 dashed 1px;">
                新建问卷:</legend>
            <table width="94%" border="0" cellpadding="3" cellspacing="3">
                <tr>
                    <td align="center">标题</td>
                    <td><input type="text" id="edtNaireTitle" name="title" /></td>
                </tr>
                <tr>
                    <td align="center">
                        分类
                    </td>
                    <td>
                        <select id="edtNaireType" name="edtNaireType">
                            <option value="">---请选择分类---</option>
                            <%
                                foreach (We7.CMS.Common.QuestionnaireType it in lsTypes)
                                {
                            %>
                            <option value="<%=it.ID %>">
                                <%=it.TypeName %></option>
                            <% 
                                if (it.Children.Count > 0)
                                {
                                    foreach (We7.CMS.Common.QuestionnaireType item in it.Children)
                                    { 
                            %>
                            <option value="<%=item.ID %>">&nbsp;&nbsp;<%=item.TypeName %></option>
                            <%
                                }
                                    }
                                }
                            %>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="QuestionnaireTypeEdit.aspx" target="_blank">分类管理</a>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        日期
                    </td>
                    <td>
                        <label>
                            开始日期<input type="text" name="edtStartDate" id="edtStartDate" onfocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                value="" /></label>
                        <label>
                            结束日期<input type="text" name="edtExpireDate" id="edtExpireDate" onfocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                value="" /></label>
                    </td>
                </tr>
                <tr>
                    <td align="center">描述</td>
                    <td><textarea id="edtNaireDescript" name="descript" cols="56" rows="4"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <label>
                            <input type="button" name="edtPost" id="edtPost" value="下一步" /></label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <script type="text/javascript">
        var date = new Date();
        var now = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        document.getElementById("edtStartDate").setAttribute("value", now);

        var nextWeekDay = new Date(date.getTime() + 7 * 24 * 60 * 60 * 1000);
        var next = nextWeekDay.getFullYear() + "-" + (nextWeekDay.getMonth() + 1) + "-" + nextWeekDay.getDate() + " " + nextWeekDay.getHours() + ":" + nextWeekDay.getMinutes() + ":" + nextWeekDay.getSeconds();
        document.getElementById("edtExpireDate").setAttribute("value", next);

        document.getElementById("edtPost").onclick = function () {
            var title = $("#edtNaireTitle").val();
            if (title == "") {
                alert("请填写问卷的标题！");
                return;
            }
            var val = $("#edtNaireType option:selected").val();
            if (val == "") {
                alert("请先选择一项问卷分类！");
                return;
            }
            else {
                $.post("Ajax/Ajax.ashx", { act: "QstnaireCrt", QstnaireTitle: title, QstnaireTypeID: val, DateStart: $("#edtStartDate").val(), DateExpire: $("#edtExpireDate").val(), QstnaireDesc: $("#edtNaireDescript").val() }, function (_Result_) {

                    var json = eval("(" + _Result_ + ")");
                    if (json.Result == "success")
                        window.location.href = "QuestionDesinger.aspx?QuestionnaireTypeID=" + json.DataID;
                });
            }
        }
    </script>
</asp:Content>
