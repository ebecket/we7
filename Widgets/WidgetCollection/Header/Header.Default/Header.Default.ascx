<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.Default.cs" Inherits="We7.CMS.Web.Widgets.Header_Default" %>
<div id="header" class="<%=CssClass %>">
     <div class="head-nav">
            <div class="head-nav-con">
                <p style="line-height: 36px; font-size: 14px; color: #fff; float: left;">
                    欢迎来到中国计量经济学学术网！</p>
                <a href="#" style="margin-top: 6px; position: absolute;" title="" target="_blank">
                    <%--<img src="widgets/Themes/Default/images/weixin.png" alt="" />--%></a><a href="http://se.xmu.edu.cn/"
                        style="line-height: 36px; font-size: 14px; color: #fff; float: left; display: inline-block;
                        margin-left: 600px;">经济学院</a> <a href="http://wise.xmu.edu.cn" style="line-height: 36px;
                            font-size: 14px; color: #fff; float: left; display: inline-block; margin-left: 20px;"
                            target="_blank">王亚南经济研究院</a>
                <div id="searchBox" class="searchBox">
                    <form action="#" method="get" target="_blank">
                    <table border="0" cellpadding="0" cellspacing="0" class="tab_search" align="center"
                        style="margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td>
                                    <input type="hidden" name="m" value="search" />
                                    <input type="hidden" name="c" value="index" />
                                    <input type="hidden" name="a" value="init" />
                                    <input type="hidden" name="siteid" value="1" id="siteid" />
                                    <input type="hidden" name="typeid" value="1" id="typeid" />
                                    <input type="text" name="q" class="searchinput" id="q" onkeydown="if (event.keyCode==13) {}"
                                        onblur="if(this.value==&#39;&#39;)value=&#39;请输入搜索信息&#39;;" onfocus="if(this.value==&#39;请输入搜索信息&#39;)value=&#39;&#39;;"
                                        value="" />
                                </td>
                                <td>
                                    <input type="image" width="100%" height="100%" class="searchaction" src="widgets/Themes/Default/images/search.png"
                                        border="0" hspace="2" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>

     <div class="head-con">
            <div class="logo">
            </div>
            <div class="menu" id="menuNav">
                <ul>
                    <li><a class="hide" href="/default.aspx">首页</a></li>
                    <li><a class="hide" href="">论文</a>
                        <ul class="">
                            <li><a href="/xslm/lw/" target="_blank">学术论文</a></li>
                            <li><a href="/xslm/xshd/" target="_blank">工作论文</a></li>
                            <li><a href="/xslm/hj/" target="_blank">发表论文</a></li>
                            <li><a href="/xslm/xm/" target="_blank">项目</a></li>
                        </ul>
                        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a class="hide" href="">
                        学术会议</a>
                        <!--[if lte IE 6]><a  href="" >师资队伍<table><tr><td><![endif]-->
                    </li>
                    <li><a class="hide" href="">名家名课</a>
                        <!--[if lte IE 6]><a  href="" >科学研究<table><tr><td><![endif]-->
                        <ul class="">
                            <li><a href="/mk/">名课</a></li>
                            <li><a href="/yjry/">名师风采</a></li>
                        </ul>
                        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a class="hide" href="">科研平台</a><!--[if lte IE 6]><a  href="#" >国际交流<table><tr><td><![endif]-->
                        <ul class="">
                            <li><a href="">专业数据库</a></li>
                            <li><a href="">专业应用软件</a></li>
                            <li><a href="">专业计算软件</a></li>
                        </ul>
                        <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a class="hide" href="" target="_blank">关于我们</a>
                        <!--[if lte IE 6]><a  href="#" >校友联系<table><tr><td><![endif]-->
                    </li>
                </ul>
            </div>
        </div>
</div>
