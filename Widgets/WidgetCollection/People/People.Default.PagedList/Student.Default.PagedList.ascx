<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Student";
        }
    }
    protected string GetUrl(string ownerid, object id)
    {
        return We7.CMS.UrlHelper.GetUrl(ownerid, id as string);
    }

    private Dictionary<Channel, DataRowCollection> channelList;
    protected Dictionary<Channel, DataRowCollection> ChannelList
    {
        get
        {
            if (channelList == null)
            {
                channelList = new Dictionary<Channel, DataRowCollection>();
            }
            return channelList;
        }
    }

    protected override void OnInitData()
    {
        List<Order> os = CreateOrders();
        We7.Model.Core.Data.ModelDBHelper dbhelper = We7.Model.Core.Data.ModelDBHelper.Create(ModelName);
        QueryByColumn = false;
        //string grade = Request["grade"] != null ? Request["grade"].ToString() : "";
        //string degree = Request["degree"] != null ? Request["degree"].ToString() : "";
        Criteria c = CreateCriteria();
        DataRowCollection rows = dbhelper.QueryPagedList(c, os, 0, 100).Rows;
        ChannelList.Add(Channel, rows);
    }

    protected override Criteria CreateCriteria()
    {
        Criteria c = base.CreateCriteria();
        //if (string.IsNullOrEmpty(grade) != true) c.Add(CriteriaType.Equals, "Grade", grade);
        //if (string.IsNullOrEmpty(degree) != true) c.Add(CriteriaType.Equals, "Degree", degree);
        return c;
    }

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("Degree", OrderMode.Asc));
        o.Add(new Order("major", OrderMode.Desc));
        o.Add(new Order("StuNo"));
        return o;
    }
