using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SOE.OldDbWorker.OldDbTableAdapters;
using System.Data.SqlClient;
using We7.Framework;
using We7.CMS;
using We7.CMS.Common;
using We7;
using System.IO;
using We7.Model.Core;
using System.Collections.Specialized;
using We7.Model.Core.UI;
using SOE.OldDbWorker;

namespace SOE.OldDbWorker
{
    public partial class Default : System.Web.UI.Page
    {
        OldWiseEntities oldDB = new OldWiseEntities();
        newWiseEntities newDB = new newWiseEntities();

        protected HelperFactory HelperFactory
        {
            get { return HelperFactory.Instance; }
        }
        protected ChannelHelper ChannelHelper
        {
            get { return HelperFactory.GetHelper<ChannelHelper>(); }
        }
        protected ArticleHelper ArticleHelper
        {
            get { return HelperFactory.GetHelper<ArticleHelper>(); }
        }
        protected AttachmentHelper AttachmentHelper
        {
            get { return HelperFactory.GetHelper<AttachmentHelper>(); }
        }
        protected ArticleIndexHelper ArticleIndexHelper
        {
            get { return HelperFactory.GetHelper<ArticleIndexHelper>(); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StartTime.Text = DateTime.Now.AddYears(-10).ToString();
                EndTime.Text = DateTime.Now.ToString();
                OldDbCate1.DataSource = oldDB.NewsType.Where(x => x.BigID!=0);
                OldDbCate1.DataTextField = "Name";
                OldDbCate1.DataValueField = "ID";
                OldDbCate1.DataBind();
                
                var channelList = new List<Channel>();
                channelList = ChannelHelper.GetAllChannels().ToList();
                var removeList = new List<Channel>();
                foreach (Channel ch in channelList)
                {
                    if (String.IsNullOrEmpty(ch.ModelName))
                        continue;
                    if (String.Compare(ch.ModelName, "Article", true) == 0)
                        continue;
                    if (String.Compare(ch.ModelName, "System.Article", true) == 0)
                        continue;
                    removeList.Add(ch);
                }
                foreach (Channel ch in removeList)
                {
                    channelList.Remove(ch);
                }
                if (channelList != null && channelList.Count > 0)
                {
                    channelList.Sort();
                    foreach (Channel ch in channelList)
                    {
                        string name = ch.FullPath.Replace("//", "/").Replace("/", " 》");
                        string value = ch.ID;
                        ListItem item = new ListItem(name, value);
                        NewDbCate.Items.Add(item);
                    }
                }
            }
        }

        //普通新闻绑定
        private void ArticlesBind()
        {
            int tmpId = Int32.Parse(OldDbCate1.SelectedValue);
            //var articles = b.News.Where(n => n.ID == tmpId)
            //Total.Text = articles.Count().ToString();
            var articles = GetArticles();
            Total.Text = articles.Count.ToString();

            Articles.DataSource = articles;
            Articles.DataBind();

            string strAlert = "<script>alert('" + tmpId + "')</script>";
            //ClientScript.RegisterStartupScript(this.GetType(), "allo1", strAlert);
        }

        //多点新闻绑定
        private void DuodianArticlesBind()
        {
            //var articles = b.News.Where(n => n.ID == tmpId)
            //Total.Text = articles.Count().ToString();
            var articles = GetDuodianArticles();
            Total.Text = oldDB.t_News.Where(b => b.isEDP == "1").Count().ToString();

            Articles1.DataSource = articles;
            Articles1.DataBind();
            //ClientScript.RegisterStartupScript(this.GetType(), "allo1", strAlert);

        }

        //private IList<OldDb.pubRow> GetArticles()
        //{
        //    var ds = new OldDb();
        //    var ta = new pubTableAdapter();
        //    ta.Fill(ds.pub);
        //    var startTime = string.IsNullOrEmpty(StartTime.Text) ? DateTime.MinValue : Convert.ToDateTime(StartTime.Text);
        //    var endTime = string.IsNullOrEmpty(EndTime.Text) ? DateTime.MaxValue : Convert.ToDateTime(EndTime.Text);
        //    var articles = ds.pub.Where(x => x.ItemID == Convert.ToInt32(OldDbCate.SelectedValue) && x.PubTime > startTime && x.PubTime < endTime)
        //        .OrderByDescending(x => x.PubID).ToList();
        //    return articles;
        //}

