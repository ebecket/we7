<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/theme/classic/content.Master"
    AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EditModel.aspx.cs"
    Inherits="We7.CMS.Web.Admin.ContentModel.EditModel" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <% if (!IsEdit)
       { %>
    <script type="text/javascript">
        $(function () {

            $("#ctAdd,#ctDel").css({ "background": '#FFFFFF', 'position': 'absolute', 'display': 'none' });
            $("#addgroup").click(function (e) {
                $("#msg").text("");
                $("#ctAdd").fadeIn();
                $("#ctDel").fadeOut();
            });

            $("#delgroup").click(function (e) {

                function DeleteItem(val, successhandler, failurehandler) {
                    $("#delmsg").show().text("数据处理中");
                    $.ajax({
                        url: '/Admin/ContentModel/ajax/ContentModel.asmx/DeleteModelGroup',
                        data: "{'group':'" + val + "'}",
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        type: 'post',
                        success: function (doc, status, xh) {
                            if (successhandler != null)
                                successhandler();
                            $("#delmsg").show().text("删除成功");
                        },
                        failure: function () {
                            if (failurehandler != null)
                                failurehandler();
                            $("#delmsg").show().text("删除失败");
                        },
                        error: function () {
                            if (failurehandler != null)
                                failurehandler();
                            $("#delmsg").show().text("删除失败");
                        }
                    });
                }

                function LoadData() {
                    $("#ctList").text('');
                    $("#delmsg").show().text("加载数据...");
                    $.ajax({
                        url: '/Admin/ContentModel/ajax/ContentModel.asmx/LoadModelGroup',
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        type: 'post',
                        success: function (doc, status, xh) {

                            if (doc) {
                                var result = eval("(" + doc + ")");
                                if (result && result.success && result.data) {
                                    for (var i = 0; i < result.data.length; i++) {
                                        var row = $("<div />");
                                        row.css("border-bottom", "solid 1px #e0e0e0").append($("<span>" + result.data[i].txt + "&nbsp;&nbsp;&nbsp;&nbsp;</span>")).append($("<span>X</span>").data('val', result.data[i].val).css({ cursor: 'pointer' }).data("row", row).click(function () {
                                            var val = $(this).data("val");
                                            var obj = this;
                                            if (obj.locked) return;
                                            obj.locked = true;
                                            DeleteItem(val, function () {
                                                $(obj).data("row").remove();
                                                var sl = $("#<%=GroupDropDownList.ClientID %>")[0];
                                                var ops = sl.options;
                                                for (var j = 0; j < ops.length; j++) {
                                                    if (ops[j].value == val) {
                                                        if (ops.remove)
                                                            ops.remove(j);
                                                        else
                                                            sl.remove(j);
                                                        break;
                                                    }
                                                }
                                                if (ops.length > 0) ops[0].selected = true;
                                            }, function () {
                                                alert("应用程序错误，删除失败");
                                            });
                                        }));
                                        $("#ctList").append(row);
                                    }
                                }
                                else {
                                    $("#ctList").innerText = "当前模型组为空";
                                }
                            }
                            else {
                                $("#ctList").innerText = "当前模型组为空";
                            }
                            $("#delmsg").hide().text("");
                        },
                        failure: function () {
                            alert(arguments);
                        },
                        error: function () {
                            alert(arguments);
                        }
                    });
                }

                LoadData();

                $("#ctDel").fadeIn();
                $("#ctAdd").fadeOut();

            });

            $("#btnAddGroup").click(function () {
                if ($.trim($("#cngn").val()) == "") {
                    alert("模型组名称不能为空");
                    return;
                }
                if ($.trim($("#engn").val()) == "") {
                    alert("模型标识符不能为空");
                    return;
                }
                var reg = /^[a-zA-Z0-9]/gi;
                if (!reg.test($.trim($("#engn").val()))) {
                    alert("模型标识符只能由字母和数字组成");
                    return;
                }
                $("#msg").text('数据处理中');
                $.ajax({
                    url: '/Admin/ContentModel/ajax/ContentModel.asmx/CreateModelGroup',
                    data: "{cnName:'" + $("#cngn").val() + "',enName:'" + $("#engn").val() + "'}",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'post',
                    success: function (doc, status, xh) {
                        if (doc) {
                            var result = eval("(" + doc + ")");
                            if (result && result.success) {
                                var op = new Option();
                                op.text = $("#cngn").val();
                                op.value = $("#engn").val();
                                op.selected = true;
                                $("#<%=GroupDropDownList.ClientID %>")[0].options.add(op);
                                $("#ctAdd").fadeOut();
                                $("#engn").val("");
                                $("#cngn").val("");
                            }
                            else {
                                $("#msg").text("添加失败:" + result.msg);
                            }
                        }
                        else {
                            $("#msg").text("添加失败,应用程序处理错误!");
                        }
                    },
                    failure: function () {
                        $("#msg").text("添加失败");
                    },
                    error: function () {
                        $("#msg").text("添加失败");
                    }
                });

            });
            $("#btnCancelGroup").click(function () {
                $("#ctAdd").fadeOut();
            });
            $("#delClose").click(function () {
                $("#ctDel").fadeOut();
                $("#delmsg").hide().text("");
            });
        });
    </script>
    <%} %>
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="添加内容模型"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="内容模型的描述信息">
            </asp:Label>
        </span>
    </h2>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
    <div>
        <table>
            <tr>
                <td style="width: 100px;" align="right">
                    类型
                </td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DefaultModelContentDropDownList" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    分组
                </td>
                <td>
                    <asp:DropDownList ID="GroupDropDownList" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td>
                    <% if (!IsEdit)
                       { %>
                    <a id="addgroup" style="cursor: pointer; font-size: 14px; color: Red; text-decoration: underline;">
                        新增</a>&nbsp;&nbsp; <a id="delgroup" style="cursor: pointer; font-size: 14px; color: Red;
                            text-decoration: underline">删除</a>
                    <div id="ctAdd" style="margin-left: 35px; padding: 3px; border: solid 1px #e0e0e0;">
                        <div style="border: solid 1px #f0f0f0;">
                            <table>
                                <tr>
                                    <td>
                                        模型组名称:
                                    </td>
                                    <td>
                                        <input id="cngn" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        标识符：
                                    </td>
                                    <td>
                                        <input id="engn" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="btnAddGroup" style="width: 60px; padding: 0;" class="Btn" type="button"
                                            value="添加" />
                                        <input id="btnCancelGroup" style="width: 60px; padding: 0" class="Btn" type="button"
                                            value="取消" />
                                        <label id="msg">
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="ctDel" style="margin-left: 35px; padding: 3px; border: solid 1px #e0e0e0;">
                        <div style="border: solid 1px #f0f0f0;">
                            <div id="delClose" style="text-align: right; cursor: pointer; border-bottom: solid 1px #e0e0e0">
                                [close]</div>
                            <div id="ctList" style="padding: 0 3px 3px 3px; width: 200px">
                            </div>
                            <div id="delmsg" style="font-weight: bold;">
                                数据处理中...</div>
                        </div>
                    </div>
                    <%} %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    名称
                </td>
                <td>
                    <asp:TextBox ID="ModelLabelTextBox" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    配置文件
                </td>
                <td>
                    <asp:TextBox ID="ModelNameTextBox" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    .xml （模型配置文件名称，请使用字母与数字）
                </td>
            </tr>
            <tr>
                <td align="right">
                    详细描述
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    用户默认角色（仅用户模型适用）
                </td>
                <td>
                    <asp:TextBox ID="RoleTextBox" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    启用任意浏览权限(仅文章模型适用)
                </td>
                <td>
                    <asp:CheckBox ID="AuthorityTypeCheckBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    关联反馈模型(仅文章模型适用)
                </td>
                <td>
                    <asp:DropDownList ID="ddlRelationModelName" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    状态
                </td>
                <td>
                    <asp:DropDownList ID="ModelStateDropDownList" runat="server" Width="200px">
                        <asp:ListItem Selected="True" Text="开启" Value="1"></asp:ListItem>
                        <asp:ListItem Text="关闭" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div class="toolbar" style="margin-left: 100px">
        <asp:HyperLink ID="SaveHyperLink" NavigateUrl="javascript:SubmitClick();" runat="server">
            保存
        </asp:HyperLink>
        <asp:HyperLink ID="ReturnHyperLink" NavigateUrl="~/Admin/ContentModel/Models.aspx"
            runat="server">
            返回列表
        </asp:HyperLink>
    </div>
    <div style="display: none">
        <asp:Button ID="SubmitsButton" runat="server" Text="Save" OnClick="SubmitButton_Click"
            ValidationGroup="SubmitButton" />
    </div>
    <script type="text/javascript">
        function SubmitClick() {
            var submitBtn = document.getElementById("<%=SubmitsButton.ClientID %>");
            submitBtn.click();
        }
    </script>
</asp:Content>
