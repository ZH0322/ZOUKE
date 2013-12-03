using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class Glymain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MNo"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                当前用户Label.Text = 当前用户Label.Text + Session["MNo"].ToString();
                DateTime dt = DateTime.Now;
                登录时间Label.Text = 登录时间Label.Text + dt.ToString();
            }
        }           
    }
    protected void 退出Button_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
    protected void 修改密码Button_Click(object sender, EventArgs e)
    {
        用户名TextField.Text = Session["MNo"].ToString();
        修改密码Window.Show();
    }
    protected void 保存Button_Click(object sender, EventArgs e)
    {
        if (密码TextField.Text != 确认密码TextField.Text)
        {
            X.Msg.Alert("Status", "密码不一致.").Show();
        }
        else
        {
            string username, oldpwd1, newpwd, oldpwd2;
            username = 用户名TextField.Text;
            newpwd = 旧密码TextField.Text;
            oldpwd1 = 密码TextField.Text;
            oldpwd2 = 确认密码TextField.Text;

            DBHelp db = new DBHelp();
            bool flag = db.ChangePwd(username, newpwd, oldpwd1);
            if (flag)
            {
                X.Msg.Alert("Status", "保存成功.").Show();
            }
        }
    }
}