using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Ext.Net;

/// <summary>
///DBHelp1 的摘要说明
/// </summary>
public class DBHelp
{	
    public string MyConnectionString;
    public SqlConnection MyCon;
    public DBHelp()
    {
        MyConnectionString = "server=ZH-PC;uid=sa;pwd=zhang;database=JM";
        MyCon = new SqlConnection(MyConnectionString);
        //MyCon.Open();
    }
    public bool ChangePwd(string username,string oldpwd,string newpwd)
    {
        string changestr = "update TInfo Set TPwd='"+newpwd+"' where TName='"+username+"' and TPwd='"+oldpwd+"'";
        SqlCommand mycmd = MyCon.CreateCommand();
        MyCon.Open();
        mycmd.CommandText = changestr;
        mycmd.ExecuteNonQuery();
        MyCon.Close();
        return true;
    }
    public DataTable SelectTInfo(string Tno)
    {
        DataTable dt = new DataTable();
        string seluinfo = "select * from TInfo where TNo='" + Tno + "'";
        SqlCommand selcmd = MyCon.CreateCommand();
        MyCon.Open();
        selcmd.CommandText = seluinfo;
        SqlDataAdapter sda = new SqlDataAdapter(selcmd);
        sda.Fill(dt);
        MyCon.Close();
        return dt;
    }
    public int CheckPaper(string pno)
    {
        string selstr = "select * from PaperInfo where PName='" + pno + "'";
        MyCon.Open();
        SqlCommand mycmd = MyCon.CreateCommand();
        DataTable dt = new DataTable();
        mycmd.CommandText = selstr;
        SqlDataAdapter da = new SqlDataAdapter(mycmd);
        da.Fill(dt);
        string ptype = "";
        try
        {
            if (dt.Rows.Count == 0)
            {
                return 2;
            }
            else
            {
                ptype = dt.Rows[0]["PType"].ToString().Trim();
                if ( ptype == "1")
                {//论文已存在且提交则返回1
                    return 1;
                }
                else if (ptype == "0")
                {//论文已存在但未提交返回0
                    return 0;
                }
                else
                {
                    return 3;
                }
            }
       } 
       catch (Exception)
       {
            return 3;
       }
       finally
       {
            
            MyCon.Close();
       }
    }
    public int CheckConf(string cpno)
    {
        string selstr = "select * from CInfo where CPaperName='" + cpno + "'";
        MyCon.Open();
        SqlCommand mycmd = MyCon.CreateCommand();

        DataTable dt = new DataTable();
        mycmd.CommandText = selstr;
        SqlDataAdapter da = new SqlDataAdapter(mycmd);
        da.Fill(dt);
        string ptype = "";
        try
        {
            if (dt.Rows.Count == 0)
            {
                return 2;
            }
            else
            {
                ptype = dt.Rows[0]["CType"].ToString().Trim();
                if (ptype == "1")
                {//论文已存在且提交则返回1
                    return 1;
                }
                else if (ptype == "0")
                {//论文已存在但未提交返回0
                    return 0;
                }
                else
                {
                    return 3;
                }
            }
        }
        catch (Exception)
        {
            return 3;
        }
        finally
        {

            MyCon.Close();
        }
    }
    public int CheckXM(string XMno)
    {
        string selstr = "select * from XMInfo where XMNo='" + XMno + "'";
        MyCon.Open();
        SqlCommand mycmd = MyCon.CreateCommand();

        DataTable dt = new DataTable();
        mycmd.CommandText = selstr;
        SqlDataAdapter da = new SqlDataAdapter(mycmd);
        da.Fill(dt);
        string ptype = "";
        try
        {
            if (dt.Rows.Count == 0)
            {
                return 2;
            }
            else
            {
                ptype = dt.Rows[0]["XType"].ToString().Trim();
                if (ptype == "1")
                {//论文已存在且提交则返回1
                    return 1;
                }
                else if (ptype == "0")
                {//论文已存在但未提交返回0
                    return 0;
                }
                else
                {
                    return 3;
                }
            }
        }
        catch (Exception)
        {
            return 3;
        }
        finally
        {

            MyCon.Close();
        }
    }
}