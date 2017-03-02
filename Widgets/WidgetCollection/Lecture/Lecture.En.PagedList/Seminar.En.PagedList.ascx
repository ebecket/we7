<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }

    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "20")]
    public int TitleLength = 20;
    public string strYear = "";
    public string strField = "";

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("STime", OrderMode.Desc));
        o.Add(new Order("IsShow", OrderMode.Desc));
        o.Add(new Order("ID", OrderMode.Desc));
        return o;
    }


    protected override Criteria CreateCriteria()
    {
        string strStartTime;
        DateTime dtStartTime, dtEndTime;
        Criteria c = base.CreateCriteria();
        strField = Request["field"] != null ? Request["field"].ToString() : "";
        strField = (strField == "all") ? "" : strField;
        //取SESSION的值
        if (Session["year"] == null)
        {
            strYear = Request["year"] != null ? Request["year"].ToString() : DateTime.Now.Year.ToString();
            Session["year"] = strYear;
        }
        else
        {
            strYear = Request["year"]!=null?Request["year"].ToString():"2015";
        }

        strStartTime = string.Format("{0}-01-01 00:00:00", strYear);
        dtStartTime = DateTime.Parse(strStartTime);
        dtEndTime = dtStartTime.AddYears(1);
        c.Add(CriteriaType.MoreThan, "STime", dtStartTime);
        c.Add(CriteriaType.LessThan, "STime", dtEndTime);
        if (string.IsNullOrEmpty(strField) != true)
        {
            c.Add(CriteriaType.Equals, "Field", strField);
        }
        return c;
    }

    public string NoHTML(string Htmlstring) //去除HTML标记
    {
        //删除脚本
        Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?<\/script>", "", RegexOptions.IgnoreCase);
        //删除HTML
        Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", " ", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);
        //Htmlstring.Replace("<", "");
        //Htmlstring.Replace(">", "");
        Htmlstring.Replace("\r\n", "");
        Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();
        return Htmlstring;
    }

    //protected void DictionarySort(Dictionary<string, List<DataRow>> dic)
    //{
    //    List<KeyValuePair<string, List<DataRow>>> list = new List<KeyValuePair<string, List<DataRow>>>(dic);
    //    list.Sort(delegate(KeyValuePair<string, List<DataRow>> x, KeyValuePair<string, List<DataRow>> y) { return x.Key.CompareTo(y.Key); });
    //    dic.Clear();
    //    List<DataRow> other = null;
    //    foreach (KeyValuePair<string, List<DataRow>> item in list)
    //    {
    //        if (item.Key == OtherKey)
    //            other = item.Value;
    //        else
    //            dic.Add(item.Key, item.Value);
    //    }
    //    if (other != null && other.Count > 0) dic.Add(OtherKey, other);
    //}
    
    
</script>
<div class="hiddiv" id="hiddiv" value="<%=strField %>">
</div>
<div class="<%=CssClass %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 1; i < arr.Length - 1; i++)
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=arr[i]%></a><em class="arrow-right"></em></span>
        <%
                }
        %>
        <span class="title"><a class="txt" href="javascript:void(0);">
            <%=Channel.Name%></a><%if (arr.Length == 1)
                                   { %><em class="arrow"></em><%} %>&nbsp;&nbsp;<em class="arrow-right"></em>
        </span>
        <%} %><span class="title"><%=strYear%> <%=strField%></span>
    </h1>
    <div class="month_key"><span><a href="?year=2016">2016</a></span>
        <span><a href="?year=2015">2015</a></span> <span><a href="?year=2014">
            2014</a></span> <span><a href="?year=2013">2013</a></span>
        <span><a href="?year=2012">2012</a></span> <span><a href="?year=2011">
            2011</a></span> <span><a href="?year=2010">2010</a></span>
        <span><a href="?year=2009">2009</a></span> <span><a href="?year=2008">
            2008</a></span> <span><a href="?year=2007">2007</a></span>
        <span><a href="?year=2006">2006</a></span>
    </div>
    <table class="serimar_tab">
        <tbody>
            <tr>
                <td height="1" align="left" valign="TOP" colspan="4">
                    <h3>
                        <span style="color: rgb(0, 51, 102); font-size: 10pt;">
                            <%=strYear %></span></h3>
                </td>
            </tr>
            <%
                Dictionary<string, List<DataRow>> groups = new Dictionary<string, List<DataRow>>();
                foreach (DataRow Item in Items)
                {
                    DateTime dueTime;
                    DateTime.TryParse(Item["sTime"].ToString(), out dueTime);
                    string m = dueTime.ToString("MMMM");
                    if (!groups.ContainsKey(m))
                    {
                        groups.Add(m, new List<DataRow>());
                    }
                    groups[m].Add(Item);
                }


                foreach (string key in groups.Keys)
                {
                    List<DataRow> items = groups[key];

                    for (int i = 0; i < items.Count; i++)
                    {

                        DateTime dueTime;
                        DateTime.TryParse(items[i]["sTime"].ToString(), out dueTime);
            %>
            <tr>
                <%if (i == 0)
                  {%>
                <td width="51" height="1" align="left" valign="TOP" rowspan="<%=items.Count %>">
                    <span style="color: rgb(0, 51, 102); font-size: 10pt;">
                        <%=dueTime.ToString("MMMM", System.Globalization.DateTimeFormatInfo.InvariantInfo)%></span>
                </td>
                <%} %>
                <td width="118" height="1" align="left" valign="TOP">
                    <span style="color: rgb(0, 51, 102); font-size: 10pt;">&nbsp;<%=dueTime.Day%>
                        (<%=dueTime.DayOfWeek%>)</span>
                </td>
                <td width="300" valign="top">
                    <span style="color: rgb(0, 51, 102); font-size: 10pt;">
                        <%=items[i]["Speaker"]%><br /><%=ToStr(NoHTML(items[i]["Intro"].ToString()), 110)%>
</span>
                </td>
                <td width="350" height="1" align="left" valign="TOP">
                    <span style="color: rgb(0, 51, 102); font-size: 10pt;"><a href="<%=GetUrl(items[i]["ID"]) %>">
                        <%
                        if (string.IsNullOrEmpty(items[i]["Title"].ToString()) != true)
                        {
                        %><%=items[i]["Title"]%>
                        <%}
                            else
                            {
                        %>TBD<%
                            }
                        
                        %></a></span>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <h2>
    </h2>
</div>
