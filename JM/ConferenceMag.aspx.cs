using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class ConferenceMag : System.Web.UI.Page
{
    int PJuanNo, PQiNo;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void 上传Button_Click(object sender, EventArgs e)
    {
        /*  if (上传论文FileUploadField.HasFile)
          {
              filepath = Server.MapPath("UpLoadFile\\" + 上传论文FileUploadField.PostedFile.FileName);
              string a = filepath.Replace("\\", "\\\\");

          }*/
        if (上传论文FileUploadField.PostedFile.FileName != "")
        {
            string filepath = 上传论文FileUploadField.PostedFile.FileName;
            // 获取上传文件名称
            string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
            //保存到服务器的路径
            string serverpath = Server.MapPath("UpLoadFile/") + filename;
            //确定上传文件
            上传论文FileUploadField.PostedFile.SaveAs(serverpath);
            //Response.Write("<script language=javascript>alert('上传成功！')</script>");
            X.Msg.Alert("Status", "上传成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "请选择文件.").Show();
        }
    }
    protected void 保存Button_Click(object sender, EventArgs e)
    {

        if (Session["TNo"] == null)
        {
            X.Msg.Alert("Status", "保存出错1.").Show();
            return;
        }
        if (会议名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议名称.").Show();
            return;
        }
        if (发表论文TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写发表的论文名称.").Show();
            return;
        }
        if (单位ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写参与人单位.").Show();
            return;
        }
        if (起始日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议起始日期.").Show();
            return;
        }
        if (结束日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议结束日期.").Show();
            return;
        }
        if (接收日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写接收日期.").Show();
            return;
        }
        if (第一作者TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写第一作者.").Show();
            return;
        }
        if (级别ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议级别.").Show();
            return;
        }
        if (卷号TextField.Text == "")
        {
            PJuanNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(卷号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PJuanNo = Convert.ToInt32(卷号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "卷号应为数字.").Show();
                return;
            }
           
        }
        if (期号TextField.Text == "")
        {
            PQiNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(期号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PQiNo = Convert.ToInt32(期号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "期号应为数字.").Show();
                return;
            }
        }
        DBHelp db = new DBHelp();
        if (db.CheckConf(发表论文TextField.Text) == 2)
        {
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string sel = "insert into CInfo(CName,TNo,CPaperName,CDeptName,CBeginTime,CEndTime,CAcceptTime,CFundName,CPFirstName,CPSecondName,CPJuanNo,CCanJia,CPQiNo,CPYeNo,CPRank,CRemark,CType,CVType) Values('" + 会议名称TextField.Text + "','" + Session["TNo"].ToString() + "','" + 发表论文TextField.Text + "','" + 单位ComboBox.SelectedItem.Text + "','" + 起始日期DateField.Text + "','" + 结束日期DateField.Text + "','" + 接收日期DateField.Text + "','" + 基金TextField.Text + "','" + 第一作者TextField.Text + "','" + 第二作者TextField.Text + "'," + PJuanNo + ",'" + 参加人员TextField.Text + "'," + PQiNo + ",'" + 页码TextField.Text + "','" + 级别ComboBox.SelectedItem.Text + "','" + 备注TextArea.Text + "','0','0')";
            mycmd.CommandText = sel;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "保存成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "保存出错2.").Show();
        }
    }
    protected void 提交Button_Click(object sender, EventArgs e)
    {
        if (Session["TNo"] == null)
        {
            X.Msg.Alert("Status", "保存出错1.").Show();
            return;
        }
        if (会议名称TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议名称.").Show();
            return;
        }
        if (发表论文TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写发表的论文名称.").Show();
            return;
        }
        if (单位ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写参与人单位.").Show();
            return;
        }
        if (起始日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议起始日期.").Show();
            return;
        }
        if (结束日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议结束日期.").Show();
            return;
        }
        if (接收日期DateField.Text == "")
        {
            X.Msg.Alert("Status", "请填写接收日期.").Show();
            return;
        }
        if (第一作者TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写第一作者.").Show();
            return;
        }
        if (级别ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写会议级别.").Show();
            return;
        }
        if (卷号TextField.Text == "")
        {
            PJuanNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(卷号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PJuanNo = Convert.ToInt32(卷号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "卷号应为数字.").Show();
                return;
            }
        }
        if (期号TextField.Text == "")
        {
            PQiNo = 0;
        }
        else
        {
            int num = 0;
            if (int.TryParse(期号TextField.Text, System.Globalization.NumberStyles.Integer, null, out num))
            {
                PQiNo = Convert.ToInt32(期号TextField.Text);
            }
            else
            {
                X.Msg.Alert("Status", "期号应为数字.").Show();
                return;
            }
        }
        DBHelp db = new DBHelp();
        if (db.CheckConf(发表论文TextField.Text) == 1)
        {//论文已提交
            X.Msg.Alert("Status", "该会议已提交或会议论文名称有误.").Show();
        }
        else if (db.CheckConf(发表论文TextField.Text) == 0)
        {//论文已保存但未提交
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string upptype = "update CInfo Set CType='1' where CPaperName='" + 发表论文TextField.Text.Trim() + "'";
            mycmd.CommandText = upptype;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "提交成功.").Show();
        }
        else if (db.CheckConf(发表论文TextField.Text) == 2)
        {//论文未保存且未提交
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string sel = "insert into CInfo(CName,TNo,CPaperName,CDeptName,CBeginTime,CEndTime,CAcceptTime,CFundName,CPFirstName,CPSecondName,CPJuanNo,CCanJia,CPQiNo,CPYeNo,CPRank,CRemark,CType,CVType) Values('" + 会议名称TextField.Text + "','" + Session["TNo"].ToString() + "','" + 发表论文TextField.Text + "','" + 单位ComboBox.SelectedItem.Text + "','" + 起始日期DateField.Text + "','" + 结束日期DateField.Text + "','" + 接收日期DateField.Text + "','" + 基金TextField + "','" + 第一作者TextField + "','" + 第二作者TextField.Text + "'," + PJuanNo + ",'" + 参加人员TextField.Text + "'," + PQiNo + ",'" + 页码TextField.Text + "','" + 级别ComboBox.SelectedItem.Text + "','" + 备注TextArea.Text + "','1','0')";
            mycmd.CommandText = sel;
            mycmd.ExecuteNonQuery();
            mycon.Close();
            X.Msg.Alert("Status", "保存成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "提交出错2.").Show();
        }
    }
}