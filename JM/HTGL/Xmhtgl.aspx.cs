using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class HTGL_Xmhtgl : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void 未审核查询Button_Click(object sender, EventArgs e)
    {
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        string selstr = "";
        selstr = "select * from XMInfo where XVType='0'";
        if (多项Radio.Checked)
        {

            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr + "and XMDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (项目名称TextField.Text != "")
            {
                selstr = selstr + "and XMName='" + 项目名称TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (项目类型TextField.Text != "")
            {
                selstr = selstr + "and XMType='" + 项目类型TextField.Text.Trim() + "'";
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
        项目Store.DataSourceID = "";
        项目Store.DataSource = myread;
        项目Store.DataBind();
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
        selstr = "select * from XMInfo where XVType='1'";
        if (多项Radio.Checked)
        {

            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr + "and XMDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (项目名称TextField.Text != "")
            {
                selstr = selstr + "and XMName='" + 项目名称TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (项目类型TextField.Text != "")
            {
                selstr = selstr + "and XMType='" + 项目类型TextField.Text.Trim() + "'";
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
        项目Store.DataSourceID = "";
        项目Store.DataSource = myread;
        项目Store.DataBind();
        mycon.Close();
        审核Button.Disabled = false;
        撤销审核Button.Disabled = true;
    }
    protected void 提交Button_Click(object sender, EventArgs e)
    {
        int XMId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要审核通过的项目.").Show();
            return;
        }
        XMId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateCinfo = "update XMInfo Set XVType='1' where XMId=" + XMId;
            mycmd.CommandText = updateCinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "项目审核通过.").Show();
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
        int XMId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要撤销审核的项目.").Show();
            return;
        }
        XMId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateCinfo = "update XMInfo Set XVType='0' where XMId=" + XMId;
            mycmd.CommandText = updateCinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "项目已撤销.").Show();
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
        选择备注TextArea.Text = "";
        选择编号TextField.Text = "";
        选择单位ComboBox.Text = "";
        选择负责人TextField.Text = "";
        选择结题DateField.Text = "";
        选择金额TextField.Text = "";
        选择类型TextField.Text = "";
        选择立项日期DateField.Text = "";
        选择名称TextField.Text = "";
        选择项目号TextField.Text = "";
        选择资助单位TextField.Text = "";
        选择具体类型TextField.Text = "";
    }
}