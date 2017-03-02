<%@ Page Language="C#" MasterPageFile="~/Admin/theme/classic/content.Master" AutoEventWireup="true" CodeBehind="EditScoreSubject.aspx.cs" Inherits="We7.CMS.Web.Admin.ScoreManager.EditScoreSubject" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls"
    TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script type="text/javascript" language="javascript">
        function iframeAutoFit()
             {
           try
                {
                                      
                  if(window!=parent)
                    {
                    var a = parent.document.getElementsByTagName("IFRAME");
                     for(var i=0; i<a.length; i++) //author:meizz
                       {
                        if(a[i].contentWindow==window)
                           {
                          var h1=0, h2=0;
                          a[i].parentNode.style.height = a[i].offsetHeight +"px";
                          a[i].style.height = "10px";
        if(document.documentElement&&document.documentElement.scrollHeight)
                        {
                           h1=document.documentElement.scrollHeight;
                         }
                         if(document.body) h2=document.body.scrollHeight;
                         var h=Math.max(h1, h2);
                       if(document.all) {h += 4;}
                        if(window.opera) {h += 1;}
                        a[i].style.height = a[i].parentNode.style.height = h+h*0.3 +"px";
                        }
                  }
             }
         }
        catch (ex){}
          }
         if(window.attachEvent)
        {
           window.attachEvent("onload",iframeAutoFit);
        }
        else if(window.addEventListener)
        {
             window.addEventListener('load',   iframeAutoFit,   false);
        }
     </script>
    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />
    <script src="<%=AppPath%>/cgi-bin/cookie.js" type="text/javascript"></script>
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="积分主题管理">
        </asp:Label>
        <span class="summary">
           <%-- <asp:Label ID="SummaryLabel" runat="server" Text="积分主题管理说明">
            </asp:Label>--%>
        </span>
    </h2>
    <!--导航路径-->
    <div id="position" >
        <a href='/admin/' target='_parent'>开始</a> > 
        <a href='/admin/scoremanager/ScoreSubjectList.aspx'>积分主题管理 </a> > 
        <a href='#' id='pathLast'>_</a>
    </div>
    <!--main-->
    <div id="mycontent">         
        <div class="Tab menuTab">
            <ul class="Tabs" id="ScoreSubjectMenu">
                <asp:Label runat="server" ID="MenuTabLabel"></asp:Label>
            </ul>
        </div>
        <div class="clear">
        </div>
        <div id="rightWrapper">
            <div id="container" style="display: table">
                <asp:PlaceHolder runat="server" ID="ContentHolder"></asp:PlaceHolder>
            </div>
        </div>
    </div>
    <!--读取当前页url-->
    <script type="text/javascript">
        var url = window.location.href;
        var menuIn = $("#ScoreSubjectMenu li.TabIn a")[0];
        $("#pathLast").attr("href",url);
        $("#pathLast").text(menuIn.innerHTML);
    </script>
</asp:Content>