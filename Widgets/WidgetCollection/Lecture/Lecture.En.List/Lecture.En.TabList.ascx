<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetList" %>
<script type="text/C#" runat="server">
    [Parameter(Title = "栏目一", Type = "Channel")]
    public string OwnerID1 = String.Empty;

    [Parameter(Title = "栏目二", Type = "Channel")]
    public string OwnerID2 = String.Empty;

    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "50")]
    public int TitleLength = 50;

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
        foreach (Channel channel in Channels)
        {
            Criteria c = CreateCriteria(channel.ID);
            ChannelList.Add(channel, dbhelper.QueryPagedList(c, os, 0, channel.ID == OwnerID2 ? 3 : 2).Rows);
        }
    }

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Asc));
        return o;
    }

    protected Criteria CreateCriteria(string ownerid)
    {
        Criteria c = base.CreateCriteria();
        c.Add(CriteriaType.Equals, "OwnerID", ownerid);
        c.Add(CriteriaType.MoreThan, "DueTime", DateTime.Now);
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
            Criteria c = new Criteria();
            c.Mode = CriteriaMode.And;
            c.Add(CriteriaType.Equals, "State", 1);
            c.Add(CriteriaType.Equals, "ID", ListOwnerID[i]);
            List<Channel> templist = Assistant.List<Channel>(c, null);
            if (templist != null || templist.Count > 0)
            {
                channellist.Add(templist[0]);
            }
        }
        return channellist;
    }
    
</script>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            int i = 0;
            foreach (KeyValuePair<Channel, DataRowCollection> kvp in ChannelList)
            {
                Channel channel = kvp.Key;
                if (i == 0)
                {                    
        %>
        <a class="more" href="<%=channel.FullUrl%>">More</a>
        <%} %>
        <span class="title"><a href="#<%=ID + channel.FullUrl.Replace("/","_") %>" class="txt"
            url="<%=channel.FullUrl %>">
            <%=channel.Name%></a><em class="arrow"></em></span>
        <%
                i++;
            } %>
    </h1>
    <%
        foreach (KeyValuePair<Channel, DataRowCollection> kvp in ChannelList)
        {
            DataRowCollection items = kvp.Value;
            Channel channel = kvp.Key;
    %>
    <div id="<%=ID + channel.FullUrl.Replace("/","_") %>">
        <ul>
            <%if (channel.ChannelName == "seminars")
              {
            %>
            <li class='first first_serimar'>
                <table>
                    <tr>
                        <td>
                            <a href="/english/events/bbs/2015-10-26-16067.html" target="_blank">Finance Seminars/BBS</a>
                        </td>
                        <td>
                            <a href="/english/events/bbs/2015-10-26-16066.html" target="_blank">Experimental BBS</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="/english/events/bbs/2015-10-26-16068.html" target="_blank">Econometrics Seminars/BBS</a>
                        </td>
                        <td>
                            <a href="/english/events/bbs/2015-10-26-16065.html" target="_blank">Microeconomics BBS</a>
                        </td>
                    </tr>
                </table>
            </li>
            <%
          }
              for (int j = 0; j < items.Count; j++)
              { 
                
            %>
            <li><em class="dot"></em>
                <p class="event_title">
                    <%if (string.IsNullOrEmpty(items[j]["Field"].ToString())!=true)
                      {%><%
                          string strUrl = string.Format("/english/events/seminars?field={0}", items[j]["Field"].ToString());
                          
                      %>
                    [<a href="<%=strUrl %>" target="_blank"><%=items[j]["Field"]%></a>]<%
                      } %>
                    <a href="<%=GetUrl(channel.ID, items[j]["ID"]) %>" target="_blank" title="<%=(!string.IsNullOrEmpty(items[j]["Speaker"].ToString()) ? (items[j]["Speaker"] + ": ") : "") + items[j]["Title"] %>">
                        <%=ToStr((!string.IsNullOrEmpty(items[j]["Speaker"].ToString()) ? (items[j]["Speaker"] + ": ") : "") + items[j]["Title"], channel.ID == OwnerID2 ? TitleLength - 6 : TitleLength)%></a>
                    <%=channel.ID == OwnerID2 && !string.IsNullOrEmpty(items[j]["Url"].ToString()) ? ("<a href='" + items[j]["Url"] + "' class='go_site' target='_blank'>Website</a>") : ""%></p>
                <p class="event_detail">
                    <%=ToStr("Time:" + items[j]["StartTime"], TitleLength)%><br />
                    <%=channel.ID == OwnerID1 ? (ToStr("Venue:" + items[j]["Address"], TitleLength) + "<br />") : ""%>
                </p>
            </li>
            <%}%>
        </ul>
        <a class="more more_with" href="<%=channel.FullUrl %>">More</a>
    </div>
    <%} %>
</div>
<script type="text/javascript">
    $("#<%=ID %>").tabs({ onSelected: function (div, tab) { $("#<%=ID %> .more").attr("href", tab.find(".txt").attr("url")) } });
</script>
