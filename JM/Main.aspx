<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>主页</title>
    <style type="text/css">
        .west-panel .x-layout-collapsed-west{
            background: url(collapsed-west.png) no-repeat center;
        }
        
        .south-panel .x-layout-collapsed-south{
            background: url(collapsed-south.png) no-repeat center;
        }
        .fontsize
        {
            font-family:华文楷体;
            font-size:larger;
            text-align:center;
            
        }
        .header
        {
   
            background-position: left 2px;
            background-repeat: no-repeat;
            padding-left: 50px;
            margin-top: 5px;
            margin-left: 5px;
        }
        .header a
        {
            color: #fff;
            font-weight: bold;
            font-size: 25px;
            text-decoration: none;
        }
        .lafloat
        {
            
            font-weight: bold;
            float:right;
            margin-left:20px;
            }
    </style>
    <script type="text/javascript">
        var addTab = function (tabPanel, id, url) {
            var tab = tabPanel.getComponent(id);

            if (!tab) {
                tab = tabPanel.add({
                    id: id,
                    title: url,
                    closable: true,
                    autoLoad: {
                        showMask: true,
                        url: url,
                        mode: "iframe",
                        maskMsg: "Loading " + url + "..."
                    }
                });
            }
            tabPanel.setActiveTab(tab);
            tabPanel.scrollToTab(tab);
        }
    </script>
    
