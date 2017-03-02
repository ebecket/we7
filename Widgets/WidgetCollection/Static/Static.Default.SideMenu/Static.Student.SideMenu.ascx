<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.BaseControl" %>
<div id="side_menu" class="module side_menu student_side_menu">
    <h1>
        <span class="title">人才培养</span></h1>
        <%
            string type = Request["type"] != null ? Request["type"].ToString() : "";
            if (string.IsNullOrEmpty(type) != true || type == "毕业")
            { %>
                <ul>
        <li id="li5"><em class="arrow"></em><a href="#">学生就业</a>
        <ul>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2015&type=<%=HttpUtility.UrlEncode("毕业") %>">2015届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2014&type=<%=HttpUtility.UrlEncode("毕业") %>">2014届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2013&type=<%=HttpUtility.UrlEncode("毕业") %>">2013届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2012&type=<%=HttpUtility.UrlEncode("毕业") %>">2012届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2011&type=<%=HttpUtility.UrlEncode("毕业") %>">2011届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2010&type=<%=HttpUtility.UrlEncode("毕业") %>">2010届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2009&type=<%=HttpUtility.UrlEncode("毕业") %>">2009届毕业生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Graduatetime=2008&type=<%=HttpUtility.UrlEncode("毕业") %>">2008届毕业生</a></li>
        </ul>
        </li>
    </ul>
    <%}
            else
            { %>
    <ul>
        <li id="li1"><em class="arrow"></em><a href="#">硕士研究生</a>
        <ul id="student1" style="display: none">
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2015">15级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2014">14级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2013">13级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2012">12级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2011">11级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2010">10级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2009">09级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2008">08级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2007">07级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2006">06级硕士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("硕士") %>&Grade=2005">05级硕士生</a></li>
        </ul>
        </li>
        <li id="li2"><em class="arrow"></em><a href="#">博士研究生</a>
        <ul id="student2" style="display: none">
        <li><em class="dot"></em><a href="/programs/students?degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2015">15级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2014">14级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2013">13级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2012">12级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2011">11级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2010">10级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2009">09级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2008">08级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2007">07级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2006">06级博士生</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("博士") %>&Grade=2005">05级博士生</a></li>
        </ul>
        </li>
        <li id="li3"><em class="arrow"></em><a href="#">国际化本科实验班</a>
        <ul id="student3" style="display: none">
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("国际化本科实验班") %>&Grade=2015">15级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("国际化本科实验班") %>&Grade=2014">14级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("国际化本科实验班") %>&Grade=2013">13级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("国际化本科实验班") %>&Grade=2012">12级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("国际化本科实验班") %>&Grade=2011">11级</a></li>
        </ul>
        </li>
        <li id="li4"><em class="arrow"></em><a href="#">WISE-SOE国际硕士</a>
        <ul id="student4" style="display: none">
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2015">2015级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2014">2014级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2013">2013级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2012">2012级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2011">2011级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2010">2010级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2009">2009级</a></li>
        <li><em class="dot"></em><a href="/programs/students?Degree=<%=HttpUtility.UrlEncode("WISE-SOE国际硕士") %>&Grade=2008">2008级</a></li>
        </ul>
        </li>
    </ul>
     <%} %>
    <h2></h2>
</div>
<script type="text/javascript">
    $(function () {
        $("#li1").bind("click", function () {
            $("#student1").toggle();
        });
        $("#li2").bind("click", function () {
            $("#student2").toggle();
        });
        $("#li3").bind("click", function () {
            $("#student3").toggle();
        });
        $("#li4").bind("click", function () {
            $("#student4").toggle();
        });
    });
</script>
