<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理平台登录</title>
    <style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {color: #528311; font-size: 12px; }
.STYLE4 {
	color: #42870a;
	font-size: 12px;
}
        .style1
        {
            height: 16px;
        }
        .style2
        {
            width: 424px;
        }
        .style3
        {
            width: 183px;
        }
       
    </style>

</head>
<body>
    <form id="form1" name="form1" runat="server" method="post" action=""> 
    <div>
     <table width="100%" border="0" cellpadding="0" cellspacing="0" 
            style="height: 1000px">
  <tr>
    <td bgcolor="#e5f6cf" class="style1">
        
        </td>
  </tr>
  <tr>
   <td height="608" background="images/login_03.gif">
        <table width="862" border="0" 
            align="center" cellpadding="0" cellspacing="0" style="height: 582px">
      <tr>
        <td height="266" background="images/login_04.gif" >&nbsp;</td>
      </tr>
      <tr>
        <td height="95"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="95" background="images/login_06.gif" class="style2">&nbsp;</td>
            <td background="images/login_07.gif" class="style3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="21%" height="30"><div align="center"><span class="STYLE3">用户:</span></div></td>
                <td height="30"  >
                    <asp:TextBox ID="用户名TextBox" runat="server" Text="123" Width="130px"></asp:TextBox></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="STYLE3">密码:</span></div></td>
                <td height="30" >
                    <asp:TextBox ID="密码TextBox" runat="server"  TextMode="Password" Width="130px"></asp:TextBox></td>
              </tr>
              <tr>
                
                <td height="30" colspan="2">
                 <table width="100%">
                  <tr>
                   <td><asp:RadioButton ID="管理员RadioButton" runat="server" Text="管理员" GroupName="Type"  /></td>
                    <td  ><asp:RadioButton ID="普通RadioButton"
                        runat="server" Text="普通用户" GroupName="Type" Checked="true" /></td>
                  </tr>
                 </table>
                 
                </td>
              </tr>
            </table></td>
            <td width="255" background="images/login_08.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="247" valign="top" background="images/login_09.gif">
            <table width="100%" 
                border="0" cellspacing="0" cellpadding="0" style="height: 47px">
          <tr>
            <td width="22%" height="30">&nbsp;</td>
            <td width="28%"></td>
            <td width="28%">&nbsp;&nbsp;&nbsp;
             <asp:ImageButton ID="登录ImageButton" runat="server" 
                        ImageUrl="~/Images/login/login.gif" onclick="登录ImageButton_Click"   />&nbsp;&nbsp;
                    <asp:ImageButton ID="重置ImageButton" runat="server" ImageUrl="~/Images/login/reset.gif" /></td>
            <td width="22%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" 
                    style="height: 7px">
              <tr>
                <td width="44%" height="20">&nbsp;</td>
                <td width="56%" class="STYLE4">版本 2012V1.0 </td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#a2d962">&nbsp;</td>
  </tr>
</table>
        
<map name="Map"><area shape="rect" coords="3,3,36,19" href="#"><area shape="rect" coords="40,3,78,18" href="#"></map>
    </div>
    </form>
</body>
</html>
