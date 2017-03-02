<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }
    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "120")]
    public int TitleLength = 120;
    public string strField = string.Empty;

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Desc));
        o.Add(new Order("IsShow", OrderMode.Desc));
        o.Add(new Order("ID", OrderMode.Desc));
        return o;
    }
    protected override Criteria CreateCriteria()
    {
        Criteria c = new Criteria();//Criteria c = base.CreateCriteria();
        string strId = Request["cate"] != null ? Request["cate"].ToString() : "";
        strField = Request["field"] != null ? Request["field"].ToString() : "";

        string strOwnenId = "";
        if (Channel.ID == null)
        {
            strOwnenId = "{7d326420-7905-4847-850d-3a4573a00d53}";
        }
        else
        {
            strOwnenId = Channel.ID;
        }
        c.Add(CriteriaType.Equals, "State", 1);
        c.Add(CriteriaType.Equals, "OwnerID", strOwnenId);
        if (strId == "1")
        {
            Criteria c2 = new Criteria();
            c2.Mode = CriteriaMode.Or;
            c2.Add(CriteriaType.Equals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
            c2.Add(CriteriaType.Equals, "Cate", "经济学院实务讲座");
            c2.Add(CriteriaType.Equals, "Cate", "富邦金融与产业论坛");
            c2.Add(CriteriaType.Equals, "Cate", "厦门大学量化金融实务系列讲座");
            c.Criterias.Add(c2);
            //c.Add(CriteriaType.Equals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
        }
        else
        {
            Criteria c2 = new Criteria();
            c2.Mode = CriteriaMode.And;
            c2.Add(CriteriaType.NotEquals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
            c2.Add(CriteriaType.NotEquals, "Cate", "经济学院实务讲座");
            c2.Add(CriteriaType.NotEquals, "Cate", "富邦金融与产业论坛");
            c2.Add(CriteriaType.NotEquals, "Cate", "厦门大学量化金融实务系列讲座");
            if (string.IsNullOrEmpty(strField) != true)
            {
                c2.Add(CriteriaType.Equals, "Field", strField);
            }
            c.Criterias.Add(c2);
            //c.Add(CriteriaType.NotEquals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
        }
        return c;
    }
    protected List<Channel> GetDBChannels(string strID)
    {
        Criteria c = new Criteria();
        c.Mode = CriteriaMode.And;
        c.Add(CriteriaType.Equals, "State", 1);
        c.Add(CriteriaType.Equals, "ID", strID);
        List<Channel> templist = Assistant.List<Channel>(c, null);
        return templist;
    }
</script>

<div class="<%=CssClass %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 0; i < arr.Length - 1; i++)
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=arr[i]%></a><em class="arrow-right"></em></span>
        <%
                }
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=Channel.Name%></a><%if (arr.Length == 1)
                                   { %><em class="arrow"></em><%}else if(string.IsNullOrEmpty(strField) != true){ %>
                                   <em class="arrow-right"></em><%}%>
        </span>
        <%}
            else
            { %>
        <span class="title title_arr"><a class="txt" href="javascript:void(0);">学术动态
        </a><em class="arrow-right"></em></span><span class="title"><a class="txt" href="javascript:void(0);">
            经济金融实务讲座 </a></span>
        <%    
            } %>
        <%if (string.IsNullOrEmpty(strField) != true)
          {
        %>
        <span class="title title_arr"><a class="txt" href="javascript:void(0);">
            <%=strField%></a>
        </span>
        <%
              } %>
    </h1>
    <ul>
        <% 
            for (int i = 0; i < Items.Count; i++)
            {
                string title = (!string.IsNullOrEmpty(Items[i]["Speaker"].ToString()) ? Items[i]["Speaker"] + "：" : "") + Items[i]["Title"];
                DateTime dueTime;
                string css = string.Empty;
                bool result = DateTime.TryParse(Items[i]["DueTime"].ToString(), out dueTime);
                if (result && dueTime > DateTime.Now)
                {
                    css = "class='top'";
                }
                string strId = Request["id"] != null ? Request["id"].ToString() : "";
                string strClikeUrl = string.IsNullOrEmpty(strId) == true ? GetUrl(Items[i]["ID"]) : string.Format("/events/seminars{0}", GetUrl(Items[i]["ID"]));
        %>
        <li <%=(i == 0 ? "class='first'" : "")%>><em class="arrow"></em><a href="<%=strClikeUrl %>"
            target="_blank" title="<%=(title.Length * 2 > TitleLength ? title : "") %>" <%=css %>>
            <%=ToStr(title, TitleLength)%></a>
            <%= string.IsNullOrEmpty(Items[i]["Url"].ToString()) != true ? ("<a href='" + Items[i]["Url"] + "' class='go_site' target='_blank'>专题网址</a>") : ""%>
            <br />
            <label <%=css %>>
                时间：<%=Items[i]["StartTime"]%></label>
            <label <%=css %>>
                地点：<%=Items[i]["Address"]%></label>
        </li>
        <%} %>
    </ul>
    <%=(Items.Count <= 0 ? "<div class='pager_container'>没有数据！</div>" : Pager.PagedHtml)%>
    <h2>
    </h2>
</div>
