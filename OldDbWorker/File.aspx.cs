using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOE.OldDbWorker.OldDbTableAdapters;
using System.IO;

namespace SOE.OldDbWorker
{
    public partial class File : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var i = 0;
            var j = 0;
            var msg = string.Empty;           
            var ds = new OldDb();
            var ta = new fileTableAdapter();
            ta.Fill(ds.file);
            foreach (var file in ds.file.ToList())
            {
                try
                {
                    var path = Server.MapPath("/_data/" + file.FileUrl);
                    if (System.IO.File.Exists(path))
                    {
                        var f = Path.GetFileName(path);
                        var temp = path.Replace(f, file.FileName);
                        System.IO.File.Move(path, temp);
                    }
                    i++;
                    Finish.Text = i.ToString();
                }
                catch (Exception ex)
                {                    
                    msg += (file.FileID + "<br/>" + ex.Message + "<hr/>");
                    j++;
                }
                Finish.Text = i.ToString();
                Fail.Text = j.ToString();
                Msg.Text = msg;
            
            }
        }
    }
}
