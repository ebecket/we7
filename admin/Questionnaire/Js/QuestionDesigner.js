
var AsyncDom = {
    Author: "wolfweb",
    Version: "v1.0.0",
    Create: "2011/5/19",
    ElementType: { Radio: "radio", CheckBox: "checkbox", Text: "text", MultiText: "textarea", Select: "select", ImageBtn: "image" },
    Options: [],
    CreateFrmElement: function (Type) {
        var dom;
        for (var it in this.ElementType) {
            if (Type == this.ElementType.Select) {
                dom = document.createElement(this.ElementType.Select);
            }
            else if (Type == this.ElementType.MultiText) {
                dom = document.createElement(this.ElementType.MultiText);
            }
            else {
                dom = document.createElement("input");
                dom.setAttribute("type", Type);
            }
        }
        return dom;
    },
    CreateElement: function (Type, Class, ID, Txt) {
        var dom = document.createElement(Type);
        if (ID)
            dom.setAttribute("id", ID);
        if (Class)
            dom.setAttribute("class", Class);
        if (Txt)
            dom.innerHTML = Txt;
        return dom;
    },
    SetAttribute: function (Element) {
        if (this.Options.length > 0) {
            if (typeof (Element) == "string")
                Element = document.getElementById(Element);

            for (var it in this.Options) {
                Element.setAttribute(this.Options[it][0], this.Options[it][1]);
            }
        }
    },
    Html: function (Element, html) {
        if (typeof (Element) == "object") {
            Element.innerHTML = html;
        }
        else {
            document.getElementById(Element).innerHTML = html;
        }
    },
    Append: function (ID, Element) {
        if (ID)
            document.getElementById(ID).appendChild(Element);
        else
            document.body.appendChild(Element);
    },
    Test: function () {
        for (var it in AsyncDom.ElementType) {
            alert(AsyncDom.ElementType[it]);
        }
    }
}