        /// <summary>
        /// 取旧数据新闻文章
        /// </summary>
        /// <returns></returns>
        private IList<SOE.OldDbWorker.News> GetArticles()
        {
            var startTime = string.IsNullOrEmpty(StartTime.Text) ? DateTime.MinValue : Convert.ToDateTime(StartTime.Text);
            var endTime = string.IsNullOrEmpty(EndTime.Text) ? DateTime.MaxValue : Convert.ToDateTime(EndTime.Text);
            //var articles = db.News.Where(x => x.TypeID == Convert.ToInt32(OldDbCate.SelectedValue) && x.UpDateTime > startTime && x.UpDateTime < endTime)
            //    .OrderByDescending(x => x.ID).ToList();
            int tmpId = Int32.Parse(OldDbCate1.SelectedValue);
            var articles = oldDB.News.Where(x => x.TypeID == tmpId && startTime < x.UpDateTime && x.UpDateTime < endTime)
               .OrderByDescending(x => x.ID).ToList<SOE.OldDbWorker.News>();
            var articles1 = oldDB.News.Where(x => x.TypeID == tmpId && x.UpDateTime < endTime).OrderByDescending(x => x.ID).ToList<SOE.OldDbWorker.News>();
            return articles;
        }

        /// <summary>
        /// 取多点系统文章
        /// </summary>
        /// <returns></returns>
        private IList<SOE.OldDbWorker.News> GetDuodianArticles()
        {
            var startTime = string.IsNullOrEmpty(StartTime.Text) ? DateTime.MinValue : Convert.ToDateTime(StartTime.Text);
            var endTime = string.IsNullOrEmpty(EndTime.Text) ? DateTime.MaxValue : Convert.ToDateTime(EndTime.Text);
            //var articles = db.News.Where(x => x.TypeID == Convert.ToInt32(OldDbCate.SelectedValue) && x.UpDateTime > startTime && x.UpDateTime < endTime)
            //    .OrderByDescending(x => x.ID).ToList();
            var articles = oldDB.News.Where(x => x.isEDP == "1" && x.UpDateTime > startTime && x.UpDateTime < endTime)
               .OrderByDescending(x => x.ID).ToList<SOE.OldDbWorker.News>();
            return articles;
        }

        private IList<OldDb.lectureRow> GetLectures()
        {
            var ds = new OldDb();
            var ta = new lectureTableAdapter();
            ta.Fill(ds.lecture);
            var startTime = string.IsNullOrEmpty(StartTime.Text) ? DateTime.MinValue : Convert.ToDateTime(StartTime.Text);
            var endTime = string.IsNullOrEmpty(EndTime.Text) ? DateTime.MaxValue : Convert.ToDateTime(EndTime.Text);
            var lectures = ds.lecture.Where(x => x.LLtime > startTime && x.LLtime < endTime)
                .OrderByDescending(x => x.LectureID).ToList();
            return lectures;
        }

        private IList<OldDb.fileRow> GetFiles(int pubID)
        {
            var ds = new OldDb();
            var ta = new fileTableAdapter();
            ta.Fill(ds.file);
            var files = ds.file.Where(x => x.PubID == pubID).ToList();
            return files;
        }

        protected void ShowOldArticles_Click(object sender, EventArgs e)
        {
            Articles.Visible = false;
            Articles.Visible = true;
            ArticlesBind();
        }


        protected void Articles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Articles.PageIndex = e.NewPageIndex;
            ArticlesBind();
        }

