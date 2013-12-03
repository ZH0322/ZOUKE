<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Yhhtgl.aspx.cs" Inherits="HTGL_Yhhtgl" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户管理</title>
    <script runat="server">
        protected void 用户Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {
            this.用户Store.DataBind();
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource" runat="server"></asp:SqlDataSource>
     <ext:Store ID="用户Store" runat="server"  UseIdConfirmation="true"  OnRefreshData="用户Store_RefershData">
     <Reader>
      <ext:JsonReader IDProperty="TNo">
       <Fields>
        <ext:RecordField Name="TNo" />
        <ext:RecordField Name="TName" />
        <ext:RecordField Name="TSex" />
        <ext:RecordField Name="TBith" Type="Date" />
        <ext:RecordField Name="TNation"></ext:RecordField>
        <ext:RecordField Name="TJiGuan" />
        <ext:RecordField Name="TCollName" Type="String" />
        <ext:RecordField Name="TMianMao" Type="String"/>
        <ext:RecordField Name="TEmail" />
        <ext:RecordField Name="TEduBack" />
        <ext:RecordField Name="TPaperNo" />
        <ext:RecordField Name="TConferenceNo" />
        <ext:RecordField Name="THxxmNo" />
        <ext:RecordField Name="TZxxmNo" /> 
       </Fields>
      </ext:JsonReader>
     </Reader>
     <Listeners>
       <LoadException Handler="Ext.Msg.alert('Tu - Load failed', e.message || e);" />
       <CommitFailed Handler="Ext.Msg.alert('tu - Commit failed', 'Reason: ' + msg);" />
       <SaveException Handler="Ext.Msg.alert('tu - Save failed', e.message || e);" />
       <CommitDone Handler="Ext.Msg.alert('tu - Commit', 'The data successfully saved');" />
     </Listeners>    
    </ext:Store>
     <ext:Store ID="民族Store" runat="server">
     <Reader>
      <ext:ArrayReader>
       <Fields>
        <ext:RecordField Name="Nation"></ext:RecordField>
       </Fields>
      </ext:ArrayReader>
     </Reader>
    </ext:Store>
     <ext:Store ID="院系Store" runat="server">
     <Reader>
      <ext:ArrayReader>
       <Fields>
        <ext:RecordField Name="TCollName"></ext:RecordField>
       </Fields>
      </ext:ArrayReader>
     </Reader>
    </ext:Store>
    <ext:Viewport ID="Viewport1" runat="server">
      <Items>
      <ext:BorderLayout ID="BorderLayout1" runat="server">
       <North MarginsSummary="0 5 0 5">
       <ext:Panel ID="Panel1" runat="server" Title="查询条件" Height="86">
       <Items>
        <ext:Toolbar ID="Toolbar1" runat="server" Height="60" Layout="RowLayout">
         <Items>
            <ext:Container ID="AllContainer" runat="server" Layout="RowLayout" Height="60">
             <Items>
              <ext:Container ID="FirstContainer" runat="server" Layout="TableLayout" Height="30">
              <Items>
                <ext:Radio ID="多项Radio" Name="z" Checked="true" runat="server" FieldLabel="多项查询" Width="80" LabelAlign="Right" LabelWidth="60"></ext:Radio>
              <ext:ComboBox  ID="院系ComboBox"  runat="server" DisplayField="TCollName" ValueField="TCollName" StoreID="院系Store" Width="280" FieldLabel="院系" SelectedIndex="1" LabelAlign="Right"  Editable="false"  TypeAhead="true"  Mode="Local" ForceSelection="true" TriggerAction="All" SelectOnFocus="true"  LabelWidth="60">     
                    
                </ext:ComboBox>
               
                </Items>
                </ext:Container>
                <ext:Container ID="SecondContainer" Layout="TableLayout" runat="server" Height="30">
                <Items>
                  <ext:Radio ID="单项Radio" Name="z" runat="server" FieldLabel="单项查询" Width="80" LabelAlign="Right" LabelWidth="60"></ext:Radio>
                  <ext:TextField ID="姓名TextField" runat="server" FieldLabel="按姓名" Width="150"  LabelWidth="60" LabelAlign="Right">
                  </ext:TextField>
                  <ext:TextField ID="工号TextField" runat="server" FieldLabel="按工号" Width="150" LabelWidth="50" LabelAlign="Right">
                  </ext:TextField>
                  <ext:Button runat="server" ID="查询Button" Text="查询" Icon="ArrowRefresh" >
                  <DirectEvents>
                    <Click OnEvent="查询Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="500" />              
                    </Click>
                 </DirectEvents>
                 </ext:Button> 
                </Items>
                </ext:Container>
             </Items>
            </ext:Container>
         </Items>
        </ext:Toolbar>
        </Items>
        </ext:Panel>
       </North>
       <Center MarginsSummary="0 5 0 5">
        <ext:Panel ID="Panel2" runat="server" Height="300" Header="false" Layout="Fit">
         <Items>
           <ext:GridPanel ID="用户GridPanel" runat="server" StoreID="用户Store" StripeRows="true" Title="用户信息" Height="800" TrackMouseOver="true" AutoScroll="True" AutoWidth="True">
            <ColumnModel ID="ColumnModel1"  runat="server">
            <Columns>
          <ext:RowNumbererColumn ColumnID="Num1"></ext:RowNumbererColumn>
          <ext:Column ColumnID="TNo" Header="工号" DataIndex="TNo" Width="80" />
           <ext:Column ColumnID="TName" Header="姓名" DataIndex="TName" Width="80">
           
            </ext:Column>
             <ext:Column ColumnID="TSex" Header="性别" DataIndex="TSex" Width="80">
             
             </ext:Column>
             <ext:Column ColumnID="TNation" Header="民族" DataIndex="TNation" Width="80">
           
            </ext:Column>
              <ext:DateColumn ColumnID="TBith" Header="出生日期" DataIndex="TBith" Width="100" Format="yyyy-MM-dd">
             
              </ext:DateColumn>
              
              <ext:Column ColumnID="TJiGuan" Header="籍贯" DataIndex="TJiGuan" Width="60">
              
               </ext:Column>
               <ext:Column ColumnID="TCollName" Header="院系" DataIndex="TCollName" Width="150">
                
               </ext:Column>
               <ext:Column ColumnID="TMianMao" Header="面貌" DataIndex="TMianMao" Width="80">
               
               </ext:Column>
               <ext:Column ColumnID="TEmail" Header="邮箱" DataIndex="TEmail" Width="140">
               
                </ext:Column>
                <ext:Column ColumnID="TEduBack" Header="教育背景" DataIndex="TEduBack" Width="60">
                              
                </ext:Column>
                <ext:Column ColumnID="TPaperNo" Header="发表论文" DataIndex="TPaperNo" Width="60">
                 
                </ext:Column>
                <ext:Column ColumnID="TConferenceNo" Header="参加会议" DataIndex="TConferenceNo" Width="60">
                 
                </ext:Column>
                <ext:Column ColumnID="THxxmNo" Header="横向项目" DataIndex="THxxmNo" Width="60">
                 
                </ext:Column>
                <ext:Column ColumnID="TZxxmNo" Header="纵向项目" DataIndex="TZxxmNo" Width="150">
                
                </ext:Column>
              <ext:CommandColumn Width="35">
                        <Commands>
                            <ext:GridCommand Icon="NoteEdit" CommandName="Edit">
                                <ToolTip Text="Edit" />
                            </ext:GridCommand>
                        </Commands>
                    </ext:CommandColumn>
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
             <Listeners>
                <RowDeselect Handler="if (!#{用户GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                <RowSelect Handler="#{详情FormPanel}.getForm().loadRecord(record);" />
             </Listeners>
            </ext:RowSelectionModel>
        </SelectionModel>
        <LoadMask ShowMask="true" />
         <BottomBar>
           <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10" DisplayInfo="false" StoreID="用户Store">
             <Items>
               <ext:Label ID="Label2" runat="server" Text="Page size:" />
               <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
               <ext:ComboBox ID="ComboBox1" runat="server" Width="80">
                 <Items>
                   <ext:ListItem Text="1" />
                   <ext:ListItem Text="2" />
                   <ext:ListItem Text="10" />
                   <ext:ListItem Text="20" />
                 </Items>
                 <SelectedItem Value="10" />
                  <Listeners>
                    <Select Handler="#{PagingToolbar1}.pageSize = parseInt(this.getValue()); #{PagingToolbar1}.doLoad();" />
                  </Listeners>
                </ext:ComboBox>
            </Items>
           </ext:PagingToolbar>
         </BottomBar>
         <SaveMask ShowMask="true" />
         <LoadMask ShowMask="true" />
         <Listeners>
           <Click Handler="Button1_Click" />
           <Command Handler="Button1_Click" />
               
          </Listeners>
       </ext:GridPanel>
       </Items>
       </ext:Panel>
       </Center>
       <South> 
        <ext:FormPanel ID="详情FormPanel" runat="server" ButtonAlign="Right" Padding="5" Height="150" Title="详情">
           <Items>
            <ext:Container ID="Container4" runat="server" Layout="RowLayout" Height="60">
             <Items>
              <ext:Container ID="Container5" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="选择工号TextField" runat="server" ReadOnly="true" DataIndex="TNo" Width="180" FieldLabel="工号" LabelAlign="Left" LabelWidth="40">
               </ext:TextField>
               <ext:TextField ID="选择姓名TextField" runat="server" DataIndex="TName" Width="180" FieldLabel="姓名" LabelAlign="Right" LabelWidth="60"></ext:TextField>
               
               <ext:DateField ID="选择出生DateField" runat="server" DataIndex="TBith" Width="180" FieldLabel="出生日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
               <ext:ComboBox ID="选择性别ComboBox" runat="server"  FieldLabel="性别" Width="180" DataIndex="TSex" LabelWidth="40" LabelAlign="Right" >
                <Items>
                 <ext:ListItem Text="男" />
                 <ext:ListItem Text="女" />
                </Items>
               </ext:ComboBox>
               <ext:ComboBox ID="选择民族ComboBox" runat="server" StoreID="民族Store" DataIndex="TNation" Width="120" FieldLabel="民族" LabelAlign="Right" LabelWidth="40" DisplayField="Nation" ValueField="Nation" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" Resizable="True">
               </ext:ComboBox>
               <ext:ComboBox  ID="选择院系ComboBox"   runat="server" StoreID="院系Store" DataIndex="TCollName" DisplayField="TCollName" ValueField="TCollName" Width="200" FieldLabel="院系"  LabelAlign="Right"  Editable="false"  TypeAhead="true"  Mode="Local" ForceSelection="true" TriggerAction="All" SelectOnFocus="true"  LabelWidth="40">       
               </ext:ComboBox> 
            </Items>
            </ext:Container>
            <ext:Container ID="Container6" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:ComboBox ID="选择面貌ComBox" runat="server"  DataIndex="TMianMao" Width="180" FieldLabel="面貌" LabelAlign="Left" LabelWidth="40">
                  <Items>
                   <ext:ListItem Text="党员" Value="党员" />
                   <ext:ListItem Text="团员" Value="团员" />
                   <ext:ListItem Text="群众" Value="群众" />
                   <ext:ListItem Text="预备党员" Value="预备党员" />
                   <ext:ListItem Text="无党派民主人士" Value="无党派民主人士" />
                  </Items>
              </ext:ComboBox>
               <ext:TextField ID="选择背景TextField" runat="server" DataIndex="TEduBack" Width="180" FieldLabel="教育背景" LabelAlign="Right" LabelWidth="60"></ext:TextField>
             <ext:TextField ID="选择籍贯TextField" runat="server" DataIndex="TJiGuan" Width="180" FieldLabel="籍贯" LabelAlign="Right" LabelWidth="60"></ext:TextField>
              <ext:TextField ID="选择邮箱TextField" runat="server" DataIndex="TEmail" Width="180" FieldLabel="邮箱" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              </Items>
            </ext:Container>
             </Items>
            </ext:Container>
           </Items>
           <Buttons>
             <ext:Button ID="保存Button" runat="server" Icon="Disk" Text="保存">
              <DirectEvents>
                  <Click OnEvent="保存Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="500" />              
                  </Click>
              </DirectEvents>
             </ext:Button>
             <ext:Button ID="取消Button" runat="server" Icon="Disk" Text="取消">
             <DirectEvents>
                  <Click OnEvent="取消Button_Click">    
                  </Click>
             </DirectEvents>
             </ext:Button>
           </Buttons>
         </ext:FormPanel>
       </South>
       </ext:BorderLayout>
      </Items>
      </ext:Viewport>
       
    </form>
</body>
</html>
