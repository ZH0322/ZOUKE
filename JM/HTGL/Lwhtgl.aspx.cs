using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class HTGL_Lwhtgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*民族Store.DataSource = new object[]
        {
            new object[]{"汉族"}, new object[]{"蒙古族"}, new object[]{"回族"},new object[]{"藏族"}, new object[]{"维吾尔族"},new object[]{"苗族"}, new object[]{"彝族"},
            new object[]{"壮族"},new object[]{"布依族"},new object[]{"侗族"},new object[]{"瑶族"},new object[]{"白族"},new object[]{"土家族"},new object[]{"哈尼族"},new object[]{"哈萨克族"},new object[]{"傣族"},new object[]{"黎族"},
            new object[]{"朝鲜族"},new object[]{"满族"},new object[]{"僳僳族"},new object[]{"佤族"},new object[]{"畲族"},new object[]{"高山族"},new object[]{"拉祜族"},new object[]{"水族"},new object[]{"东乡族"},new object[]{"纳西族"},new object[]{"景颇族"},
            new object[]{"柯尔克孜族"},new object[]{"土族"},new object[]{"达斡尔族"},new object[]{"仫佬族"},new object[]{"羌族"},new object[]{"布朗族"},new object[]{"撒拉族"},new object[]{"锡伯族"},new object[]{"阿昌族"},new object[]{"普米族"},new object[]{"塔吉克族"},
            new object[]{"怒族"},new object[]{"仡佬族"},new object[]{"毛南族"},new object[]{"乌孜别克族"},new object[]{"俄罗斯族"},new object[]{"鄂温克族"},new object[]{"德昂族"},new object[]{"保安族"},new object[]{"裕固族"},new object[]{"京族"},new object[]{"塔塔尔族"},
            new object[]{"独龙族"},new object[]{"鄂伦春族"},new object[]{"赫哲族"},new object[]{"门巴族"},new object[]{"珞巴族"},new object[]{"基诺族"},
        };
        民族Store.DataBind();*/
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
        selstr = "select * from PaperInfo where PVType='0'";
        if (多项Radio.Checked)
        {
            
            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr+"and PDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (题名TextField.Text != "")
            {
                selstr = selstr + "and PName='" + 题名TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (作者TextField.Text != "")
            {
                selstr = selstr + "and PFirstName like'%" + 作者TextField.Text.Trim() + "%'or PSecondName Like '%" + 作者TextField.Text.Trim() + "%'";
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
        论文Store.DataSourceID = "";
        论文Store.DataSource = myread;
        论文Store.DataBind();
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
        selstr = "select * from PaperInfo where PVType='1'";
        if (多项Radio.Checked)
        {

            if (院系ComboBox.SelectedItem.Text != "")
            {
                selstr = selstr + "and PDeptName='" + 院系ComboBox.SelectedItem.Text.Trim() + "'";
            }
            /*else
            {
                X.Msg.Alert("Status", "请选择查询单位.").Show();
                return;
            }*/
        }
        else if (单项Radio.Checked)
        {
            if (题名TextField.Text != "")
            {
                selstr = selstr + "and PName='" + 题名TextField.Text.Trim() + "'";
            }
            else if (工号TextField.Text != "")
            {
                selstr = selstr + "and TNo='" + 工号TextField.Text.Trim() + "'";
            }
            else if (作者TextField.Text != "")
            {
                selstr = selstr + "and PFirstName like'%" + 作者TextField.Text.Trim() + "%'or PSecondName Like '%" + 作者TextField.Text.Trim() + "%'";
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
        论文Store.DataSourceID = "";
        论文Store.DataSource = myread;
        论文Store.DataBind();
        mycon.Close();
        审核Button.Disabled = true;
        撤销审核Button.Disabled = false;
    }
    protected void 审核提交Button_Click(object sender, EventArgs e)
    {
        int PId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要审核通过的论文.").Show();
            return;
        }
        PId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateUinfo = "update PaperInfo Set PVType='1' where PId="+PId;
            mycmd.CommandText = updateUinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "审核通过.").Show();
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
        int PId;
        if (选择编号TextField.Text == "")
        {
            X.Msg.Alert("Status", "请选择要撤销的论文.").Show();
            return;
        }
        PId = Convert.ToInt32(选择编号TextField.Text);
        DBHelp db = new DBHelp();
        SqlConnection mycon = db.MyCon;
        mycon.Open();
        SqlCommand mycmd = mycon.CreateCommand();
        try
        {
            string updateUinfo = "update PaperInfo Set PVType='0' where PId=" + PId;
            mycmd.CommandText = updateUinfo;
            mycmd.ExecuteNonQuery();
            X.Msg.Alert("Status", "已撤销.").Show();
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
}