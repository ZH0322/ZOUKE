using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class PaperMag : System.Web.UI.Page
{
    int PJuanNo,PQiNo;
    protected void Page_Load(object sender, EventArgs e)
    {
         DateTime dt = DateTime.Now;
         接收日期DateField.Text = dt.Date.ToLongDateString();
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
        if (题目TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写题目.").Show();
            return;
        }
        if (期刊名TextField.Text == "")
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
        if (基金TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写基金.").Show();
            return;
        }
        if (单位ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写单位.").Show();
            return;
        }
        if (级别ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写级别.").Show();
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
        if (db.CheckPaper(题目TextField.Text)==2)
        {
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string sel = "insert into PaperInfo(PName,TNo,PJName,PFirstName,PSecondName,PAcceptTime,PFundName,PJuanNo,PQiNo,PDeptName,PYeNo,PRank,PRemark,PType,PVType) Values('" + 题目TextField.Text + "','" + Session["TNo"].ToString() + "','" + 期刊名TextField.Text + "','" + 第一作者TextField.Text + "','" + 第二作者TextField.Text + "','" + 接收日期DateField.Text + "','" + 基金TextField.Text + "'," +PJuanNo + "," + PQiNo + ",'" + 单位ComboBox.SelectedItem.Text + "','" + 页码TextField.Text + "','" + 级别ComboBox.SelectedItem.Text + "','" + 备注TextArea.Text + "','" + 0 + "','"+0+"')";
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
            X.Msg.Alert("Status", "提交出错1.").Show();
            return;
        }
        if (题目TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写题目.").Show();
            return;
        }
        if (期刊名TextField.Text == "")
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
        if (基金TextField.Text == "")
        {
            X.Msg.Alert("Status", "请填写基金.").Show();
            return;
        }
        if (单位ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写单位.").Show();
            return;
        }
        if (级别ComboBox.Text == "")
        {
            X.Msg.Alert("Status", "请填写级别.").Show();
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
         if (db.CheckPaper(题目TextField.Text) == 1)
         {
             X.Msg.Alert("Status", "该论文已提交或论文名有误.").Show();
         }
         else if (db.CheckPaper(题目TextField.Text) == 0)
         {
             SqlConnection mycon = db.MyCon;
             mycon.Open();
             SqlCommand mycmd = mycon.CreateCommand();
             string upptype = "update PaperInfo Set PType='1' where PName='" + 题目TextField.Text + "'";
             mycmd.CommandText = upptype;
             mycmd.ExecuteNonQuery();
             mycon.Close();
             X.Msg.Alert("Status", "提交成功.").Show();
         }
         else if (db.CheckPaper(题目TextField.Text) == 2)
         {
             SqlConnection mycon = db.MyCon;
             mycon.Open();
             SqlCommand mycmd = mycon.CreateCommand();
             string sel = "insert into PaperInfo(PName,TNo,PJName,PFirstName,PSecondName,PAcceptTime,PFundName,PJuanNo,PQiNo,PDeptName,PYeNo,PRank,PRemark,PType,PVType) Values('" + 题目TextField.Text + "','" + Session["TNo"].ToString() + "','" + 期刊名TextField.Text + "','" + 第一作者TextField.Text + "','" + 第二作者TextField.Text + "','" + 接收日期DateField.Text + "','" + 基金TextField.Text + "'," + PJuanNo + "," + PQiNo + ",'" + 单位ComboBox.SelectedItem.Text + "','" + 页码TextField.Text + "','" + 级别ComboBox.SelectedItem.Text + "','" + 备注TextArea.Text + "','" + 1 + "','"+0+"')";
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