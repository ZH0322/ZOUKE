using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class ProjectReserve : System.Web.UI.Page
{
    int XMId,XMMoney;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void 提交Button_Click(object sender, EventArgs e)
    {
        if (选择名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目名称.").Show();
            return;
        }
        if (选择项目号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目编号.").Show();
            return;
        }
        if (选择类型ComboBox.SelectedItem.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目类别.").Show();
            return;
        }
        if (选择负责人TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写项目负责人名.").Show();
            return;
        }
        if (选择立项日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择立项时间.").Show();
            return;
        }
        if (选择结题DateField.Text == "")
        {
            X.Msg.Alert("Status", "请选择结题时间.").Show();
            return;
        }
        if (选择金额TextField.Text == "")
        {
            XMMoney = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(选择金额TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                XMMoney = Convert.ToInt32(选择金额TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "金额应为数字.").Show();
                return;
            }

        }
        DBHelp db = new DBHelp();
        XMId = Convert.ToInt32(选择编号TextField.Text);
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        string sel = "update XMInfo Set XMName='" + 选择名称TextField.Text + "',XMNo='" + 选择项目号TextField.Text + "',XMType='" + 选择类型ComboBox.SelectedItem.Text + "',XMJtType='" + 具体类型ComboBox.SelectedItem.Text + "',XMBegin='" + 选择立项日期DateField.Text + "',XMFzr='" + 选择负责人TextField.Text + "',XMEnd='" + 选择结题DateField.Text + "',XMDeptName='" + 选择单位ComboBox.SelectedItem.Text + "',XMMoney='" + 选择金额TextField.Text + "',XMFundDept='" + 选择资助单位TextField.Text + "',XMRemark='" + 选择备注TextArea.Text + "', XType='1' where XMId=" + XMId;
        mycmd.CommandText = sel;
        mycmd.ExecuteNonQuery();
        mycon.Close();
        X.Msg.Alert("Status", "提交成功.").Show();
    }
    protected void 取消Button_Click(object sender, EventArgs e)
    { }
}