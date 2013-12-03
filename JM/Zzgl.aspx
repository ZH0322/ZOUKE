<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zzgl.aspx.cs" Inherits="Zzgl" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>著作管理</title>
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
      <ext:Store ID="著作类别Store" runat="server">
     <Reader>
      <ext:ArrayReader>
       <Fields>
        <ext:RecordField Name="zzlb"></ext:RecordField>
       </Fields>
      </ext:ArrayReader>
     </Reader>
    </ext:Store>
     <ext:FormPanel ID="著作管理FormPanel" runat="server" ButtonAlign="Right" Height="600" Padding="5"
        Title="著作管理">
        <Items>
             <ext:Container ID="Container1" runat="server" Layout="RowLayout" Height="580">
             <Items>
              <ext:TextField ID="名称TextField" runat="server"  Width="800" FieldLabel="著作名称*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
              <ext:TextField ID="出版社TextField" runat="server"  Width="800" FieldLabel="出版社*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
              <ext:Container ID="Container12" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:DateField ID="出版日期DateField" runat="server"  Width="220" FieldLabel="出版日期*" LabelAlign="Left" LabelWidth="60"></ext:DateField>
               <ext:TextField ID="编号TextField" runat="server"   Width="220" FieldLabel="ISBN号*" LabelAlign="Right" LabelWidth="60"></ext:TextField>
               <ext:ComboBox runat="server" ID="著作类别ComboBox" FieldLabel="著作类别*" LabelAlign="Right" LabelWidth="160" Width="320" StoreID="著作类别Store" DisplayField="zzlb" ValueField="zzlb" Editable="true" TypeAhead="true" Mode="Local" Resizable="true" SelectOnFocus="true" SelectedIndex="0"></ext:ComboBox>
               <ext:TextField ID="字数TextField" runat="server"  Width="220" FieldLabel="字数" LabelAlign="Right" LabelWidth="160"></ext:TextField>
              </Items>
              </ext:Container>
               <ext:Container ID="Container13" runat="server"  Height="300">
              <Items>
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
             <ext:FieldSet ID="备注FieldSet" runat="server" Height="200"  FormGroup="true" Title="备注" TitleCollapse="false">
                <Items>
                 <ext:TextArea ID="备注TextArea" runat="server" Height="80" FieldLabel="备注" LabelAlign="Left" LabelWidth="60" Width="800"></ext:TextArea>
                </Items>
             </ext:FieldSet>
              
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
        </Buttons>
    </ext:FormPanel>
    </form>
</body>
</html>
