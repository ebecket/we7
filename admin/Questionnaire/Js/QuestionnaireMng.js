var QuestionnaireMng = {
    Url: "Ajax/Ajax.ashx",
    Cache: null,
    QstPublish: function () {
        var Action = "act=QstPublish&ID=" + arguments[0];
        this.Submit(Action);
    },
    Href: function () {
        var href = "";
        for (var i = 0; i < arguments.length; i++) {
            href += $(arguments[i]).attr("rel");
        }
        window.location.href = href + "&" + Math.random();
    },
    Delete: function () {
        var Action = "act=QstnaireDel&ID=" + arguments[0];
        this.Cache = arguments[1];
        this.Submit(Action);
    },
    RemoveDom: function () {
        $(this.Cache).remove();
        this.Cache = null;
    },
    Submit: function () {
        $.ajax({
            url: this.Url,
            data: arguments[0],
            type: "POST",
            async: false,
            success: function (_result_) {
                var json = eval("(" + _result_ + ")");
                if (json.Result == "success") {
                    switch (json.Action) {
                        case "reload":
                            window.location.reload();
                            break;
                        case "remove":
                            if (QuestionnaireMng.Cache != null) {
                                QuestionnaireMng.RemoveDom();
                            }
                            break;
                    }
                }
            }
        });
    }
}