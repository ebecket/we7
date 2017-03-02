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
using We7.CMS.Common;
using System.Collections.Generic;
using We7.Framework;
using We7.CMS.WebControls;
using Thinkment.Data;
using We7.CMS.WebControls.Core;
using We7.Model.Core.Data;
using We7.Framework.Util;
using System.ComponentModel;
using System.Data.OleDb;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "Faculty", Icon = "Faculty", Description = "Faculty", DefaultType = "Faculty.Default")]
    [ControlDescription(Desc = "Faculty_Default")]
    public partial class Faculty_Default : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection cn = OpenDb();
            string sql = "SELECT  * FROM [BASE_DICT] where category='系所'";
            DataSet ds = new DataSet();
            OleDbDataAdapter myCommand = new OleDbDataAdapter(sql, cn);
            myCommand.Fill(ds, "BASE_DICT");
            org.DataSource = ds.Tables["BASE_DICT"].DefaultView;
            org.DataBind();

            sql = "SELECT * FROM [BASE_TEACHER] where (retired='返聘' or retired='在职') and t_id is not null order by t_name";
            OleDbDataAdapter myTeacher = new OleDbDataAdapter();
            myTeacher.SelectCommand = new OleDbCommand(sql, cn);
            myTeacher.Fill(ds, "BASE_TEACHER");

            ds.Relations.Add("myrelation", ds.Tables["BASE_DICT"].Columns["item"], ds.Tables["BASE_TEACHER"].Columns["dep"]);
            orglist.DataSource = ds.Tables["BASE_DICT"].DefaultView;
            orglist.DataBind();
            cn.Close();
        }

        private OleDbConnection OpenDb()
        {
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"~/econ_rd/dba/ecno.mdb");
            conn.Open();
            return conn;
        }

        [Parameter]
        public string CssClass;

        protected virtual string Css
        {
            get
            {
                return CssClass;
            }
        }



    }
}