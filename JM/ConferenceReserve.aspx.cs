using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class ConferenceReserve : System.Web.UI.Page
{
    int CId, CJuanNo, CQiNo;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void 提交Button_Click(object sender, EventArgs e)
    {
        if (选择名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议名称.").Show();
            return;
        }
        if (选择论文TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写论文名称.").Show();
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
            CJuanNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(选择卷号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                CJuanNo = Convert.ToInt32(选择卷号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "卷号应为数字.").Show();
                return;
            }    
        }
        if (选择期号TextField.Text == "")
        {
            CQiNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(选择期号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                CQiNo = Convert.ToInt32(选择期号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "期号应为数字.").Show();
                return;
            }      
        }
        CId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        string sel = "update CInfo Set CName='" + 选择名称TextField.Text + "',CPaperName='" + 选择论文TextField.Text + "',CDeptName='" + 选择单位ComboBox.SelectedItem.Text + "',CBeginTime='" + 选择开始DateField.Text + "',CEndTime='" + 选择结束DateField.Text + "',CAcceptTime='" + 接收日期DateField.Text + "',CFundName='" + 选择基金TextField.Text + "',CPFirstName='" + 第一作者TextField.Text + "',CPSecondName='" + 第二作者TextField.Text + "',CPJuanNo=" + CJuanNo + ",CCanJia='" + 选择参加TextField.Text + "',CPQiNo=" + CQiNo + ",CPYeNo='" + 选择页号TextField.Text + "',CPRank='" + 选择级别ComboBox.SelectedItem.Text + "',CRemark='" +选择备注TextArea.Text + "',CType='1' where CId=" + CId;
        mycmd.CommandText = sel;
        mycmd.ExecuteNonQuery();
        mycon.Close();
        X.Msg.Alert("Status", "提交成功.").Show();
    }

    protected void 取消Button_Click(object sender, EventArgs e)
    {
        选择名称TextField.Text = "";
        选择页号TextField.Text = "";
        选择论文TextField.Text = "";
        选择期号TextField.Text = "";
        选择卷号TextField.Text = "";
        选择级别ComboBox.Text = "";
        选择基金TextField.Text = "";
        选择单位ComboBox.Text = "";
        选择备注TextArea.Text = "";
        第一作者TextField.Text = "";
        第二作者TextField.Text = "";
        接收日期DateField.Text = "";
        选择开始DateField.Text = "";
        选择结束DateField.Text = "";
    }
}