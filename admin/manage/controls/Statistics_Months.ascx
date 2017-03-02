<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics_Months.ascx.cs"
    Inherits="We7.CMS.Web.Admin.Statistics_Months" %>

<script language="javascript">
    var StyleSheetPath = "<%=ThemePath%>/";
    var ThisSiteName = "<%=ThisSiteName %>";

    function switchSysBar() {
        var obj = document.getElementById("switchPoint");
        if (obj.alt == "关闭栏目树") {
            obj.alt = "打开栏目树";
            obj.src = "" + StyleSheetPath + "Images/tree_open.gif";
            document.getElementById("frmTitle").style.display = "none";
        }
        else {
            obj.alt = "关闭栏目树";
            obj.src = "" + StyleSheetPath + "Images/tree_close.gif";
            document.getElementById("frmTitle").style.display = "";
        }
    }
</script>

<script type="text/javascript" src="<%=AppPath%>/ajax/ArticleTreeController.js"></script>

<!-- 初始化 -->
<table style="border: solid 0px #eee" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left" style="width: 170px; display: <%=ChannelTreeVisble%>" valign="top" id="frmTitle">
            <div id="tree-div" style="overflow: visible; height: 400px; width: 170px; border: 0px solid #fff;">
            </div>
            <td onclick="switchSysBar()" valign="top" style="cursor: hand; width: 12px;" align="left">
                <img id="switchPoint" src="<%=ThemePath%>/images/tree_close.gif" alt="关闭栏目树" style="border: 0px;" />
            </td>
        </td>
        <td align="right" valign="top" style="height: 600px">
            <div id="rightTabs">
                <iframe id="ifRightDetail" name="ifRightDetail" frameborder="0" src="/admin/manage/StatisticsMonths.aspx"
                    width="100%" scrolling="no"></iframe>
            </div>
        </td>
    </tr>
</table>
