<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lwhtgl.aspx.cs" Inherits="HTGL_Lwhtgl" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script runat="server">
        protected void 论文Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {
            this.论文Store.DataBind();
        }
        </script>
        <style type="text/css">
        .lafloat
        {
            
            font-weight: bold;
            float:right;
            margin-left:20px;
            }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
   <ext:ResourceManager ID="ResourceManager1" runat="server" />
   
     <ext:Store ID="论文Store" runat="server"  UseIdConfirmation="true"  OnRefreshData="论文Store_RefershData">
     <Reader>
      <ext:JsonReader IDProperty="PId">
       <Fields>
        <ext:RecordField Name="PId"></ext:RecordField>
        <ext:RecordField Name="PName" />
        <ext:RecordField Name="TNo"></ext:RecordField>
        <ext:RecordField Name="PJName" />
        <ext:RecordField Name="PFirstName" />
        <ext:RecordField Name="PSecondName"></ext:RecordField>
        <ext:RecordField Name="PAcceptTime" Type="Date" />
        <ext:RecordField Name="PFundName" />
        <ext:RecordField Name="PJuanNo"  />
        <ext:RecordField Name="PQiNo"/>
        <ext:RecordField Name="PDeptName" />
        <ext:RecordField Name="PYeNo" />
        <ext:RecordField Name="PRank" />
        <ext:RecordField Name="PRemark" />
       </Fields>
      </ext:JsonReader>
     </Reader>
     <Listeners>
       <LoadException Handler="Ext.Msg.alert('Paper - Load failed', e.message || e);" />
       <CommitFailed Handler="Ext.Msg.alert('Paper - Commit failed', 'Reason: ' + msg);" />
       <SaveException Handler="Ext.Msg.alert('Paper - Save failed', e.message || e);" />
       <CommitDone Handler="Ext.Msg.alert('Paper - Commit', 'The data successfully saved');" />
     </Listeners>    
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
                  <ext:TextField ID="题名TextField" runat="server" FieldLabel="按题名" Width="150"  LabelWidth="60" LabelAlign="Right">
                  </ext:TextField>
                  <ext:TextField ID="工号TextField" runat="server" FieldLabel="按工号" Width="150" LabelWidth="50" LabelAlign="Right">
                  </ext:TextField>
                  <ext:TextField ID="作者TextField" runat="server" FieldLabel="按作者" Width="150" LabelWidth="50" LabelAlign="Right">
                  </ext:TextField>
                  <ext:Button runat="server" ID="查询Button" StandOut="true" CtCls="lafloat" Text="未审核查询" Icon="ArrowRefresh" Split="True">
                  <DirectEvents>
                    <Click OnEvent="未审核查询Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="500" />              
                    </Click>
                 </DirectEvents>
                 </ext:Button> 
                  <ext:Button runat="server" ID="已审核Button" StandOut="true" CtCls="lafloat" Text="已审核查询" Icon="ArrowRefresh" >
                  <DirectEvents>
                    <Click OnEvent="已审核查询Button_Click">
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
        <ext:Panel ID="Panel2" runat="server" Height="500" Header="false" Layout="Fit">
         <Items>
           <ext:GridPanel ID="论文GridPanel" runat="server" StoreID="论文Store" StripeRows="true" Title="论文信息" Height="500" TrackMouseOver="true" AutoScroll="True" AutoWidth="True">
            <ColumnModel ID="ColumnModel1"  runat="server">
            <Columns>
          <ext:RowNumbererColumn ColumnID="Num1"></ext:RowNumbererColumn>
          <ext:Column ColumnID="PId" DataIndex="PId" Hidden="true"></ext:Column>
          <ext:Column ColumnID="PName" Header="题名" DataIndex="PName" Width="150" />
           <ext:Column ColumnID="PJName" Header="期刊名" DataIndex="PJName" Width="150">
           
            </ext:Column>
             <ext:Column ColumnID="PFirstName" Header="第一作者" DataIndex="PFirstName" Width="80">
             
             </ext:Column>
             <ext:Column ColumnID="PSecondName" Header="第二作者" DataIndex="PSecondName" Width="80">
           
            </ext:Column>
              <ext:DateColumn ColumnID="PAcceptTime" Header="接收日期" DataIndex="PAcceptTime" Width="80" Format="yyyy-MM-dd">
              </ext:DateColumn>
              
              <ext:Column ColumnID="PFundName" Header="基金" DataIndex="PFundName" Width="100">
               </ext:Column>
               <ext:Column ColumnID="PJuanNo" Header="卷号" DataIndex="PJuanNo" Width="50">
                
               </ext:Column>
               <ext:Column ColumnID="PQiNo" Header="期号" DataIndex="PQiNo" Width="50">
               
               </ext:Column>
               <ext:Column ColumnID="PDeptName" Header="单位" DataIndex="PDeptName" Width="140">
               
                </ext:Column>
                <ext:Column ColumnID="PYeNo" Header="页码" DataIndex="PYeNo" Width="60">
                              
                </ext:Column>
                <ext:Column ColumnID="PRank" Header="级别" DataIndex="PRank" Width="120">
                </ext:Column>
                
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
             <Listeners>
                <RowDeselect Handler="if (!#{论文GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                <RowSelect Handler="#{详情FormPanel}.getForm().loadRecord(record);" />
             </Listeners>
            </ext:RowSelectionModel>
        </SelectionModel>
        <LoadMask ShowMask="true" />
         <BottomBar>
           <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10" DisplayInfo="false" StoreID="论文Store">
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
        <ext:FormPanel ID="详情FormPanel" runat="server" ButtonAlign="Right" Padding="5" Height="240" Title="详情">
           <Items>
            <ext:Container ID="Container4" runat="server" Layout="RowLayout" Height="240">
             <Items>
              <ext:Container ID="Container5" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:TextField ID="选择编号TextField"  runat="server" ReadOnly="true" Hidden="true" DataIndex="PId"  ></ext:TextField>
               
               <ext:TextField ID="选择题目TextField" runat="server" ReadOnly="true" DataIndex="PName" Width="500" FieldLabel="题目" LabelAlign="Left" LabelWidth="60">
               </ext:TextField>
               <ext:TextField ID="选择期刊TextField" runat="server" ReadOnly="true" DataIndex="PJName" Width="480" FieldLabel="期刊名" LabelAlign="Right" LabelWidth="60"></ext:TextField>
               
               
            </Items>
            </ext:Container>
            <ext:Container ID="Container6" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:ComboBox ID="选择单位ComboBox" runat="server" ReadOnly="true" DataIndex="PDeptName" StoreID="院系Store" Width="220" LabelWidth="60" FieldLabel="单位*" LabelAlign="Left" DisplayField="TCollName" ValueField="TCollName" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" ></ext:ComboBox>
              <ext:DateField ID="接收日期DateField" runat="server" ReadOnly="true" DataIndex="PAcceptTime" Width="200" FieldLabel="接收日期" LabelAlign="Right" LabelWidth="80"></ext:DateField>
             <ext:TextField ID="选择基金TextField" runat="server" ReadOnly="true" DataIndex="PFundName" Width="260" FieldLabel="基金号/名" LabelAlign="Right" LabelWidth="80"></ext:TextField>
             <ext:TextField ID="选择卷号TextField" runat="server" ReadOnly="true" DataIndex="PJuanNo" Width="100" FieldLabel="卷号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择期号TextField" runat="server" ReadOnly="true" DataIndex="PQiNo" Width="100" FieldLabel="期号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择页号TextField" runat="server" ReadOnly="true" DataIndex="PYeNo" Width="150" FieldLabel="页号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              </Items>
            </ext:Container>
             <ext:Container ID="Container1" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="第一作者TextField" runat="server" ReadOnly="true" DataIndex="PFirstName" Width="220" FieldLabel="第一作者" LabelAlign="Left" LabelWidth="60"></ext:TextField>
                <ext:TextField ID="第二作者TextField" runat="server" ReadOnly="true" DataIndex="PSecondName" Width="200" FieldLabel="第二作者" LabelAlign="Right" LabelWidth="80"></ext:TextField>
                <ext:ComboBox ID="选择级别ComboBox" runat="server" ReadOnly="true" Width="260" DataIndex="PRank" FieldLabel="级别" LabelAlign="Right" LabelWidth="80">
                <Items>
                 <ext:ListItem Text="国外核心期刊一级" />
                 <ext:ListItem Text="国内核心期刊一级" />
                 <ext:ListItem Text="国外核心期刊二级" />
                 <ext:ListItem Text="国内核心期刊二级" />
                 <ext:ListItem Text="国外一般期刊一级" />
                 <ext:ListItem Text="国内一般期刊一级" />
                 <ext:ListItem Text="国外一般期刊二级" />
                 <ext:ListItem Text="国内一般期刊二级" />
                 <ext:ListItem Text="省级" />
                 <ext:ListItem Text="其它" />
                </Items>
               </ext:ComboBox>
               <ext:TextField ID="选择工号TextField" runat="server" DataIndex="TNo" Width="200" FieldLabel="作者工号" LabelAlign="Right" LabelWidth="60"></ext:TextField>
              </Items>
              </ext:Container>
              <ext:Container ID="Container2" runat="server" Layout="TableLayout" Height="100">
              <Items>
                  <ext:TextArea ID="选择备注TextArea" runat="server" ReadOnly="true" FieldLabel="备注" Width="800" LabelAlign="Left" LabelWidth="40" DataIndex="PRemark">
                  </ext:TextArea>
              </Items>
              </ext:Container>
             </Items>
            </ext:Container>
           </Items>
           <Buttons>
             <ext:Button ID="审核Button" runat="server" Icon="Disk" Text="提交审核">
              <DirectEvents>
                  <Click OnEvent="审核提交Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="200" />              
                  </Click>
              </DirectEvents>
             </ext:Button>
              <ext:Button ID="撤销审核Button" runat="server" Icon="Disk" Text="撤销审核">
              <DirectEvents>
                  <Click OnEvent="撤销审核Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="200" />              
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
