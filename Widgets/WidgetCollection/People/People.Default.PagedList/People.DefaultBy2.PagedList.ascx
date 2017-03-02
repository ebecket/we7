<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.People";
        }
    }

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("IndexLetter", OrderMode.Asc));
        o.Add(new Order("Fullname", OrderMode.Asc));
        return o;
    }

    protected override void OnInitData()
    {
        int recordcount;
        We7.Model.Core.Data.ModelDBHelper dbhelper = We7.Model.Core.Data.ModelDBHelper.Create(ModelName);
        List<Order> os = CreateOrders();
        Criteria c;
        if (Request["ListBy"] == "Subject")
        {
            c = CreateNewCriteria();
        }
        else
        {
            c = CreateCriteria();
        }

        Items = dbhelper.QueryPagedList(c, os, Pager.PageIndex, Pager.PageSize, out recordcount).Rows;
        Pager.RecordCount = recordcount;
    }

    protected string OtherKey = "其他";

    protected void DictionarySort(Dictionary<string, List<DataRow>> dic)
    {
        List<KeyValuePair<string, List<DataRow>>> list = new List<KeyValuePair<string, List<DataRow>>>(dic);
        list.Sort(delegate(KeyValuePair<string, List<DataRow>> x, KeyValuePair<string, List<DataRow>> y) { return x.Key.CompareTo(y.Key); });
        dic.Clear();
        List<DataRow> other = null;
        foreach (KeyValuePair<string, List<DataRow>> item in list)
        {
            if (item.Key == OtherKey)
                other = item.Value;
            else
                dic.Add(item.Key, item.Value);
        }
        if (other != null && other.Count > 0) dic.Add(OtherKey, other);
    }

    protected Criteria CreateNewCriteria()
    {
        Criteria c = new Criteria();
        List<Order> os = new List<Order>();
        os.Add(new Order("ID"));
        if (QueryByColumn)
        {
            if (String.IsNullOrEmpty(OwnerID))
            {
                OwnerID = ChannelHelper.GetChannelIDFromURL();
            }
            if (IncludeChildren)
            {
                Criteria subC = new Criteria();
                subC.Mode = CriteriaMode.Or;
                subC.Add(CriteriaType.Equals, "OwnerID", OwnerID);

                List<Channel> chs = ChannelHelper.GetChannels(OwnerID);
                if (chs != null && chs.Count > 0)
                {
                    foreach (Channel ch in chs)
                    {
                        c.AddOr(CriteriaType.Equals, "OwnerID", ch.ID);
                    }
                }
            }
            else
            {
                c.Add(CriteriaType.Equals, "OwnerID", OwnerID);
            }
        }
        if (ShowAtHome)
        {
            c.Add(CriteriaType.Equals, "IsShow", 1);
        }
        if (!String.IsNullOrEmpty(Tag))
        {
            c.Add(CriteriaType.Like, "Tags", "%" + Tag + "%");
        }
        c.Add(CriteriaType.Equals, "State", 1);

        string value = Request["Subject"];
        if (!string.IsNullOrEmpty(value))
        {
            Criteria c2 = new Criteria(CriteriaType.None);
            c2.Mode = CriteriaMode.Or;
            c2.Add(CriteriaType.Equals, "Subject", value);
            c2.Add(CriteriaType.Equals, "Subject2", value);
            c2.Add(CriteriaType.Equals, "Subject3", value);
            c.Criterias.Add(c2);
        }
        return c;
    }    
    
</script>
<a name="top"></a>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
        %>
        <span class="title title_arr"><a class="txt" href="javascript:void(0);">
            <%=Request["Cate"] ?? "全部教师"%></a>
            <%if (Request["Subject"] != null)
              { %>
            <em class="arrow-right"></em>
            <%} %>
        </span>
        <%
                if (Request["Subject"] != null)
                {
        %>
        <span class="title"><a class="txt" href="javascript:void(0);">
            <%=Request["Subject"]%></a></span>
        <% 
                }
            }
        %>
    </h1>
    <%
        string listBy = Request["ListBy"];
        List<string> keyValues = new List<string>();
        Dictionary<string, List<DataRow>> group = new Dictionary<string, List<DataRow>>();
        string keyFields = string.Empty;
        string searchKey = string.Empty;
        if (listBy == "Subject")
        {
            keyFields = "Subject|Subject2|Subject3";
        }
        else if (listBy == "Cate")
        {
            keyFields = "Cate";
        }
        else
        {
            keyFields = "IndexLetter";
        }



        string[] keyFieldArr = keyFields.Split('|');
        foreach (string keyField in keyFieldArr)
        {
            foreach (DataRow Item in Items)
            {
                string key = Item[keyField].ToString();
                if (string.IsNullOrEmpty(key.Trim())) continue;
                if (group.ContainsKey(key))
                {
                    List<DataRow> rows;
                    group.TryGetValue(key, out rows);
                    if (rows == null) rows = new List<DataRow>();
                    rows.Add(Item);
                }
                else
                {
                    List<DataRow> rows = new List<DataRow>();
                    rows.Add(Item);
                    group.Add(key, rows);
                }
            }
        }

        if (Request["Subject"] != null)
        {
            searchKey = Request["Subject"];
            List<string> keys = new List<string>();
            foreach (string key in group.Keys)
                if (key != searchKey)
                    keys.Add(key);

            foreach (string key in keys)
                group.Remove(key);
        }

        DictionarySort(group);
    %>
    <div class="people_key">
        <%
            int j = 0;
            foreach (string key in group.Keys)
            {
        %>
        <span><a href="#key<%=j %>">
            <%=key %></a></span>
        <% j++;
            } 
        %>
    </div>
    <div class="people_list">
        <table>
            <tr class="people_title">
                <th>
                    姓名
                </th>
                <th>
                    职称
                </th>

                <th>
                    电子邮件
                </th>
            </tr>
            <%  
                j = 0;
                foreach (KeyValuePair<string, List<DataRow>> kv in group)
                {
            %>
            <tr class="people_cate">
                <td colspan="4">
                    <a name="key<%=j %>"></a><span>
                        <%=kv.Key%></span> <a class="more" href="#top">Top</a>
                </td>
            </tr>
            <% foreach (DataRow item in kv.Value)
               { %>
            <tr>
                <td>
                    <a href="<%=GetUrl(item["ID"]) %>" target="_blank">
                        <%=item["Fullname"]%></a>
                </td>
                <td>
                    <%=item["Title"]%>
                </td>
                <td>
                    <%=item["Email"]%>
                </td>
            </tr>
            <%} %>
            <%j++;
                } %>
        </table>
        <div class="auto">
        </div>
    </div>
    <h2>
    </h2>
</div>
