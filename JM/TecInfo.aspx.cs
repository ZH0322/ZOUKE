using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class TecInfo : System.Web.UI.Page
{
    string Tno = "", Tname = "", Tsex = "", Tnation = "", Tjiguan = "", Teduback = "", Tbith = "", Tcollname = "", Tmianmao = "";
     string  Temail="",Tpaperno="",Tconferenceno="",Thxxmno="",Tzxxmno="";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//第一次加载，则执行下面语句，单击提交按钮时，IsPostBack=true.
            教工号TextField.ReadOnly = true;
            教师姓名TextField.ReadOnly = true;
            性别ComboBox.ReadOnly = true;
            教师出生DateField.ReadOnly = true;
            籍贯TextField.ReadOnly = true;
            民族ComBox.ReadOnly = true;
            院系TextField.ReadOnly = true;
            教育程度TextField.ReadOnly = true;
            政治面貌ComBox.ReadOnly = true;
            邮箱TextField.ReadOnly = true;
            民族Store.DataSource = new object[]
        {
            new object[]{"汉族"}, new object[]{"蒙古族"}, new object[]{"回族"},new object[]{"藏族"}, new object[]{"维吾尔族"},new object[]{"苗族"}, new object[]{"彝族"},
            new object[]{"壮族"},new object[]{"布依族"},new object[]{"侗族"},new object[]{"瑶族"},new object[]{"白族"},new object[]{"土家族"},new object[]{"哈尼族"},new object[]{"哈萨克族"},new object[]{"傣族"},new object[]{"黎族"},
            new object[]{"朝鲜族"},new object[]{"满族"},new object[]{"僳僳族"},new object[]{"佤族"},new object[]{"畲族"},new object[]{"高山族"},new object[]{"拉祜族"},new object[]{"水族"},new object[]{"东乡族"},new object[]{"纳西族"},new object[]{"景颇族"},
            new object[]{"柯尔克孜族"},new object[]{"土族"},new object[]{"达斡尔族"},new object[]{"仫佬族"},new object[]{"羌族"},new object[]{"布朗族"},new object[]{"撒拉族"},new object[]{"锡伯族"},new object[]{"阿昌族"},new object[]{"普米族"},new object[]{"塔吉克族"},
            new object[]{"怒族"},new object[]{"仡佬族"},new object[]{"毛南族"},new object[]{"乌孜别克族"},new object[]{"俄罗斯族"},new object[]{"鄂温克族"},new object[]{"德昂族"},new object[]{"保安族"},new object[]{"裕固族"},new object[]{"京族"},new object[]{"塔塔尔族"},
            new object[]{"独龙族"},new object[]{"鄂伦春族"},new object[]{"赫哲族"},new object[]{"门巴族"},new object[]{"珞巴族"},new object[]{"基诺族"},
        };
            民族Store.DataBind();
            DataTable dt;
            if (Session["TNo"] != null)
            {
                Tno = Session["TNo"].ToString();
                DBHelp db = new DBHelp();
                dt = db.SelectTInfo(Tno);
                Tname = dt.Rows[0]["TName"].ToString();
                Tsex = dt.Rows[0]["TSex"].ToString();
                Tbith = dt.Rows[0]["TBith"].ToString();
                Tjiguan = dt.Rows[0]["TJiGuan"].ToString();
                Tnation = dt.Rows[0]["TNation"].ToString();
                Tcollname = dt.Rows[0]["TCollName"].ToString();
                Teduback = dt.Rows[0]["TEduBack"].ToString();
                Tmianmao = dt.Rows[0]["TMianMao"].ToString();
                Temail = dt.Rows[0]["TEmail"].ToString();
                Tpaperno = dt.Rows[0]["TPaperNo"].ToString();
                Tconferenceno = dt.Rows[0]["TConferenceNo"].ToString();
                Thxxmno = dt.Rows[0]["THxxmNo"].ToString();
                Tzxxmno = dt.Rows[0]["TZxxmNo"].ToString();
                教工号TextField.Text = Tno;
                教师姓名TextField.Text = Tname;
                性别ComboBox.Text = Tsex;
                教师出生DateField.Text = Tbith;
                籍贯TextField.Text = Tjiguan;
                民族ComBox.Text = Tnation;
                院系TextField.Text = Tcollname;
                教育程度TextField.Text = Teduback;
                政治面貌ComBox.Text = Tmianmao;
                邮箱TextField.Text = Temail;
                发表论文Label.Text += Tpaperno.ToString();
                参加会议Label.Text += Tconferenceno.ToString();
                Label1.Text = (Convert.ToInt32(Thxxmno) + Convert.ToInt32(Tzxxmno)).ToString() + ";";
                Label2.Text = Thxxmno.ToString() + ";";
                Label3.Text = Tzxxmno.ToString();
            }
        }
        
    }
    protected void 修改Button_Click(object sender, EventArgs e)
    {
        教师姓名TextField.ReadOnly = false;
        性别ComboBox.ReadOnly = false;
        教师出生DateField.ReadOnly = false;
        籍贯TextField.ReadOnly = false;
        民族ComBox.ReadOnly = false;
        院系TextField.ReadOnly = false;
        教育程度TextField.ReadOnly = false;
        政治面貌ComBox.ReadOnly = false;
        邮箱TextField.ReadOnly = false;
    }
    protected void 保存Button_Click(object sender, EventArgs e)
    {
        bool flag;
        flag = ChangeUInfo();
        if (flag)
        {
            X.Msg.Alert("Status", "修改成功.").Show();
        }
        else
        {
            X.Msg.Alert("Status", "修改失败.").Show();
        }
        教师姓名TextField.Text = Tname;
        性别ComboBox.Text = Tsex;
        教师出生DateField.Text = Tbith;
        籍贯TextField.Text = Tjiguan;
        民族ComBox.Text = Tnation;
        院系TextField.Text = Tcollname;
        教育程度TextField.Text = Teduback;
        政治面貌ComBox.Text = Tmianmao;
        邮箱TextField.Text = Temail;
        教师姓名TextField.ReadOnly = true;
        性别ComboBox.ReadOnly = true;
        教师出生DateField.ReadOnly = true;
        籍贯TextField.ReadOnly = true;
        民族ComBox.ReadOnly = true;
        院系TextField.ReadOnly = true;
        教育程度TextField.ReadOnly = true;
        政治面貌ComBox.ReadOnly = true;
        邮箱TextField.ReadOnly = true; 
    }
    public bool ChangeUInfo()
    {
        Tno = 教工号TextField.Text;
        Tname = 教师姓名TextField.Text;
        Tsex = 性别ComboBox.SelectedItem.Text;
        Tbith = 教师出生DateField.Text.ToString();
        Tjiguan = 籍贯TextField.Text;
        Tnation = 民族ComBox.SelectedItem.Text;
        Tcollname = 院系TextField.Text;
        Teduback = 教育程度TextField.Text;
        Tmianmao = 政治面貌ComBox.SelectedItem.Text;
        Temail = 邮箱TextField.Text;
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateUinfo = "update TInfo Set TName='" + Tname + "',TSex='" + Tsex + "',TNation='" + Tnation + "',TJiGuan='" + Tjiguan + "',TEduBack='" + Teduback + "',TBith='" + Tbith + "',TCollName='" + Tcollname + "',TMianMao='" + Tmianmao + "',TEmail='" + Temail + "' where TNo='" + Tno + "'";
            mycmd.CommandText = updateUinfo;
            mycmd.ExecuteNonQuery();
            return true;
        }
        catch(Exception)
        {
           
            return false;
        }
        finally 
        {
            mycon.Close();
        }
        
    }
}