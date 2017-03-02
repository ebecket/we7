<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetDetail" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.People";
        }
    }

    protected override Criteria CreateEntryCriteria()
    {
        Criteria c = new Criteria(CriteriaType.None);
        c.Add(CriteriaType.Equals, "ID", ItemID);
        c.Add(CriteriaType.Equals, "State", 1);
        return c;
    }
</script>
<%if(Item["ID"].ToString() != "") { %>
<div class="<%=CssClass %>">
    <div class="content">
        <div class="article_content">
            <div class="faculty_base">
                <div class="faculty_photo"><img src="<%=Item["Photo"] + "?t=" + DateTime.Now.ToString("yyyyMMddhh") %>" alt="" /></div>
                <p class="faculty_name">
                    <%=Item["Fullname"] %></p>
                <p>
                    <%=Item["Title"]%></p>
                <p>
                    <%=Item["School"]%></p>
                <%if (!string.IsNullOrEmpty(Item["CV"].ToString()))
                  {%>
                <p>
                    <a href="<%=Item["CV"] %>" target="_blank">CV下载</a></p>
                <%} %>

                <br />
                <p>
                    <span>电话：</span><%=Item["Phone"] %></p>
                <p>
                    <span>电子邮件：</span><%=Item["Email"] %></p>
                <p>
                    <span>办公室：</span><%=Item["Office"] %></p>
                <%--<p>
                    <span>办公时间：</span><%=Item["Phone"] %></p>--%>
                <%if (!string.IsNullOrEmpty(Item["Url"].ToString()))
                  {%>
                <p>
                    <span>个人主页：</span><a href="<%=Item["Url"] %>" target="_blank"><%=Item["Url"]%></a></p>
                <%}
                  else
                  { %>
                  <p>
                    <span>个人主页：</span></p>
                <%} %>
            </div>
			<div class="auto"> </div>
            <div class="faculty_info tabs">
                <h1>
                    <span class="title"><a href="#a1" class="txt">个人简介</a><em class="arrow"></em></span>
                    <span class="title"><a href="#a2" class="txt">研究成果</a><em class="arrow"></em></span>
                    <span class="title"><a href="#a3" class="txt">研究项目</a><em class="arrow"></em></span>
                </h1>
                <div id="a1">
                    <%=Item["Intro"] %>
                </div>
                <div id="a2">
                    <%=Item["Result"] %>
                </div>
                <div id="a3">
                    <%=Item["Project"] %>
                </div>
                <script type="text/javascript">
                    $(".faculty_info").tabs({eventName: 'click'});
                </script>
            </div>			
        </div>		
        <div class="article_page">
            <ul>
                <li>
                    <%
                        if (PreviousItem != null)
                        {
                    %>
                    <span>上一位：</span><a target="_self" href="<%=GetUrl(PreviousItem["ID"]) %>" title="<%=PreviousItem["Fullname"]%>">
                        <%=ToStr(PreviousItem["Fullname"], 30)%></a>
                    <%}
                        else
                        { %>
                    <span></span>
                    <%}%>
                </li>
                <li class="next">
                    <%
                        if (NextItem != null)
                        {
                    %>
                    <span>下一位：</span><a target="_self" href="<%=GetUrl(NextItem["ID"]) %>" title="<%=NextItem["Fullname"] %>">
                        <%=ToStr(NextItem["Fullname"], 30)%></a>
                    <%}
                        else
                        { %>
                    <span></span>
                    <%}%>
                </li>
            </ul>
        </div>
		<div class="auto"> </div>
    </div>    
</div>
<%}%>