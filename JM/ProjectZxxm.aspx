<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectZxxm.aspx.cs" Inherits="ProjectZxxm" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>纵向项目</title>
    <script runat="server">
        protected void 选择结果Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {
            
            this.院系Store.DataBind();
        }
        </script>
         <style type="text/css">
        .paneltop{
            margin-top:8px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <asp:SqlDataSource ID="院系SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [ColInfo]"></asp:SqlDataSource>
    <ext:Store ID="院系Store" runat="server" DataSourceID="院系SqlDataSource" UseIdConfirmation="true" OnRefreshData="选择结果Store_RefershData">
     <Reader>
      <ext:JsonReader IDProperty="CId">
       <Fields>
        <ext:RecordField Name="CId"></ext:RecordField>
        <ext:RecordField Name="CName" />
       </Fields>
      </ext:JsonReader>
     </Reader>
     <Listeners>
       <LoadException Handler="Ext.Msg.alert('STu - Load failed', e.message || e);" />
       <CommitFailed Handler="Ext.Msg.alert('Stu - Commit failed', 'Reason: ' + msg);" />
       <SaveException Handler="Ext.Msg.alert('Stu - Save failed', e.message || e);" />
       <CommitDone Handler="Ext.Msg.alert('Stu - Commit', 'The data successfully saved');" />
     </Listeners>  
     </ext:Store>
     <ext:FormPanel ID="横向项目FormPanel" runat="server" ButtonAlign="Right" Height="500" Padding="5"
        Title="项目录入">
        <Items>
             <ext:Container ID="Container1" runat="server" Layout="RowLayout" Height="480">
             <Items>
                  <ext:TextField ID="名称TextField" runat="server"  Width="800" FieldLabel="项目名称*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
                  <ext:TextField ID="编号TextField" runat="server"  Width="800" FieldLabel="项目编号*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
                  <ext:Container ID="Container12" runat="server" Layout="TableLayout" Height="30">
                  <Items>
                      <ext:ComboBox ID="项目类别ComboBox" runat="server" Width="220" FieldLabel="项目类别" LabelAlign="Left" LabelWidth="60">
                       <Items>
                        <ext:ListItem Text="国家社会科学基金项目" />
                        <ext:ListItem Text="国家自然科学基金项目" />
                        <ext:ListItem Text="863计划" />
                        <ext:ListItem Text="973计划" />
                        <ext:ListItem Text="中央基础研究项目" />
                        <ext:ListItem Text="省级项目" />
                        <ext:ListItem Text="全国教育科学规划课题" />
                        <ext:ListItem Text="省级项目" />
                        <ext:ListItem Text="地州级项目" />
                        <ext:ListItem Text="学校科研项目" />
                        <ext:ListItem Text="其它"/>
                       </Items>
                      </ext:ComboBox>
                      <ext:DateField ID="立项日期DateField" runat="server"  Width="220" FieldLabel="立项日期*" LabelAlign="Right" LabelWidth="100"></ext:DateField>
                      
                      <ext:TextField ID="负责人TextField" runat="server"   Width="180" FieldLabel="负责人*" LabelAlign="Right" LabelWidth="60"></ext:TextField>
                      <ext:DateField ID="结题时间DateField" runat="server"  Width="220" FieldLabel="结题时间*" LabelAlign="Right" LabelWidth="100"></ext:DateField>
                      
                 </Items>
                 </ext:Container>
                 <ext:Container ID="Container13" runat="server" Height="300">
                 <Items>
                     <ext:TextField ID="项目金额TextField" runat="server" Height="30"  Width="220" FieldLabel="项目金额*" LabelAlign="Left" LabelWidth="60"></ext:TextField>                     
                     <ext:Panel ID="Panel1" runat="server" Height="200" Title="Title" Header="false" Layout="Fit" >
                     <Items>
                          <ext:GridPanel ID="参与人GridPanel" runat="server" Height="180" Title="参与人" StoreID="院系Store" Width="800" CtCls="paneltop" StripeRows="true"  TrackMouseOver="true" AutoScroll="True" AutoWidth="True">
                            <ColumnModel ID="ColumnModel1"  runat="server">
                            <Columns>
                            <ext:RowNumbererColumn ColumnID="Num1" Width="80"></ext:RowNumbererColumn>
                            <ext:Column ColumnID="SName" Header="姓名" DataIndex="CName" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField1" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="SDanwei" Header="单位" DataIndex="CName" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField2" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="SEduBack" Header="教育背景" DataIndex="CName" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField3" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            </Columns>
                            </ColumnModel>
                        </ext:GridPanel>
                    </Items>
                    <Buttons>
                        <ext:Button ID="btnInsert" runat="server"  Text="添加参与人" Icon="Add">
                        <Listeners>
                            <Click Handler="#{参与人GridPanel}.insertRecord(0, {});#{参与人GridPanel}.getView().focusRow(0);#{参与人GridPanel}.startEditing(0, 0);" />
                        </Listeners>
                        </ext:Button>
                        <ext:Button ID="btnSave" runat="server"  Text="保存" Icon="Disk">
                        <Listeners>
                            <Click Handler="#{参与人GridPanel}.save();" />
                        </Listeners>
                        </ext:Button>
                        <ext:Button ID="btnDelete" runat="server"  Text="删除" Icon="Delete">
                        <Listeners>
                            <Click Handler="#{参与人GridPanel}.deleteSelected();if (!#{参与人GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                        </Listeners>
                        </ext:Button>
                    </Buttons>  
                     </ext:Panel>
                     <ext:TextArea ID="项目简介TextArea" runat="server" Height="80" FieldLabel="项目简介" LabelAlign="Left" LabelWidth="60" Width="800"></ext:TextArea>
                </Items>
                </ext:Container>
             </Items>
            </ext:Container>
        </Items>
        <Buttons>
            <ext:Button ID="保存Button" runat="server" Icon="Disk" Text="保存">
              <DirectEvents>
                   <Click OnEvent="保存Button_Click"></Click>
              </DirectEvents>
            </ext:Button>
             <ext:Button ID="提交Button" runat="server" Icon="Disk" Text="提交">
            </ext:Button>
             <ext:Button ID="取消Button" runat="server" Icon="Disk" Text="取消">
            </ext:Button>
        </Buttons>
    </ext:FormPanel>
    </form>
</body>
</html>
