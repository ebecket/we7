<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="We7.CMS.Web.Admin.UserList" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:content id="We7Content" contentplaceholderid="MyContentPlaceHolder" runat="server">
    <div>
        <h2 class="title">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_user.gif" />
            <asp:Label ID="NameLabel" runat="server" Text="会员管理">
            </asp:Label>
            <span class="summary">
                <asp:Label ID="SummaryLabel" runat="server" Text="">
                </asp:Label>
            </span>
        </h2>
        <div id="position">
            &nbsp;<asp:Label ID="FullPathLabel" runat="server" Text=""> </asp:Label>
        </div>
        <div class="toolbar2">
            <li class="smallButton4">
            <asp:LinkButton id="lnkPass" runat="server">启用</asp:LinkButton>
            </li>
             <li class="smallButton4">
            <asp:LinkButton id="lnkStop" runat="server">禁用</asp:LinkButton>
            </li>
            <li class="smallButton8">
            <a href="javascript:sendmail()">给选中用户发邮件</a>
            </li>
        </div>
        <wec:messagepanel id="Messages" runat="server">
    </wec:messagepanel>
    </div>
    <div style="display: table; width: 100%">
         <ul class="subsubsub">
            <asp:Literal ID="StateLiteral" runat="server"></asp:Literal>
         </ul>  
         <p class="search-box" >
	        <label class="hidden" for="user-search-input">搜索用户:</label>
	        <input type="text" class="search-input" id="KeyWord" name="KeyWord" value=""    />
	        <input type="button" value="搜索用户" class="button" id="SearchButton"    />
        </p>
    </div>
    <div style="min-height: 35px;">
        <asp:GridView ID="AccountsGridView" runat="server" AutoGenerateColumns="False"
            CssClass="List" GridLines="Horizontal" ShowFooter="True">
            <AlternatingRowStyle CssClass="alter" />
            <Columns>
                <asp:TemplateField HeaderText="名称">
                     <HeaderStyle Width="30px" />
                    <HeaderTemplate>
                        <input type="checkbox" name="chkall" onclick="this.checked?$('input[type=\'checkbox\']').attr('checked','checked'):$('input[type=\'checkbox\']').removeAttr('checked')" />
                    </HeaderTemplate>
                     <ItemTemplate>
                        <input type="checkbox" name="ids" value='<%#Eval("ID") %>' />
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                <asp:TemplateField HeaderText="名称">
                 <HeaderStyle Width="130px" />
                     <ItemTemplate>
                     <a href="/admin/Permissions/AccountEdit.aspx?id=<%#Eval("ID") %>">
                     <%# Eval("LoginName") %>
                     </a>
                    </ItemTemplate>
                </asp:TemplateField>
                
                 <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="200px" />
                 <asp:TemplateField HeaderText="注册时间">
                     <HeaderStyle Width="100px" />
                    <ItemTemplate >
                    <span style="font-size:12px">
                        <%# Eval("CreatedNoteTime")%></span>
                    </ItemTemplate>
                </asp:TemplateField>
       
                <asp:TemplateField HeaderText="Email验证">
                     <HeaderStyle Width="60px" />
                    <ItemTemplate>
                        <%# ((int)Eval("EmailValidate"))==0?"<font style='color:red'>未验证</font>":"<font style='color:green'>通过</font>" %>
                    </ItemTemplate>
                </asp:TemplateField>
                
            <asp:TemplateField HeaderText="类型">
                     <HeaderStyle  />
                    <ItemTemplate>
                        <%# GetAllState(Eval("ModelState"), Eval("ModelName"), Eval("State"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <HeaderStyle Width="90px" />
                    <ItemTemplate>
                        <%# ((int)Eval("State"))==0?"<font style='color:red'>禁用</font>":"<font style='color:green'>启用</font>" %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="pagination">
        <wec:urlpager id="UPager" runat="server" usespacer="False" usefirstlast="true" pagesize="10"
            firsttext="<< 首页" lasttext="尾页 >>" linkformatactive='<span class=Current>{1}</span>'
            urlformat="UserList.aspx?pg={0}" cssclass="Pager" />
    </div>
  <script type="text/javascript">
	$(function()
	{
		$('#KeyWord').bind('keyup',function(event) {  
          if(event.keyCode==13){  
           window.location="UserList.aspx?keyword="+encodeURIComponent(this.value);
           }
       });
       $('#SearchButton').click(function() {
           window.location="UserList.aspx?keyword="+encodeURIComponent($('#KeyWord').val());
       });
       if(QueryString('keyword'))
            $('#KeyWord').val(QueryString('keyword'));
	});
</script>
 <script language="javascript">
        function sendmail()
        {
        var s = document.getElementsByName("ids");
        var names= "";
        for( var i = 0; i < s.length; i++ )
        {
            if (s[i].checked ){
                names += s[i].value+',';
            }
        }
        names = names.substr(0,names.length-1);
        location.href = "../tools/NotifyMail.aspx?ids="+names; //这里传过去的是已逗号分隔开的id，需要在后面的页面内取出
        }
    </script>
</asp:content>