</head>
<body >
    <form id="form1" runat="server">
     <ext:ResourceManager ID="ResourceManager1" runat="server" />
      <ext:Viewport ID="Viewport1" runat="server" Layout="Border">
        <Items> 
            <ext:BorderLayout ID="BorderLayout1" runat="server">
                 <North> 
                 
                  <ext:Panel  ID="TopPanel" runat="server" Height="73">      
                    <Items>
                     <ext:Panel runat="server" ID="InPanel" Height="40"  BodyStyle="background-color:#1C3E7E;">
                      <Content>
                        <div class="header">
                            <a href="./Main.aspx" style="color:#fff;">科研管理系统</a>
                         </div>
                      </Content>   
                     </ext:Panel>
                     <ext:Toolbar ID="toorbar1"  runat="server" Height="32" > 
                      <Items>
                          <ext:Label ID="当前用户Label" runat="server" Icon="ArrowRight" Text="当前用户：" Width="300" >
                          </ext:Label>
                          <ext:Label ID="登录时间Label" runat="server" Text="登录时间:"  LabelAlign="Right"  Width="300" CtCls="lafloat">
                          </ext:Label>
                          <ext:ToolbarFill ID="ToolbarFill2" runat="server">
                           </ext:ToolbarFill>
                           <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                           </ext:ToolbarSeparator>
                           <ext:Button ID="退出Button" runat="server" Text="退出" StandOut="True" Icon="ArrowUndo" Cls="x-btn-text-icon">
                            <DirectEvents>
                            <Click OnEvent="退出Button_Click"> 
                            </Click>
                            </DirectEvents>
                          </ext:Button>
                          <ext:ToolbarSeparator ID="ToolbarSeparator2" runat="server"></ext:ToolbarSeparator>
                          <ext:Button runat="server" ID="Login" Text="修改密码" StandOut="true" Icon="CdrEdit" Cls="x-btn-text-icon">
                            <DirectEvents>
                              <Click OnEvent="修改密码Button_Click" />
                            </DirectEvents>
                          </ext:Button>
                          
                      </Items>
                     </ext:Toolbar>
                     </Items>
                     
                   </ext:Panel>
                </North>
                <West Collapsible="false" MinWidth="175" Split="false">
                    <ext:Panel ID="Panel1" runat="server" Width="220" Split="true" Border="false" Region="West" Layout="VBox" Collapsed="false" CtCls="west-panel">
                        <LayoutConfig>
                            <ext:VBoxLayoutConfig Padding="2" Align="Stretch" />
                        </LayoutConfig>
                        <Items>
                            <ext:Panel ID="Panel11" runat="server" Flex="1" Layout="Accordion" Margins="0 0 5 0">
                                    <Items>
                                        <ext:TreePanel  ID="TreePanel1"  runat="server"  Width="300"  Height="450" Icon="User" Title="用户管理"  RootVisible="false" AutoScroll="true">
                                            
                                            <Root>
                                                <ext:TreeNode   NodeID="nod1" Text="用户管理" Icon="UserGray">
                                                <Nodes>
                                                    <ext:TreeNode NodeID="nod11" Text="用户信息管理" Icon="UserGray">
                                                    <Listeners>
                                                        <Click Handler="addTab(#{TabPanel1}, 'idSXxt', 'TecInfo.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                    
                                                </Nodes>
                                                </ext:TreeNode>
                                           </Root>
                                    </ext:TreePanel>
                                    <ext:TreePanel  ID="TreePanel2"  runat="server"  Width="300"  Height="450" Icon="UserB" Title="论文管理"  RootVisible="false" AutoScroll="true">
                                        <Root>
                                                <ext:TreeNode NodeID="nod2" Text="论文管理" Icon="UserGray">
                                                <Nodes>
                                                    <ext:TreeNode Text="添加论文"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt21', 'PaperMag.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                    <ext:TreeNode Text="保存结果"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt22', 'PaperReserve.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                     <ext:TreeNode Text="查看已提交论文"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt23', 'TJResult/PaperTj.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                </Nodes>
                                                </ext:TreeNode>
                                        </Root>
                                    </ext:TreePanel>
                                    <ext:TreePanel  ID="TreePanel3"  runat="server"  Width="300"  Height="450" Icon="UserB" Title="会议管理"  RootVisible="false" AutoScroll="true">
                                        <Root>
                                                <ext:TreeNode NodeID="nod3" Text="会议管理" Icon="UserGray">
                                                <Nodes>
                                                    <ext:TreeNode Text="添加会议"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt31', 'ConferenceMag.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                     <ext:TreeNode Text="保存结果"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt32', 'ConferenceReserve.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                     <ext:TreeNode Text="查看已提交会议"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt33', 'TJResult/ConferenceTj.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                </Nodes>
                                                </ext:TreeNode>
                                        </Root>
                                   </ext:TreePanel>
                                   
                                     <ext:TreePanel  ID="TreePanel5"  runat="server"  Width="300"  Height="450" Icon="UserB" Title="项目管理"  RootVisible="false" AutoScroll="true">
                                        <Root>
                                                <ext:TreeNode NodeID="nod5" Text="项目管理" Icon="UserGray">
                                                <Nodes>
                                                   <ext:TreeNode Text="项目管理"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt51', 'ProjectMag.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                    
                                                    <ext:TreeNode Text="保存结果"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt54', 'ProjectReserve.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                     <ext:TreeNode Text="查看已提交项目"  Icon="Application">
                                                    <Listeners>
                                                         <Click Handler="addTab(#{TabPanel1}, 'idClt55', 'TJResult/XmTj.aspx');" />
                                                    </Listeners>
                                                    </ext:TreeNode>
                                                </Nodes>
                                                </ext:TreeNode>
                                        </Root>
                                    </ext:TreePanel>
                                    </Items>
                       </ext:Panel>
                    </Items>
                </ext:Panel>
                </West>
                <Center>
                   <ext:TabPanel ID="TabPanel1" runat="server" Region="Center" IDMode="Explicit" EnableTabScroll="true">
                    <Items>
                     <ext:Panel ID="Panel2" runat="server" Title="首页" Icon="Application">
                      <Content>zhangheng
                      </Content>
                     </ext:Panel>
                      <ext:Window ID="修改密码Window"  runat="server" Icon="House"  Layout="FormLayout" Hidden="true"  Width="260" Height="220" Title="修改密码" ButtonAlign="Center">
                        <Items>
                        <ext:TextField ID="用户名TextField" runat="server" ReadOnly="true" AllowBlank="false" BlankText="Your username is required." FieldLabel="用户名" LabelAlign="Right" Width="240" LabelWidth="40"></ext:TextField>
                        <ext:TextField ID="旧密码TextField" runat="server" AllowBlank="false" BlankText="Your oldpwd is required." FieldLabel="旧密码" LabelAlign="Right" LabelWidth="40" Width="240" InputType="Password"></ext:TextField>
                        <ext:TextField ID="密码TextField" runat="server" AllowBlank="false" BlankText="Your newpwd is required." FieldLabel="密码" LabelAlign="Right" LabelWidth="40" Width="240" InputType="Password"></ext:TextField>
                        <ext:TextField ID="确认密码TextField" runat="server" AllowBlank="false" BlankText="Your newpwd is required." FieldLabel="确认密码" LabelAlign="Right" LabelWidth="40" Width="240" InputType="Password"></ext:TextField>
                        </Items>
                        <Buttons>
                        <ext:Button ID="保存Button" runat="server" Text="Save" Icon="Accept">
                        <Listeners>
                            <Click Handler="
                            if (!#{用户名TextField}.validate()||!#{旧密码TextField}.validate()||!#{密码TextField}.validate()||!#{确认密码TextField}.validate()) {
                            Ext.Msg.alert('Error','The Username and Password fields are both required');
                            // return false to prevent the btnLogin_Click Ajax Click event from firing.
                            return false; 
                             }" />
                            </Listeners>
                            <DirectEvents>
                                <Click OnEvent="保存Button_Click">
                                </Click>
                            </DirectEvents>
                        </ext:Button>
                        <ext:Button ID="取消Button" runat="server" Text="Cancel" Icon="Delete" /></Buttons>
                    </ext:Window>
                    </Items>
                   </ext:TabPanel>
                </Center>                
            </ext:BorderLayout>
            
         </Items>
     </ext:Viewport>
    </form>
</body>
</html>
