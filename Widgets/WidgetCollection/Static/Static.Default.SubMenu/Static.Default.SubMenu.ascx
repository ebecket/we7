<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.BaseControl" %>
<div id="sub_menu">
    <ul class="sf-menu sf-vertical sub-menu">
        <li><a href="javascript:void(0);">本科</a>
            <ul>
                <li><a href="/programs/ba/iuec/" target="_blank">本科国际化试点班</a></li>
                <li><a href="javascript:void(0);">双学位</a>
                    <ul>
                        <li><a href="/programs/ba/double-degree/econ" target="_blank">经济学(数理)、金融学(数理)</a></li>
                        <li><a href="/programs/ba/double-degree/stat" target="_blank">统计学（数理）</a>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="javascript:void(0);">硕士</a>
            <ul>
                <li><a href="javascript:void(0);">学术硕士</a>
                    <ul>
                        <li><a href="/programs/ma/t1/s1">劳动经济学</a></li>
                        <li><a href="/programs/ma/t1/s2">区域经济学</a></li>
                        <li><a href="/programs/ma/t1/s3">统计学</a></li>
                        <li><a href="/programs/ma/t1/s4">西方经济学</a></li>
                        <li><a href="/programs/ma/t1/s5">金融学</a></li>
                        <li><a href="/programs/ma/t1/s6">数量经济学</a></li>
                    </ul>
                </li>
                <li><a href="javascript:void(0);">专业硕士</a>
                <ul><li><a href="/programs/ma/t2/2016zmlhjrsss/">2016中美联合金融双硕士</a></li>
                        <li><a href="/programs/ma/t2/jrx/">金融学</a></li>
                        <li><a href="/programs/ma/t2/yytj/">应用统计</a></li>
                </ul>
                </li>
                <li><a href="/programs/ma/t3/" target="_blank">国际硕士</a></li>
            </ul>
        </li>
        <li><a href="/programs/phd/">博士</a>
        <ul>
                <li><a href="/programs/phd/xsbs/intro/">学术博士</a></li>
        <li><a href="/programs/phd/tgabsb/">台港澳博士</a></li>
        <li><a href="/programs/phd/irtg/" target="_blank">中德联合培养博士</a></li>
        </ul>
        </li>
        <li><a href="/programs/international-education/" target="_blank">留学项目</a></li>
        <li><a href="/programs/summer-school/" target="_blank">夏令营</a></li>
        <li><a href="/admissions/" target="_blank">招生信息</a></li>
    </ul>
    <div id="search">
        <form action="Search.aspx" method="get">
        <span>
            <input type="text" name="keywords" /></span>
        <button type="button">
        </button>
        </form>
    </div>
</div>
<script type="text/javascript">
    $("#sub_menu .sub-menu").supersubs().superfish({ animation: { height: 'show'} });
    $(function () {
        $("#search button").click(function () {
            var form = $("#search form")
            if (form.find("input").val()) {
                form.submit();
            } else {
                alert("请输入要搜索的关键词！");
            }
        });
    });
</script>