</script>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            string grade = Request["grade"] != null ? Request["grade"].ToString() : "";
            string degree = Request["degree"] != null ? Request["degree"].ToString() : "";
            string type = Request["type"] != null ? Request["type"].ToString() : "";
            string graduatetime = Request["Graduatetime"] != null ? Request["Graduatetime"].ToString() : "";
        %>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int j = 0; j < arr.Length - 1; j++)
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=arr[j]%></a><em class="arrow-right"></em></span>
        <%
                }
                if (string.IsNullOrEmpty(type) != true || type == "毕业")
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">学生就业</a><em
            class="arrow-right"></em></span> <span class="title"><a class="txt" href="javascript:void(0);">
                <% =graduatetime%>届毕业生</a></span>
        <%
                }
                else
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=Channel.Name%></a><%if (arr.Length == 1)
                                   { %><em class="arrow"></em><%} %>
            <em class="arrow-right"></em></span>
        <%}
        %><span class="title"><a class="txt" href="javascript:void(0);">
            <% =grade + degree%></a></span>
        <%
            }
        %>
    </h1>
    <%
        int i = 0;
        foreach (KeyValuePair<Channel, DataRowCollection> kvp in ChannelList)
        {
            DataRowCollection items = kvp.Value;
            Channel channel = kvp.Key;
            i++;
    %>
    <div id="<%=ID + channel.FullUrl.Replace("/","_") %>">
        <%
            if (string.IsNullOrEmpty(type) != true || type == "毕业")
            { %>
        <table>
            <tr>
                <th>
                    姓名
                </th>
                <th>
                    专业
                </th>
                <th>
                    就业及求学情况
                </th>
                <th>
                    论文题目
                </th>
                <th>
                    学历
                </th>
            </tr>
            <%
                for (int j = 0; j < items.Count; j++)
                {%>
            <tr>
                <td>
                    <%=items[j]["stuName"]%>
                </td>
                <td>
                    <%=items[j]["major"]%>
                </td>
                <td>
                    <%=items[j]["Job"]%>
                </td>
                <td>
                    <%
                    if (string.IsNullOrEmpty(items[j]["Url"].ToString()) == true)
                    {%>
                    <%=items[j]["Paper"]%>
                    <%}
                    else
                    {
                    %>
                    <a href="<%=items[j]["Url"]%>" target="_blank">
                        <%=items[j]["Paper"]%></a>
                    <%} %>
                </td>
                <td>
                    <%=items[j]["Degree"]%>
                </td>
            </tr>
            <%} %>
        </table>
        <%}
            else
            {%>
        <ul>
            <%
                for (int j = 0; j < items.Count; j++)
                {
                    string strDegree = items[j]["Degree"].ToString();
                    string preDegree = (strDegree == "硕士") ? "本科" : "硕士";
                    switch (strDegree)
                    {
                        case "国际化本科实验班":
                            preDegree = "国际化本科实验班";
                            break;
                        case "博士":
                            preDegree = "硕士";
                            break;
                        case "硕士":
                            preDegree = "本科";
                            break;
                        case "WISE-SOE国际硕士":
                            preDegree = "WISE-SOE国际硕士";
                            break;
                        case "本科":
                        default:
                            preDegree = "高中";
                            break;
                    }
                    
            %>
            <li>
                <table>
                    <tr>
                        <%
                    if (preDegree != "WISE-SOE国际硕士")
                    {%>
                        <td rowspan="6" class="col1">
                            <img src="<%=items[j]["Photo"] %>" alt="" />
                        </td>
                        <% }
                    string strColor = "col2";
                    if (preDegree == "WISE-SOE国际硕士")
                    {
                        strColor = (items[j]["schoolName"].ToString().Trim() == "WISE") ? "col3" : "col4";
                    }
                        
                        %>
                        <th class="<%=strColor %>">
                            姓名 Name
                        </th>
                        <td>
                            <span style="float: left"><strong><%=items[j]["stuName"]%></strong>
                                </span><%--<span><%=items[j]["Grade"]%><%=strDegree%></span>--%>
                        </td>
                    </tr>
                    <%
                    if (preDegree == "WISE-SOE国际硕士")
                    {%>
                    <tr>
                        <th class="<%=strColor %>">
                            学院 School
                        </th>
                        <td>
                            <%=items[j]["schoolName"]%>
                        </td>
                    </tr>
                    <tr>
                        <th class="<%=strColor %>">
                            年级 Year of Enrollment
                        </th>
                        <td>
                            <%=items[j]["Grade"]%>
                        </td>
                    </tr>
                    <tr>
                        <th class="<%=strColor %>">
                            专业 Program
                        </th>
                        <td>
                            <%=items[j]["major"]%>
                        </td>
                    </tr>
                    <tr>
                        <th class="<%=strColor %>">
                            国籍 Nationality
                        </th>
                        <td>
                            <%=items[j]["Nationality"]%>
                        </td>
                    </tr>
                    <%
                    }
                    else if (preDegree == "国际化本科实验班")
                    {%>
                    <tr>
                        <th>
                            性别
                        </th>
                        <td>
                            <%=items[j]["gender"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            学号
                        </th>
                        <td>
                            <%=items[j]["StuNo"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            E-mail
                        </th>
                        <td><a href="mailto:<%=items[j]["Email"]%>"><%=items[j]["Email"]%></a>
                        </td>
                    </tr>
                    <%    
                    }
                    else if (degree == "博士" && Int32.Parse(grade)>=2015)
                        {
                    %>
                    <tr>
                        <th>
                            专业
                        </th>
                        <td>
                            <%=items[j]["major"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            本科院校
                        </th>
                        <td>
                            <%=items[j]["preSchool"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            本科专业
                        </th>
                        <td>
                            <%=items[j]["preMajor"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <%=preDegree%>院校
                        </th>
                        <td>
                            <%=items[j]["masterSchool"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <%=preDegree%>专业
                        </th>
                        <td>
                            <%=items[j]["masterMajor"]%>
                        </td>
                    </tr>
                    <tr><td></td>
                        <th>
                            E-mail
                        </th>
                        <td><a href="mailto:<%=items[j]["Email"]%>"><%=items[j]["Email"]%></a>
                        </td>
                    </tr>
                    <%      
                    }else
                    {
                    %>
                    <tr>
                        <th>
                            专业
                        </th>
                        <td>
                            <%=items[j]["major"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <%=preDegree%>院校
                        </th>
                        <td>
                            <%=items[j]["preSchool"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <%=preDegree%>专业
                        </th>
                        <td>
                            <%=items[j]["preMajor"]%>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            E-mail
                        </th>
                        <td><a href="mailto:<%=items[j]["Email"]%>"><%=items[j]["Email"]%></a>
                        </td>
                    </tr>
                    <%} %>
                </table>
            </li>
            <%
                }
            %>
        </ul>
        <%
            }
        %>
    </div>
    <%} %>
</div>