        protected void Articles_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            Articles1.PageIndex = e.NewPageIndex;
            DuodianArticlesBind();
        }


        protected void ImportToNewDb_Click(object sender, EventArgs e)
        {
            var articles = GetArticles();
            var ch = ChannelHelper.GetChannel(NewDbCate.SelectedValue, null);
            var i = 0;
            var j = 0;
            var msg = string.Empty;
            foreach (var article in articles)
            {
                try
                {
                    var a = new Article();
                    a.ID = We7Helper.CreateNewID();
                    a.Title = article.Title.Trim();
                    a.Index = 999;
                    a.AllowComments = 0;
                    a.IsShow = 0;
                    a.Author = article.Intro;
                    a.State = 1;
                    a.ContentType = 0;
                    a.IsImage = 0;
                    a.Content = article.Content.Trim();
                    a.ParentID = We7Helper.EmptyGUID;
                    a.Updated = (DateTime)article.UpDateTime;
                    a.Overdue = a.Updated.AddDays(1000);
                    a.OwnerID = NewDbCate.SelectedValue;
                    if (ch.FullUrl != null && ch.FullUrl != "")
                    {
                        a.ChannelFullUrl = ch.FullUrl;
                    }
                    if (ch.Process != null && ch.Process == "1")
                    {
                        a.State = 2;
                    }

                    a.ChannelName = ch.Name;
                    a.FullChannelPath = ch.FullPath;
                    a.Source = "厦门大学王亚南经济研究院";
                    a.Clicks = Convert.ToInt32(article.Counter);
                    ArticleHelper.AddArticles(a);
                    ArticleIndexHelper.InsertData(a.ID, 0);
                    i++;
                    Finish.Text = i.ToString();
                }
                catch(Exception ex)
                {                    
                    msg += (article.ID + "<br/>" + ex.Message + "<hr/>");
                    j++;
                }
                Finish.Text = i.ToString();
                Fail.Text = j.ToString();
                Msg.Text = msg;
            }
        }


        protected void ImportLecturesToNewDb_Click(object sender, EventArgs e)
        {
            var lectures = GetLectures();
            var i = 0;
            var j = 0;
            var msg = string.Empty;           
            ICommand cmd = CommandFactory.GetCommand("add");
            PanelContext data = ModelHelper.GetPanelContext("SOE.Lecture", "edit");
            foreach (var article in lectures)
            {
                try
                {
                    data.Row.Clear();
                    data.Row["ID"] = We7Helper.CreateNewID();
                    data.Row["OwnerID"] = "{f5a2e63a-9e54-4008-83d6-ab37c572d225}";
                    data.Row["Title"] = article.Lecture;
                    data.Row["Speaker"] = article.LectureName;
                    data.Row["Description"] = article.Message;
                    data.Row["Address"] = article.LectureAddress;
                    data.Row["Organizer"] = article.hold;
                    data.Row["Type"] = "独立讲座";
                    data.Row["Cate"] = "经济学院";
                    data.Row["StartTime"] = article.LectureTime;
                    data.Row["DueTime"] = article.LLtime;
                    data.Row["State"] = 1;
                    data.Row["AccountID"] = "{00000000-0000-0000-0000-000000000000}";
                    ProcessAllDataColumns(data);
                    InitDataKeyValus(data);
                    cmd.Do(data);
                    i++;

                }
                catch (Exception ex)
                {                   
                    msg += (article.LectureID + "<br/>" + ex.Message + "<hr/>");
                    j++;
                }
                Finish.Text = i.ToString();
                Fail.Text = j.ToString();
                Msg.Text = msg;
            }
        }

        protected void InitDataKeyValus(PanelContext data)
        {
            var DataKeyValus = new OrderedDictionary();
            foreach (DataField df in data.Row)
            {
                AddDataKey(df.Column.Name, df.Value, DataKeyValus, data);
            }
            data.DataKey = new DataKey(DataKeyValus);
        }

        void AddDataKey(string key, object value, IOrderedDictionary dics, PanelContext data)
        {
            foreach (string s in data.DataKeys)
            {
                if (s == key)
                {
                    dics.Add(key, value);
                }
            }
        }

        void ProcessAllDataColumns(PanelContext ctx)
        {
            foreach (We7DataColumn dc in ctx.DataSet.Tables[0].Columns)
            {
                if (!String.IsNullOrEmpty(dc.DefaultValue) &&
                    dc.Direction != ParameterDirection.ReturnValue &&
                    (ctx.Row[dc.Name] == null || String.IsNullOrEmpty(ctx.Row[dc.Name].ToString())))
                {
                    if (String.Compare(dc.Name, "AccountID") == 0)
                        continue;
                    ctx.Row[dc.Name] = DefaultGenerator.GetDefaultValue(dc.DefaultValue, ctx, dc);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Articles.Visible = false;
            Articles1.Visible = true;
            DuodianArticlesBind();
        }

    }
}