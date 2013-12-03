using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

public partial class Zzgl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        著作类别Store.DataSource = new object[]
        {
            new object[]{"科研"},new object[]{"自然"},new object[]{"文化"},new object[]{"地理"},new object[]{"历史"},new object[]{"生活"},new object[]{"社会"},new object[]{"艺术"},new object[]{"人物"},new object[]{"经济"},
            new object[]{"体育"},new object[]{""},new object[]{""},new object[]{""},
        };
        著作类别Store.DataBind();
    }
    protected void 保存Button_Click(object sender, EventArgs e)
    {

    }
}