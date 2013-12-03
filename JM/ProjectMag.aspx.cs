using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class ProjectMag : System.Web.UI.Page
{
    int XMMoney;
    protected void Page_Load(object sender, EventArgs e)
    {
        负责人TextField.Text = Session["TNo"].ToString();
        负责人TextField.ReadOnly = true;
        DateTime dt = DateTime.Now;
        立项日期DateField.Text = dt.Date.ToLongDateString();
        结题时间DateField.Text=dt.Date.ToLongDateString();
    }
    protected void 保存Button_Click(object sender, EventArgs e)
    {
        if (名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目名称.").Show();
            return;
        }
        if (编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目编号.").Show();
            return;
        }
        if (项目类别ComboBox.SelectedItem.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目类别.").Show();
            return;
        }
        if (负责人TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目负责人名.").Show();
            return;
        }
        if (立项日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择立项时间.").Show();
            return;
        }
        if (结题时间DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择结题时间.").Show();
            return;
        }
        if (项目金额TextField.Text == "")
        {
            XMMoney = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(项目金额TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                XMMoney = Convert.ToInt32(项目金额TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "金额应为数字.").Show();
                return;
            }

        }
        DBHelp db = new DBHelp();
        if (db.CheckXM(编号TextField.Text) == 2)
        {
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string insel = "insert into XMInfo(XMName,XMNo,TNo,XMType,XMJtType,XMBegin,XMFzr,XMEnd,XMDeptName,XMMoney,XMFundDept,XMRemark,XType,XVType) values('"+名称TextField.Text+"','"+编号TextField.Text+"','"+Session["TNo"].ToString()+"','"+项目类别ComboBox.SelectedItem.Text+"','"+具体类型ComboBox.SelectedItem.Text+"','"+立项日期DateField.Text+"','"+负责人TextField.Text+"','"+结题时间DateField.Text+"','"+单位ComboBox.SelectedItem.Text+"','"+项目金额TextField.Text+"','"+资助单位TextField.Text+"','"+项目简介TextArea.Text+"','0','0')";
            mycmd.CommandText = insel;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "保存成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "该项目已保存.").Show();
        }
       
    }
    protected void 提交Button_Click(object sender, EventArgs e)
    {
        if (名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目名称.").Show();
            return;
        }
        if (编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目编号.").Show();
            return;
        }
        if (项目类别ComboBox.SelectedItem.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目类别.").Show();
            return;
        }
        if (负责人TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目负责人名.").Show();
            return;
        }
        if (立项日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择立项时间.").Show();
            return;
        }
        if (结题时间DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择结题时间.").Show();
            return;
        }
        if (项目金额TextField.Text == "")
        {
            XMMoney = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(项目金额TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                XMMoney = Convert.ToInt32(项目金额TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "金额应为数字.").Show();
                return;
            }

        }
        DBHelp db = new DBHelp();
        if (db.CheckXM(编号TextField.Text.Trim()) == 1)
        {
            X.Msg.Alert("Status", "该项目已提交或项目名称有误.").Show();
        }
        else if (db.CheckXM(编号TextField.Text.Trim()) == 0)
        {
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string upptype = "update XMInfo Set XType='1' where XMNo='" + 编号TextField.Text + "'";
            mycmd.CommandText = upptype;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "提交成功.").Show();
        }
        else if (db.CheckXM(编号TextField.Text.Trim()) == 2)
        {
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string insel = "insert into XMInfo(XMName,XMNo,TNo,XMType,XMJtType,XMBegin,XMFzr,XMEnd,XMDeptName,XMMoney,XMFundDept,XMRemark,XType,XVType) values('" + 名称TextField.Text + "','" + 编号TextField.Text + "','" + Session["TNo"].ToString() + "','" + 项目类别ComboBox.SelectedItem.Text + "','" + 具体类型ComboBox.SelectedItem.Text + "','" + 立项日期DateField.Text + "','" + 负责人TextField.Text + "','" + 结题时间DateField.Text + "','" + 单位ComboBox.SelectedItem.Text + "','" + 项目金额TextField.Text + "','" + 资助单位TextField.Text + "','" + 项目简介TextArea.Text + "','1','0')";
            mycmd.CommandText = insel;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "保存成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "提交出错2.").Show();
        }
    }
    protected void 已添加参与人Button_Click(object sender, EventArgs e)
    {
        if(编号TextField.Text=="")
        {
            X.Msg.Alert("Status", "请填写项目编号.").Show();
            return;
        }
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        string selstr = "select * from XPInfo where XPXMNo='"+编号TextField.Text+"'";
        mycmd.CommandText = selstr;
        SqlDataReader myreader = mycmd.ExecuteReader();
       
        参与人Store.DataSourceID = "";
        参与人Store.DataSource = myreader;
        参与人Store.DataBind();
    }
}