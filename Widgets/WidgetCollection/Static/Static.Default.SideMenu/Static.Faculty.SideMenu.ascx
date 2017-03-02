<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.BaseControl" %>
<div id="side_menu" class="module side_menu faculty_side_menu">
    <%--<h1>
        <span class="title">教学研究人员</span></h1>--%>
    <ul>
        <li><em class="arrow"></em><a href="/people/faculty?ListBy=IndexLetter">按姓名</a></li>
        <li><em class="arrow"></em><a href="/people/faculty?ListBy=Subject">按学科领域</a>
            <ul>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("宏观经济学")%>">
                    宏观经济学</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("微观经济学")%>">
                    微观经济学</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("计量经济学")%>">
                    计量经济学</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("金融学")%>">
                    金融学</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("统计学")%>">
                    统计学</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("应用微观")%>">
                    应用微观</a></li>
				<li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Subject&Subject=" + HttpUtility.UrlEncode("英语教学")%>">
                    英语教学</a></li>
            </ul>
        </li>
        <li><em class="arrow"></em><a href="/people/faculty?ListBy=Cate">按聘任类型</a>
			<ul>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Cate&Cate=" + HttpUtility.UrlEncode("全职教师")%>">
                    全职教师</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Cate&Cate=" + HttpUtility.UrlEncode("客座教授")%>">
                    客座教授</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Cate&Cate=" + HttpUtility.UrlEncode("兼职教授")%>">
                    兼职教授</a></li>
                <li><em class="dot"></em><a href="<%="/people/faculty?ListBy=Cate&Cate=" + HttpUtility.UrlEncode("专任教师")%>">
                    专任教师</a></li>
            </ul>
		</li>
    </ul>
    <h2>
    </h2>
</div>
