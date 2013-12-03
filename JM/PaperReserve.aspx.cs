using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class PaperReserve : System.Web.UI.Page
{
    int PId,PJuanNo,PQiNo;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void 提交Button_Click(object sender, EventArgs e)
    {
        if (选择题目TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写题目.").Show();
            return;
        }
        if (选择期刊TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写期刊名.").Show();
            return;
        }
        if (第一作者TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写第一作者.").Show();
            return;
        }
        if (接收日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写日期.").Show();
            return;
        }
        if (选择基金TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写基金.").Show();
            return;
        }
        if (选择单位ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写单位.").Show();
            return;
        }
        if (选择级别ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写级别.").Show();
            return;
        }
        if (选择卷号TextField.Text == "")
        {
            PJuanNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(选择卷号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PJuanNo = Convert.ToInt32(选择卷号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "卷号应为数字.").Show();
                return;
            }
        }
        if (选择期号TextField.Text == "")
        {
            PQiNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(选择期号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PQiNo = Convert.ToInt32(选择期号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "期号应为数字.").Show();
                return;
            }
        }
        PId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        string sel = "update PaperInfo Set PName='" + 选择题目TextField.Text + "',PJName='" + 选择期刊TextField.Text + "',PFirstName='" + 第一作者TextField.Text + "',PSecondName='" + 第二作者TextField.Text + "',PAcceptTime='" + 接收日期DateField.Text + "',PFundName='" + 选择基金TextField.Text + "',PJuanNo=" + PJuanNo + ",PQiNo=" + PQiNo + ",PDeptName='" + 选择单位ComboBox.SelectedItem.Text + "',PYeNo='" + 选择页号TextField.Text + "',PRank='" + 选择级别ComboBox.SelectedItem.Text + "',PRemark='" + 选择备注TextArea + "', PType='1' where PId=" + PId ;
        mycmd.CommandText = sel;
        mycmd.ExecuteNonQuery();
        mycon.Close();
        X.Msg.Alert("Status", "提交成功.").Show();
    }
    protected void 取消Button_Click(object sender, EventArgs e)
    {
        选择题目TextField.Text = "";
        选择页号TextField.Text = "";
        选择期刊TextField.Text = "";
        选择期号TextField.Text = "";
        选择卷号TextField.Text = "";
        选择级别ComboBox.Text = "";
        选择基金TextField.Text = "";
        选择单位ComboBox.Text = "";
        选择备注TextArea.Text = "";
        第一作者TextField.Text = "";
        第二作者TextField.Text = "";
        接收日期DateField.Text = "";
    }
}