var Qst = {
    ///Type:题目类型，Title:题目标题，Order:题目编号，MustAnser：是否必答，ValueItem:题目内容选项([Title: "", Type: -1, Value: "", DefaultSelected: false])
    Values: { Type: -1, Title: "", OrderID: 0, Description: "", MustAnswer: true, ValueItem: [] },
    State: { Edit: "edit", New: "new" },
    FontTypes: { Normal: "normal", Bold: "bold", Italic: "italic" },
    ElementType: null,
    CurrentState: null,
    QuestionID: null,
    Url: "Ajax/Ajax.ashx",
    LoadQuestion: function (ID) {
        $.get(this.Url + "?act=LoadQst&IsEdit=true&ID=" + ID + "&" + Math.random(), function (_result_) {
            $("#QuestionBody").html(_result_);
        })
    },
    QstCrt: function (Type, Custom) {
        if (!$("#designer").attr("id")) {
            Qst.CurrentState = Qst.State.New;
            this.LoadFrmByType(Type, null);
        }
        else
            this.Notify("请完成当前的编辑在继续！");
    },
    FontType: function (Type, Element) {
        if (typeof (Element) == "string")
            Element = document.getElementById(Element);

        switch (Type) {
            case this.FontTypes.Normal:
                $(Element).css("font-weight", "100").css("font-style", "");
                break;
            case this.FontTypes.Bold:
                $(Element).css("font-weight", this.FontTypes.Bold)
                break;
            case this.FontTypes.Italic:
                $(Element).css("font-style", this.FontTypes.Italic)
                break;
        }
    },
    ChangeTitle: function (DataContainer) {
        var title = $(DataContainer).val();
        $("#QuestionPreview").find("span#title").html(title);
        this.Values.Title = title;
    },
    InitOptionByVal: function () {
        $("#QuestionDesigner #QuestionTitleSetting").find("textarea").val(this.Values.Title);
        $("#QuestionPreview").find("span#title").html(this.Values.Title);
        if (this.Values.MustAnswer) {
            $("#edtMustAsw").attr("checked", true);
            $("#mustAnswer").show();
        }
        else {
            $("#edtMustAsw").attr("checked", false);
            $("#mustAnswer").hide();
        }
        switch (this.ElementType) {
            case AsyncDom.ElementType.CheckBox:
            case AsyncDom.ElementType.Radio:
            case AsyncDom.ElementType.Select:
                var values = this.Values.ValueItem;

                var table = $("#QuestionItemOpt").children("table");
                var oldTr = $(table).find("tr:last");
                var newTr = $(oldTr).clone(true);
                $(oldTr).remove();
                var i = 0;
                var element = null;
                if (this.ElementType == AsyncDom.ElementType.Select) {
                    element = AsyncDom.CreateFrmElement(this.ElementType);
                    $("#QuestionPreview #QuestionBody").find("ul").append(element);
                }
                for (i = 0; i < values.length; i++) {
                    var it = this.Values.ValueItem[i].OptionValue;
                    ///preview form
                    if (this.ElementType == AsyncDom.ElementType.Select) {
                        var option = AsyncDom.CreateElement("option", null, null, it);
                        option.setAttribute("value", it);
                        $(element).append(option);
                    }
                    else {
                        element = AsyncDom.CreateFrmElement(this.ElementType);
                        element.setAttribute("name", this.Values.OrderID);
                        element.setAttribute("id", this.Values.OrderID);
                        element.setAttribute("name", this.Values.ValueItem.OptionValue);
                        var label = AsyncDom.CreateElement("label", null, null, it);
                        if (this.Values.ValueItem[i].OptionValue.indexOf("其他") > -1) {
                            var tmp = AsyncDom.CreateFrmElement(AsyncDom.ElementType.Text);
                            $(tmp).attr("name", i + "radioOther").attr("id", i + "radioOther").attr("value", "请注明...").addClass("underline"); //attr("disabled", "disabled").
                            $(label).append(tmp);
                        }
                        var li = AsyncDom.CreateElement("li", null, null, null);
                        $(label).prepend(element);
                        li.appendChild(label);
                        $("#QuestionPreview #QuestionBody").find("ul").append(li);
                    }
                    ///

                    ///operation form                    
                    var tmp = $(newTr).clone(true);
                    $(tmp).find("td:first").find("input").val(it);
                    $(tmp).find("#edtDefVal").attr("checked", this.Values.ValueItem[i].DefaultSelected);
                    (function () {
                        var tr = arguments[0];
                        var num = arguments[1];

                        $(tmp).find("#edtDefVal").unbind();
                        $(tmp).find("#edtDefVal").bind("click", function () {
                            Qst.IsDefValue(this, num);
                        });

                        $(tmp).find("#edtRemoveTr").unbind();
                        $(tmp).find("#edtRemoveTr").bind("click", function () {
                            Qst.RemoveTr(tr, num);
                        });
                    })($(tmp), i);

                    $(table).append(tmp);
                    ///
                }
                break;
            case AsyncDom.ElementType.Text:
                this.Texts($("#designer"));
                break;
            case AsyncDom.ElementType.MultiText:
            case "custom":
                var input = $("#QuestionPreview #QuestionBody").find("input");
                this.Blanks($("#designer"), this.Values.Type == 8 ? true : false);
                break;
            case "multiLine":
                this.MultiLine($("#designer"));
                break;
        }
    },
    LoadFrmByType: function (Type, Element) {
        var tmp = $.get("DesingerFrm.htm?" + Math.random(), function (_result_) {
            var frm = $(_result_);

            if (Qst.CurrentState == Qst.State.Edit) {
                $(Element).replaceWith(frm);

                $("#QuestionOpt").find("#edtDel").find("a").live("click", function () {
                    if (confirm("确定要删除该项吗？"))
                        Qst.Delete(this, Qst.Values.ID);
                });

                switch (Type) {
                    case AsyncDom.ElementType.Radio:
                        Qst.ElementType = AsyncDom.ElementType.Radio;
                        Qst.InitOptionByVal();
                        break;
                    case AsyncDom.ElementType.CheckBox:
                        Qst.ElementType = AsyncDom.ElementType.CheckBox;
                        Qst.InitOptionByVal();
                        break;
                    case AsyncDom.ElementType.Text:
                        Qst.ElementType = AsyncDom.ElementType.Text;
                        Qst.InitOptionByVal();
                        break;
                    case AsyncDom.ElementType.Select:
                        Qst.ElementType = AsyncDom.ElementType.Select;
                        Qst.InitOptionByVal();
                        break;
                    case AsyncDom.ElementType.ImageBtn:
                        alert("Image");
                        break;
                    case AsyncDom.ElementType.MultiText:
                        Qst.ElementType = AsyncDom.ElementType.MultiText;
                        Qst.InitOptionByVal();
                        break;
                    case "radioOther":
                        Qst.ElementType = AsyncDom.ElementType.Radio;
                        Qst.InitOptionByVal();
                        break;
                    case "checkboxOther":
                        Qst.ElementType = AsyncDom.ElementType.CheckBox;
                        Qst.InitOptionByVal();
                        break;
                    case "multiLine":
                        Qst.ElementType = "multiLine";
                        Qst.InitOptionByVal();
                        break;
                    case "custom":
                        Qst.ElementType = "custom";
                        Qst.InitOptionByVal();
                        break;
                }
            }
            else {
                $("#QuestionBody").append(frm);
                $("#QuestionOpt").find("#edtDel").find("a").live("click", function () {
                    Qst.Delete(this, '');
                });
                switch (Type) {
                    case AsyncDom.ElementType.Radio:
                        Qst.Values.Type = 0;
                        Qst.ElementType = AsyncDom.ElementType.Radio;
                        Qst.AppendTr(frm, false);
                        Qst.Preview(frm, "table");
                        break;
                    case AsyncDom.ElementType.CheckBox:
                        Qst.Values.Type = 2;
                        Qst.ElementType = AsyncDom.ElementType.CheckBox;
                        Qst.AppendTr(frm, false);
                        Qst.Preview(frm, "table");
                        break;
                    case AsyncDom.ElementType.Text:
                        Qst.Values.Type = 5;
                        Qst.ElementType = AsyncDom.ElementType.Text;
                        Qst.Texts(frm);
                        break;
                    case AsyncDom.ElementType.Select:
                        Qst.Values.Type = 4;
                        Qst.ElementType = AsyncDom.ElementType.Select;
                        Qst.AppendTr(frm, false);
                        Qst.Preview(frm, "table");
                        break;
                    case AsyncDom.ElementType.ImageBtn:
                        alert("Image");
                        break;
                    case AsyncDom.ElementType.MultiText:
                        Qst.Values.Type = 7;
                        Qst.ElementType = AsyncDom.ElementType.MultiText;
                        Qst.Blanks(frm, false);
                        break;
                    case "radioOther":
                        Qst.Values.Type = 1;
                        Qst.ElementType = AsyncDom.ElementType.Radio;
                        Qst.AppendTr(frm, false);
                        Qst.AppendTr(frm, true);
                        Qst.Preview(frm, "table");
                        break;
                    case "checkboxOther":
                        Qst.Values.Type = 3;
                        Qst.ElementType = AsyncDom.ElementType.CheckBox;
                        Qst.AppendTr(frm, false);
                        Qst.AppendTr(frm, true);
                        Qst.Preview(frm, "table");
                        break;
                    case "multiLine":
                        Qst.Values.Type = 6;
                        Qst.ElementType = "multiLine";
                        Qst.MultiLine(frm);
                        break;
                    case "custom":
                        Qst.Values.Type = 8;
                        Qst.ElementType = "custom";
                        Qst.Blanks(frm, true);
                        break;
                }
            }
        });
    },
    MultiLine: function (Doc) {
        $("#QuestionItemSetting").html("");
        this.Preview(Doc, "multiLine");
    },
    Blanks: function (Doc, IsCustom) {
        var opt = IsCustom ? "custom" : "textarea";
        var textarea = this.TextArea(opt)
        if (this.CurrentState == this.State.New) {
            if (IsCustom)
                $(textarea).val("姓名：\r\n所在地区：\r\n街道地址：\r\n邮政编码：\r\n手机或固话：");
            else
                $(textarea).val("姓名：_________    年龄：___岁   \r\n电话：____________");
        }
        $("#QuestionItemOpt").html(textarea);
        this.Preview(Doc, opt);
    },
    Checkbox: function (nameAttr) {
        var checkbox = AsyncDom.CreateFrmElement(AsyncDom.ElementType.CheckBox);
        checkbox.setAttribute("name", nameAttr);
        checkbox.setAttribute("id", nameAttr);
        return checkbox;
    },
    Radio: function (nameAttr) {
        var radio = AsyncDom.CreateFrmElement(AsyncDom.ElementType.Radio);
        radio.setAttribute("name", nameAttr);
        radio.setAttribute("id", nameAttr);
        return radio;
    },
    Select: function (nameAttr) {
        var select = AsyncDom.CreateFrmElement(AsyncDom.ElementType.Select);
        select.setAttribute("name", nameAttr);
        select.setAttribute("id", nameAttr);
        return select;
    },
    Text: function (nameAttr) {
        var text = AsyncDom.CreateFrmElement(AsyncDom.ElementType.Text);
        text.setAttribute("name", nameAttr);
        text.setAttribute("id", nameAttr);
        return text;
    },
    Textarea: function (nameAttr) {
        var textarea = AsyncDom.CreateFrmElement(AsyncDom.ElementType.MultiText);
        textarea.setAttribute("name", nameAttr);
        textarea.setAttribute("id", nameAttr);
        return textarea;
    },
    Texts: function (Doc) {
        $("#QuestionItemSetting").html("");
        this.Preview(Doc, "text");
    },
    TextArea: function (Opt) {
        var textarea = AsyncDom.CreateFrmElement(AsyncDom.ElementType.MultiText);
        textarea.setAttribute("onchange", "Qst.TextareaChange('" + Opt + "')");
        $(textarea).attr("cols", "80").attr("rows", "8");
        return textarea;
    },
    TextareaChange: function (IsCusotm) {
        if (IsCusotm == "custom") {
            $("#QuestionPreview #QuestionBody").find("ul").html("");
            var val = $("#QuestionItemOpt textarea").val().replace(/\r/ig, "#*#").replace(/\n/ig, "#*#").split("#*#");
            for (var i = 0; i < val.length; i++) {
                if (val[i] != "") {
                    var tmp = this.Text(val[i]);
                    var li = AsyncDom.CreateElement("li", null, null, null);
                    li.innerHTML = val[i];
                    $(li).append(tmp);
                    $("#QuestionPreview #QuestionBody").find("ul").append(li);
                }
            }

            Qst.Values.ValueItem[0].OptionValue = val.join("#*#");
        }
        else {
            var tmp = $("#QuestionItemOpt textarea").val().replace(/\r/ig, "<br />").replace(/\n/ig, "<br />");
            $("#QuestionPreview #QuestionBody").html(tmp);
            Qst.Values.ValueItem[0].OptionValue = tmp.replace(/_+/g, "#*#");
        }
    },
    AppendTr: function (Doc, IsOther) {
        var table = $(Doc).find("#QuestionItemOpt").children("table");
        var tr = $(table).find("tr:last").clone(true);
        var td = $(tr).find("td:first");
        var txt = $(td).find("input").val().substr(2);
        if (isNaN(txt))
            txt = 1;
        else
            txt = parseInt(txt) + 1;
        if (IsOther)
            $(tr).find("td:first").find("input").val("其他");
        else
            $(tr).find("td:first").find("input").val("选项" + txt);
        $(table).append(tr);
    },
    RemoveTr: function (objTr, i) {
        var table = $(objTr).parent();
        if ($(table).find("tr").size() > 3) {
            if (this.Values.ValueItem[i].ID != undefined) {
                $.get(this.Url + "?act=OptionDel&ID=" + this.Values.ValueItem[i].ID + "&" + Math.random(), function (_result_) {
                    var json = eval("(" + _result_ + ")");
                    if (json.Result == "success") {
                        Qst.Notify("删除成功！");
                        $(objTr).remove();
                        Qst.Values.ValueItem.splice(i, 1);
                    }
                });
            }
            else {
                var objValue = $(objTr).find("td:first").find("input").attr("value");
                for (var k in this.Values.ValueItem) {
                    if (this.Values.ValueItem[k].Title == objValue)
                        this.Values.ValueItem.splice(k, 1);
                }
                $(objTr).remove();

            }
            this.Preview(table, "table");
        }
        else {
            this.Notify("选项至少为两个!");
        }
    },
    Preview: function (DataContainer, DataType) {
        ///初始化窗体内容
        $("#QuestionPreview #QuestionBody").find("ul").html("");
        var n = parseInt($(".QuestionItem").size()) + 1;
        $("#QuestionPreview #QuestionID").html(n + ".");
        ///

        ///初始化值
        var title = null;
        if (this.CurrentState == this.State.Edit) {
            $("#QuestionPreview #title").html(this.Values.Title);
        }
        else {
            title = $("#QuestionPreview #title").html();
            this.Values.Title = title;
            this.Values.OrderID = n;
        }
        ///
        switch (DataType) {
            case "tr":
            case "table":
                if (Qst.ElementType == AsyncDom.ElementType.Select) {
                    var element = this.Select(n);
                    $("#QuestionPreview #QuestionBody").find("ul").append(element)
                    $(DataContainer).find("#dataRaw").each(function (i) {
                        var currItemName = $(this).children(":first").find("input").val();
                        var option = AsyncDom.CreateElement("option", null, null, currItemName);
                        option.setAttribute("value", currItemName);
                        $(element).append(option);

                        if (Qst.CurrentState == Qst.State.New || !Qst.Values.ValueItem[i])
                            Qst.Values.ValueItem[i] = {};

                        Qst.Values.ValueItem[i].Title = currItemName;
                        Qst.Values.ValueItem[i].Type = 2;
                        Qst.Values.ValueItem[i].OptionValue = currItemName;
                        Qst.Values.ValueItem[i].DefaultSelected = false;
                        Qst.Values.ValueItem[i].OrderID = i;

                        (function () {
                            var tr = arguments[0];
                            var num = arguments[1];

                            $(tr).find("#edtDefVal").unbind();
                            $(tr).find("#edtDefVal").bind("click", function () {
                                Qst.IsDefValue(this, num);
                            });

                            $(tr).find("#edtRemoveTr").unbind();
                            $(tr).find("#edtRemoveTr").bind("click", function () {
                                Qst.RemoveTr(tr, num);
                            });
                        })($(this), i);
                    });
                }
                else {
                    $(DataContainer).find("#dataRaw").each(function (i) {
                        var currItemName = $(this).children(":first").find("input").val();
                        var element = AsyncDom.CreateFrmElement(Qst.ElementType);
                        element.setAttribute("name", n);
                        element.setAttribute("id", n);
                        element.setAttribute("value", currItemName);
                        var label = AsyncDom.CreateElement("label", null, null, currItemName);
                        if (currItemName.indexOf("其他") > -1) {
                            var tmp = AsyncDom.CreateFrmElement(AsyncDom.ElementType.Text);
                            $(tmp).attr("name", n + "radioOther").attr("id", n + "radioOther").attr("value", "请注明...").addClass("underline"); //attr("disabled", "disabled").
                            $(label).append(tmp);
                        }
                        var li = AsyncDom.CreateElement("li", null, null, null);
                        $(label).prepend(element);
                        li.appendChild(label);
                        $("#QuestionPreview #QuestionBody").find("ul").append(li);

                        var type = -1;
                        if (Qst.ElementType == AsyncDom.ElementType.Radio)
                            type = 0;
                        else
                            type = 1;

                        if (Qst.CurrentState == Qst.State.New || !Qst.Values.ValueItem[i])
                            Qst.Values.ValueItem[i] = {};

                        Qst.Values.ValueItem[i].Title = currItemName;
                        Qst.Values.ValueItem[i].Type = type;
                        Qst.Values.ValueItem[i].OptionValue = currItemName;
                        Qst.Values.ValueItem[i].DefaultSelected = false;
                        Qst.Values.ValueItem[i].OrderID = i;

                        (function () {
                            var tr = arguments[0];
                            var num = arguments[1];

                            $(tr).find("#edtDefVal").unbind();
                            $(tr).find("#edtDefVal").bind("click", function () {
                                Qst.IsDefValue(this, num);
                            });

                            $(tr).find("#edtRemoveTr").unbind();
                            $(tr).find("#edtRemoveTr").bind("click", function () {
                                Qst.RemoveTr(tr, num);
                            });
                        })($(this), i);
                    });
                }
                break;
            case "textarea":
                var val = null;
                if (this.CurrentState == this.State.Edit) {
                    val = this.Values.ValueItem[0].OptionValue.replace(/<br\s+\/?>/g, "\r\n").replace(/#\*#/g, "________");
                    $("#QuestionItemOpt textarea").val(val); //this.Values.ValueItem[0].OptionValue.replace(/<br \/>/gi, "\r\n").replace(/#\*#/g, "________")
                }
                else {
                    val = $("#QuestionItemOpt textarea").val().replace(/\r/ig, "<br />").replace(/\n/ig, "<br />");

                    if (Qst.CurrentState == Qst.State.New)
                        Qst.Values.ValueItem[0] = {};

                    this.Values.ValueItem[0].Title = title;
                    this.Values.ValueItem[0].Type = 4;
                    this.Values.ValueItem[0].OptionValue = val.replace(/_+/g, "#*#");
                    this.Values.ValueItem[0].DefaultSelected = false;
                }
                $("#QuestionPreview #QuestionBody").html(val.replace(/\r\n/gi, "<br />"));
                break;
            case "text":
                var text = this.Text(n);
                $("#QuestionPreview #QuestionBody").html(text);

                if (Qst.CurrentState == Qst.State.New)
                    Qst.Values.ValueItem[0] = {};

                this.Values.ValueItem[0].Title = title;
                this.Values.ValueItem[0].Type = 4;
                this.Values.ValueItem[0].OptionValue = n;
                this.Values.ValueItem[0].DefaultSelected = false;
                break;
            case "multiLine":
                var textarea = this.Textarea(n);
                $(textarea).attr("cols", "80").attr("rows", "5");
                $("#QuestionPreview #QuestionBody").html(textarea);

                if (Qst.CurrentState == Qst.State.New)
                    Qst.Values.ValueItem[0] = {};

                this.Values.ValueItem[0].Title = title;
                this.Values.ValueItem[0].Type = 8;
                this.Values.ValueItem[0].OptionValue = n;
                this.Values.ValueItem[0].DefaultSelected = false;
                break;
            case "custom":
                var val = null;
                if (this.CurrentState == this.State.Edit) {
                    val = this.Values.ValueItem[0].OptionValue.split("#*#");
                    $("#QuestionItemOpt textarea").val(this.Values.ValueItem[0].OptionValue.replace(/#*#/g, "\r\n"));
                }
                else {
                    val = $("#QuestionItemOpt textarea").val().replace(/\r/ig, "#*#").replace(/\n/ig, "#*#").split("#*#");
                }

                for (var i = 0; i < val.length; i++) {
                    if (val[i] != "") {
                        var tmp = this.Text(val[i]);
                        var li = AsyncDom.CreateElement("li", null, null, null);
                        li.innerHTML = val[i];
                        $(li).append(tmp);
                        $("#QuestionPreview #QuestionBody").find("ul").append(li);
                    }
                }

                if (Qst.CurrentState == Qst.State.New)
                    Qst.Values.ValueItem[0] = {};

                this.Values.ValueItem[0].Title = title;
                this.Values.ValueItem[0].Type = 4;
                this.Values.ValueItem[0].OptionValue = val.join("#*#");
                this.Values.ValueItem[0].DefaultSelected = false;
                break;
        }
    },
    MoveUp: function (objElement, DataContainer) {
        if (!$(objElement).prev().attr("id")) {
            this.Notify("已经是第一个了！");
            return;
        }

        var tagName = $(objElement).attr("tagName").toLowerCase();
        var CloneElement = $(objElement).clone(true);
        $(objElement).prev().before(CloneElement);
        $(objElement).remove();
        this.Preview(DataContainer, tagName);
    },
    MoveDown: function (objElement, DataContainer) {
        if (!$(objElement).next().attr("id")) {
            this.Notify("已经是最后一个了！");
            return;
        }

        var tagName = $(objElement).attr("tagName").toLowerCase();
        var CloneElement = $(objElement).clone(true);
        $(objElement).next().after(CloneElement);
        $(objElement).remove();
        this.Preview(DataContainer, tagName);
    },
    IsDefValue: function (Element, n) {
        var checked = $(Element).attr("checked");
        this.Values.ValueItem[n].DefaultSelected = (checked == undefined) ? false : checked;
    },
    MustAsw: function (Element) {
        var checked = $(Element).attr("checked");
        this.Values.MustAnswer = checked;
        checked ? $("#QuestionPreview #mustAnswer").show() : $("#QuestionPreview #mustAnswer").hide();
    },
    SetAttribute: function (Element, Attribute, AttributeValue, IsRemove) {
        if (typeof (Element) == "string")
            Element = document.getElementById(Element);
        if (IsRemove)
            $(Element).removeAttr(Attribute);
        else {
            $(Element).attr(Attribute, AttributeValue);
        }
    },
    Edit: function (Element, Type, ID) {
        if (!$("#designer").attr("id")) {
            $.post(this.Url, { act: "QstEdt", QuestionID: ID }, function (_result_) {
                var json = eval("(" + _result_ + ")");
                Qst.Values = json;
                Qst.CurrentState = Qst.State.Edit;

                var CurrentQst = $(Element).parent().parent().parent();
                Qst.LoadFrmByType(Type, CurrentQst);
            });
        }
        else
            this.Notify("请完成当前的编辑在继续！");
    },
    Notify: function (Message) {
        $("#Notify").css("display", "block").html(Message);
        setTimeout(function () { $("#Notify").hide(); }, 4500);
    },
    MsgBox: function () {
        var msg = null;
        if (this.CurrentState == this.State.Edit)
            msg = window.prompt("问题说明！", this.Values.Description);
        else
            msg = window.prompt("问题说明！", "");
        this.Values.Description = msg;
    },
    Finish: function () {
        ///提交数据
        this.Submit();
        ///
        var prev = $("#designer #QuestionPreview").html();
        var QstItem = AsyncDom.CreateElement("div", "QuestionItem", null, prev);
        if (this.CurrentState == this.State.Edit) {
            $("#designer").replaceWith(QstItem);
        }
        else {
            $("#designer").remove();
            $("#QuestionBody").append(QstItem);
        }
        $(QstItem).find("#QuestionOpt").css("display", "none");
        $(QstItem).find("#QuestionOpt span:first").css("display", "none");
        var span = AsyncDom.CreateElement("span", null, null, "<a href=\"#\" onclick=\"Qst.Edit(this,'" + this.ElementType + "','" + this.QuestionID + "')\">编辑</a>");
        $(QstItem).find("#QuestionOpt").prepend(span);
        $(QstItem).append("<input type=\"hidden\" id=\"ID\" value=\"" + this.QuestionID + "\" />");
        $("#QuestionOpt").find("#edtDel").find("a").unbind("click");
        (function () {
            var ID = Qst.QuestionID;
            $("#QuestionOpt").find("#edtDel").find("a").bind("click", function () {
                if (confirm("确定要删除该项吗？"))
                    Qst.Delete(this, ID);
            });
        })();

        $(QstItem).bind("mouseover", function () {
            $(this).addClass("QuestionHover");
            $(this).find("#QuestionOpt").css("display", "block");
        });
        $(QstItem).bind("mouseout", function () {
            $(this).removeClass("QuestionHover");
            $(this).find("#QuestionOpt").css("display", "none");
        });

        ///释放对象
        this.Dispose();
        ///
    },
    Delete: function (Element, ID) {
        if (ID != "") {
            $.get(this.Url + "?act=QstDel&ID=" + ID + "&" + Math.random(), function (_result_) {
                var val = eval("(" + _result_ + ")");
                if (val.Result == "success") {
                    if (typeof (Element) == "string")
                        Element = document.getElementById(Element);
                    var tmp = null;
                    if ($(Element).parent().parent().parent().attr("id") != "")
                        tmp = $(Element).parent().parent().parent().parent();
                    else
                        tmp = $(Element).parent().parent().parent();
                    $(tmp).remove();

                    $(".QuestionItem").each(function (i) {
                        $(this).find("#QuestionID").html(i + 1 + ".");
                    });
                }
            });
        }
        else {
            if (typeof (Element) == "string")
                Element = document.getElementById(Element);
            var tmp = null;
            if ($(Element).parent().parent().parent().attr("id") != "")
                tmp = $(Element).parent().parent().parent().parent();
            else
                tmp = $(Element).parent().parent().parent();
            $(tmp).remove();

            $(".QuestionItem").each(function (i) {
                $(this).find("#QuestionID").html(i + 1 + ".");
            });
        }

        this.Dispose();
    },
    Dispose: function () {
        this.Values = null;
        this.ElementType = null;
        this.CurrentState = null;
        this.QuestionID = null;
        this.ResetVariable();
    },
    ResetVariable: function () {
        this.Values = { Type: -1, Title: "", OrderID: 0, Description: "", MustAnswer: true, ValueItem: [] };
    },
    Submit: function () {
        var act = null;
        if (this.CurrentState == this.State.Edit) {
            act = "QstUpt";
        }
        else {
            act = "QstCrt";
        }
        this.Values.Description = escape(this.Values.Description);
        this.Values.Title = escape(this.Values.Title);
        for (var i in this.Values.ValueItem) {
            this.Values.ValueItem[i].Title = escape(this.Values.ValueItem[i].Title);
            this.Values.ValueItem[i].OptionValue = escape(this.Values.ValueItem[i].OptionValue);
        }

        $.ajax({
            url: this.Url,
            type: "POST",
            async: false,
            data: "act=" + act + "&QuestionnaireTypeID=" + this.GetUrlParms("QuestionnaireTypeID") + "&json=" + JSON.stringify(this.Values) + "&" + Math.random(),
            success: function (_result_) {
                var json = eval("(" + _result_ + ")");
                if (json.Result == "success") {
                    Qst.QuestionID = json.DataID;
                }
            }
        });
        //alert("结果数据" + JSON.stringify(this.Values));
    },
    GetUrlParms: function (argsName) {
        var strGetQuery = document.location.search;
        var ExtArr, ObjArr;
        if (strGetQuery == "" || strGetQuery == null)
            return "";
        else {
            strGetQuery = strGetQuery.substr(1);
            if (strGetQuery.indexOf("&") > 0) {
                ExtArr = strGetQuery.split("&");
                for (var j = 0; j < ExtArr.length; j++) {
                    ObjArr = ExtArr[j].split("=");
                    if (ObjArr[0] == argsName)
                        return ObjArr[1];
                }
            }
            else {
                if (strGetQuery.indexOf("=") > 0) {
                    ObjArr = strGetQuery.split("=");
                    if (ObjArr[0] == argsName)
                        return ObjArr[1];
                }
            }
        }
    }
}
