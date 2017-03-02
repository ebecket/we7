using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using We7.CMS.WebControls.Core;
using We7.CMS.WebControls;
using System.Collections.Generic;
using We7.CMS.Common;
using Thinkment.Data;
using MySql.Data.MySqlClient;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Link", Icon = "Link", Description = "Link", DefaultType = "Link.Default")]
    [ControlDescription(Desc = "Link", Author = "Link")]
    public partial class Research_Default_List : ThinkmentDataControl
    {
        [Parameter(Title = "控件每页记录", Type = "Number", DefaultValue = "10")]
        public int PageSize = 10;

        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "LinkList_Default")]
        public string CssClass;

        [Parameter(Title = "标签", Type = "Tags", DefaultValue = "")]
        public string Tag = "";

        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
        public int TitleLength = 30;

        private List<Research> items;
        protected List<Research> Items
        {
            get
            {
                if (items == null)
                {
                    string connstr = "Server=172.16.8.103;Database=archive;Uid=repec;Pwd=wisesoe.100";
                    MySqlConnection conn = new MySqlConnection(connstr);
                    conn.Open();
                    try
                    {
                        MySqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "Select * from wp_papers Where ser_id=2 and enable='y' order by creation_date desc,title limit 0," + PageSize;
                        MySqlDataAdapter adap = new MySqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        adap.Fill(ds);
                        items = ConvertToObject(ds);
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                    finally
                    {
                        if (conn.State == ConnectionState.Open)
                        {
                            conn.Close();
                        }
                    }
                }
                return items;
            }
            set { items = value; }
        }

        private List<Research> ConvertToObject(DataSet ds)
        {
            List<Research> list = new List<Research>();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    Research re = new Research();
                    if (r["title"] != null && r["title"].ToString() != "")
                    {
                        re.Title = r["title"].ToString();
                    }
                    if (r["ser_id"] != null && r["ser_id"].ToString() != "")
                    {
                        re.SerId = int.Parse(r["ser_id"].ToString());
                    }
                    if (r["p_id"] != null && r["p_id"].ToString() != "")
                    {
                        re.PId = int.Parse(r["p_id"].ToString());
                    }
                    if (r["authors"] != null && r["authors"].ToString() != "")
                    {
                        string[] authorArr = r["authors"].ToString().Replace("!-!", "!").Split('!');
                        foreach (string author in authorArr)
                        {
                            string[] arr = author.Replace(";-;", ";").Split(';');
                            re.Authors = re.Authors + ", " + arr[0];
                        }
                        re.Authors = re.Authors.Trim(',');
                    }
                    list.Add(re);
                }
            }
            return list;
        }

        public class Research
        {
            private string title;
            private int serid;
            private int pid;
            private string authors;

            public string Title { get { return title; } set { title = value; } }
            public int SerId { get { return serid; } set { serid = value; } }
            public int PId { get { return pid; } set { pid = value; } }
            public string Authors { get { return authors; } set { authors = value; } }
        }
    }   
}