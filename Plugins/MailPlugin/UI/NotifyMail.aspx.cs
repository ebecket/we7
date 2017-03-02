using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using We7.CMS.Common.PF;
using We7.Framework.Util;
using We7.Framework.Config;

namespace We7.CMS.Plugin.Mail
{
    public partial class NotifyMail : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["users"] != null)
                {
                    usernamelist.Value = Request["users"].ToString();
                }
                if (Request["ids"] != null)
                {
                    usernamelist.Value = getUsersFromIDS(Request["ids"].ToString());
                }
                MailMessageTemplate mt = new MailMessageTemplate("UserEmailConfig.xml", "用户邮件批量发送");
                body_posttextarea.Value = mt.Body;
            }
        }

        string getUsersFromIDS(string ids)
        {
            string[] idList = ids.Split(',');
            string users = "";
            foreach (string id in idList)
            {
                if (!string.IsNullOrEmpty(id))
                {
                    Account a = AccountHelper.GetAccount(id, new string[] { "LoginName" });
                    users += a.LoginName + ",";
                }
            }
            users = users.Remove(users.Length - 1);
            return users;
        }

        protected void BatchSendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                string toEmail = getMailList();
                MailHelper mailHelper = GetMailHelper();
                string body = body_posttextarea.Value;
                string must = "";//必须回复
                string priority = "Low";//过期提示，优先级别
                string subject = subjectInput.Value;
                //发送邮件
                mailHelper.Send(toEmail, mailHelper.AdminEmail, subject, body, priority);
                Messages.ShowMessage("邮件发送成功！");
            }
            catch (Exception ex)
            {
                Messages.ShowError("邮件发送失败！" + ex.Message);
            }
        }

        string getMailList()
        {
            StringBuilder sb = new StringBuilder();
            string[] users = usernamelist.Value.Split(',');
            foreach (string user in users)
            {
                if (!string.IsNullOrEmpty(user))
                {
                    Account a = AccountHelper.GetAccountByLoginName(user);
                    if (a == null)
                        continue;
                    if (!string.IsNullOrEmpty(a.Email))
                    {
                        sb.Append(a.Email);
                        sb.Append(",");
                    }
                }
            }
            if (sb.Length == 0)
                throw new Exception("接收用户设置不正确");
            return sb.ToString();
        }

        public MailHelper GetMailHelper()
        {
            MailHelper mailHelper = new MailHelper();

            //取得邮件服务器信息
            GeneralConfigInfo ci = GeneralConfigs.GetConfig();
            if (ci != null)
            {
                mailHelper.SmtpServer = ci.SysMailServer;
                mailHelper.AdminEmail = ci.SystemMail;
                mailHelper.UserName = ci.SysMailUser;
                mailHelper.Password = ci.SysMailPassword;
                mailHelper.PopServer = ci.SysPopServer;
            }
            return mailHelper;
        }
    }
}
