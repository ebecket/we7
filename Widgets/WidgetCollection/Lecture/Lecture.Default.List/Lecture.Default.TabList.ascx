<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetList" %>
<script type="text/C#" runat="server">
    [Parameter(Title = "栏目一", Type = "Channel")]
    public string OwnerID1 = String.Empty;

    [Parameter(Title = "栏目二", Type = "Channel")]
    public string OwnerID2 = String.Empty;

    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
    public int TitleLength = 30;

    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }

    protected string GetUrl(string ownerid, object id)
    {
        return We7.CMS.UrlHelper.GetUrl(ownerid, id as string);
    }

    protected override void OnInitData()
    {
        List<Order> os = CreateOrders();
        We7.Model.Core.Data.ModelDBHelper dbhelper = We7.Model.Core.Data.ModelDBHelper.Create(ModelName);
        QueryByColumn = false;
        int count = 0;
        foreach (Channel channel in Channels)
        {
            Criteria c = CreateCriteria(channel.ID);
            DataRowCollection rows = dbhelper.QueryPagedList(c, os, 0, PageSize).Rows;
            if (rows.Count == 0)
            {
                rows = dbhelper.QueryPagedList(CreateOldCriteria(channel.ID), CreateOldOrders(), 0, 3).Rows;
            }
            ChannelList.Add(channel, rows);
            count++;
        }
        //增加经济金融实务讲座
        List<Channel> tmpChannels = GetDBChannels(OwnerID1);
        Channel channel1 = tmpChannels[0];
        channel1.Name = "实务讲座";
        channel1.FullUrl = "/events/jinrongseminars/";
        Criteria c1 = CreateNewCriteria(OwnerID1);
        DataRowCollection rows1 = dbhelper.QueryPagedList(c1, os, 0, PageSize).Rows;
        ChannelList.Add(channel1, rows1);
        Dictionary<Channel, DataRowCollection> aChan = new Dictionary<Channel, DataRowCollection>();
    }

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Asc));
        return o;
    }
    //一般讲座&会议
    protected Criteria CreateCriteria(string ownerid)
    {
        Criteria c = base.CreateCriteria();
        Criteria c2 = new Criteria();
        c2.Mode = CriteriaMode.And;
        c2.Add(CriteriaType.NotEquals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
        c2.Add(CriteriaType.NotEquals, "Cate", "经济学院实务讲座");
        c2.Add(CriteriaType.NotEquals, "Cate", "富邦金融与产业论坛");
        c2.Add(CriteriaType.NotEquals, "Cate", "厦门大学量化金融实务系列讲座");
        c.Criterias.Add(c2);
        c.Add(CriteriaType.Equals, "OwnerID", ownerid);
        c.Add(CriteriaType.MoreThan, "DueTime", DateTime.Now);
        return c;
    }
    //经济金融实务讲座
    protected Criteria CreateNewCriteria(string ownerid)
    {
        Criteria c = base.CreateCriteria();
        Criteria c2 = new Criteria();
        c2.Mode = CriteriaMode.Or;
        c2.Add(CriteriaType.Equals, "Cate", "“WISE-经济学院”金融实务与职业规划系列讲座");
        c2.Add(CriteriaType.Equals, "Cate", "经济学院实务讲座");
        c2.Add(CriteriaType.Equals, "Cate", "富邦金融与产业论坛");
        c2.Add(CriteriaType.Equals, "Cate", "厦门大学量化金融实务系列讲座");
        c.Criterias.Add(c2);
        c.Add(CriteriaType.Equals, "OwnerID", ownerid);
        c.Add(CriteriaType.MoreThan, "DueTime", DateTime.Now);
        return c;
    }

    protected List<Order> CreateOldOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Desc));
        return o;
    }

    protected Criteria CreateOldCriteria(string ownerid)
    {
        Criteria c = base.CreateCriteria();
        c.Add(CriteriaType.Equals, "OwnerID", ownerid);
        return c;
    }

    private List<Channel> channels;
    protected List<Channel> Channels
    {
        get
        {
            if (channels == null)
            {
                channels = GetChannels();
            }
            return channels;
        }
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

    protected List<Channel> GetChannels()
    {
        List<string> ListOwnerID = new List<string>(); ;
        if (!string.IsNullOrEmpty(OwnerID1))
            ListOwnerID.Add(OwnerID1);
        if (!string.IsNullOrEmpty(OwnerID2))
            ListOwnerID.Add(OwnerID2);

        List<Channel> channellist = new List<Channel>();
        for (int i = 0; i < ListOwnerID.Count; i++)
        {
            List<Channel> templist = GetDBChannels(ListOwnerID[i]);
            if (templist != null || templist.Count > 0)
            {
                channellist.Add(templist[0]);
            }
        }
        return channellist;
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
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            int i = 0;
            foreach (KeyValuePair<Channel, DataRowCollection> kvp in ChannelList)
            {
                Channel channel = kvp.Key;
                string strUrl = (channel.FullUrl != "/events/jinrongseminars/") ? channel.FullUrl : "/events/seminars/?cate=1";
                if (i == 0)
                {
        %>
        <a class="more" href="<%=strUrl%>">More</a>
        <%} %>
        <span class="title"><a href="#<%=ID + i %>" class="txt" url="<%=strUrl %>">
            <%=channel.Name%></a><em class="arrow"></em></span>
        <%
                i++;
            } %>
    </h1>
    <%
        i = 0;
        foreach (KeyValuePair<Channel, DataRowCollection> kvp in ChannelList)
        {
            DataRowCollection items = kvp.Value;
            Channel channel = kvp.Key;
            string strUrl = (channel.FullUrl != "/events/jinrongseminars/") ? channel.FullUrl : "/events/seminars/?cate=1";
    %>
    <div id="<%=ID + i %>">
        <ul>
            <%
            for (int j = 0; j < items.Count; j++)
            {
                string showStyle = (DateTime.Parse(items[j]["DueTime"].ToString()) >= DateTime.Now) ? "event_title" : "";
            %>
            <%if (i == 0 && j==0)
              {
            %><li class='first'>
                <div class="serimar_tab">
                 &nbsp;&nbsp;&nbsp;&nbsp;<span><a href="/english/events/bbs/2015-10-26-16067.html" target="_blank">金融讲座/午餐会</a></span>
                 &nbsp;&nbsp;&nbsp;&nbsp;<span><a href="/english/events/bbs/2015-10-26-16066.html" target="_blank">实验午餐会</a></span><br />
                 &nbsp;&nbsp;&nbsp;&nbsp;<span><a href="/english/events/bbs/2015-10-26-16068.html" target="_blank">计量统计讲座/午餐会</a></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;<span><a href="/english/events/bbs/2015-10-26-16065.html" target="_blank">应用微观午餐会</a></span>
                </div>
            </li>
            <% }%>
            <li><em class="dot"></em>
                <p class="<%=showStyle %>">
                    <a href="<%=GetUrl(channel.ID, items[j]["ID"]) %>" target="_blank" title="<%=(!string.IsNullOrEmpty(items[j]["Speaker"].ToString()) ? (items[j]["Speaker"] + "：") : "") + items[j]["Title"] %>">
                        <%=ToStr((!string.IsNullOrEmpty(items[j]["Speaker"].ToString()) ? (items[j]["Speaker"] + "：") : "") + items[j]["Title"], channel.ID == OwnerID2 ? TitleLength - 8 : TitleLength)%></a>
                    <%=channel.ID == OwnerID2 && !string.IsNullOrEmpty(items[j]["Url"].ToString()) ? ("<a href='" + items[j]["Url"] + "' class='go_site' target='_blank'>专题网址</a>") : ""%></p>
                <p class="event_detail">
                    <%=items.Count <= 2 && channel.ID == OwnerID1 &&!string.IsNullOrEmpty(items[j]["Speaker"].ToString()) ? (ToStr("报告人：" + items[j]["Speaker"], TitleLength) + "<br />") : ""%>
                    <%=items.Count <= 4 ? (ToStr("时间：" + items[j]["StartTime"], TitleLength) + "<br />") : ""%>
                    <%=items.Count <= 3 ? (ToStr("地点：" + items[j]["Address"], TitleLength) + "<br />") : ""%>
                </p>
            </li>
            <%
            }%>
        </ul>
        <a class="more more_with" href="<%=strUrl %>">More</a>
    </div>
    <%i++;
        } %>
</div>
<script type="text/javascript">
    $("#<%=ID %>").tabs({ onSelected: function (div, tab) { $("#<%=ID %> .more").attr("href", tab.find(".txt").attr("url")) } });
</script>
