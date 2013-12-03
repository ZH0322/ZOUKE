using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class HTGL_Hyhtgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        院系Store.DataSource = new object[]
        {
             new object[]{"文学院"}, new object[]{"历史系"}, new object[]{"哲学系"}, new object[]{"法学院"}, new object[]{"商学院"}, new object[]{"经济学院"}, new object[]{"管理学院"}, new object[]{"外语学院"}, new object[]{"艺术学院"},
             new object[]{"国际商学院"}, new object[]{"数学科学学院"}, new object[]{"化学化工学院"}, new object[]{"生命科学学院"}, new object[]{"新闻传播学院"}, new object[]{"社会与政治学院"}, new object[]{"电子信息工程学院"}, new object[]{"物理与材料科学学院"},
             new object[]{"资源与环境工程学院"}, new object[]{"电气工程与自动化学院"},new object[]{"计算机科学与技术学院"},new object[]{"文典学院"}
        };
        院系Store.DataBind();
    }

    protected void 未审核查询Button_Click(object sender, EventArgs e)
    {
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        string selstr = "";
        selstr = "select * from CInfo where CVType='0'";
        if (多项Radio.Checked)
        {

            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr + "and CDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (选择会议TextField.Text != "")
            {
                selstr = selstr + "and CName='" + 选择会议TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (选择参加TextField.Text != "")
            {
                selstr = selstr + "and CCanJia like'%" + 选择参加TextField.Text.Trim() + "%'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请填写查询条件.").Show();
                return;
            }*/
        }
        SqlCommand mycmd = mycon.CreateCommand();
        mycmd.CommandText = selstr;
        SqlDataReader myread = mycmd.ExecuteReader();
        会议Store.DataSourceID = "";
        会议Store.DataSource = myread;
        会议Store.DataBind();
        mycon.Close();
        审核Button.Disabled = false;
        撤销审核Button.Disabled = true;
    }

    protected void 已审核查询Button_Click(object sender, EventArgs e)
    {
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        string selstr = "";
        selstr = "select * from CInfo where CVType='1'";
        if (多项Radio.Checked)
        {

            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr + "and CDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (选择会议TextField.Text != "")
            {
                selstr = selstr + "and CName='" + 选择会议TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (选择参加TextField.Text != "")
            {
                selstr = selstr + "and CCanJia like'%" + 选择参加TextField.Text.Trim() + "%'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请填写查询条件.").Show();
                return;
            }*/
        }
        SqlCommand mycmd = mycon.CreateCommand();
        mycmd.CommandText = selstr;
        SqlDataReader myread = mycmd.ExecuteReader();
        会议Store.DataSourceID = "";
        会议Store.DataSource = myread;
        会议Store.DataBind();
        mycon.Close();
        审核Button.Disabled = true;
        撤销审核Button.Disabled = false;
    }

    protected void 提交Button_Click(object sender, EventArgs e)
    {
        int CId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要审核通过的会议.").Show();
            return;
        }
        CId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateCinfo = "update CInfo Set CVType='1' where CId=" + CId;
            mycmd.CommandText = updateCinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "会议审核通过.").Show();
            return;
        }
        catch (Exception)
        {
            X.Msg.Alert("Status", "出错.").Show();
            return;
        }
        finally
        {
            mycon.Close();
        }
    }
    protected void 撤销审核Button_Click(object sender, EventArgs e)
    {
        int CId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要撤销的会议.").Show();
            return;
        }
        CId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateUinfo = "update CInfo Set CVType='0' where CId=" + CId;
            mycmd.CommandText = updateUinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "已撤销会议.").Show();
            return;
        }
        catch (Exception)
        {
            X.Msg.Alert("Status", "出错.").Show();
            return;
        }
        finally
        {
            mycon.Close();
        }
    }
    protected void 取消选择Button_Click(object sender, EventArgs e)
    {
        选择会议TextField.Text = "";
        选择论文TextField.Text = "";
        选择单位ComboBox.Text="";
        选择开始DateField.Text="";
        选择结束DateField.Text="";
        接收日期DateField.Text="";
        选择基金TextField.Text="";
        第一作者TextField.Text="";
        第二作者TextField.Text="";
        选择卷号TextField.Text="";
        选择期号TextField.Text="";
        选择页号TextField.Text="";
        选择参加TextField.Text="";
        选择级别ComboBox.Text="";
        选择备注TextArea.Text = "";
    }
}