using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class login : System.Web.UI.Page
{
    string MNo = "",TNo="",TPwd="";
  
    protected void Page_Load(object sender, EventArgs e)
    {  
       
    }

    protected void 登录ImageButton_Click(object sender, ImageClickEventArgs e)
    {
            用户名TextBox.Text = "123";
            DBHelp db = new DBHelp();
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            string sel = "select * from TInfo where TNo='" + 用户名TextBox.Text + "'and TPwd='" + 密码TextBox.Text + "'";
            SqlCommand mycmd = mycon.CreateCommand();
            mycmd.CommandText = sel;
            SqlDataReader myreader = mycmd.ExecuteReader();
            try
            {
                if (myreader.Read())
                {
                    
                    TPwd = myreader["TPwd"].ToString();
                    //Label1.Text = TName;
                    //Session.Timeout = 18000;
                    if (管理员RadioButton.Checked)
                    {
                        MNo = myreader["TNo"].ToString();
                        Session["MNo"] = MNo;
                        Response.Redirect("Glymain.aspx");
                    }
                    else
                    {
                        TNo = myreader["TNo"].ToString();
                        Session["TNo"] = TNo;
                        Response.Redirect("Main.aspx");
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('用户名或密码有误！')</script>");
                }
            }
            catch (Exception)
            {
                X.Msg.Alert("Status", "登录出错，请重新登录.").Show();
            }
            finally
            {
                myreader.Close();
                mycon.Close();
            }

        
        //Label1.Text=DESzh.DesEncrypt(密码TextBox.Text);
        //Label2.Text = "解密后"+DESzh.DesDecrypt(Label1.Text);
    }
}