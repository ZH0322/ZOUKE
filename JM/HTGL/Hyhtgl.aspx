<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hyhtgl.aspx.cs" Inherits="HTGL_Hyhtgl" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script runat="server">
        protected void 会议Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {
            this.会议Store.DataBind();
        }
        </script>
        <style type="text/css">
        .lafloat
        {
            
            font-weight: bold;
            float:right;
            margin-left:10px;
            }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
   <ext:ResourceManager ID="ResourceManager1" runat="server" />
    
     <ext:Store ID="会议Store" runat="server"  OnRefreshData="会议Store_RefershData" UseIdConfirmation="true">
     <Reader>
      <ext:JsonReader IDProperty="CId">
       <Fields>
        <ext:RecordField Name="CId"></ext:RecordField>
        <ext:RecordField Name="CName" />
        <ext:RecordField Name="CPaperName" />
        <ext:RecordField Name="CDeptName" />
        <ext:RecordField Name="CBeginTime" Type="Date"></ext:RecordField>
        <ext:RecordField Name="CEndTime" Type="Date"></ext:RecordField>
        <ext:RecordField Name="CAcceptTime" Type="Date"></ext:RecordField>
        <ext:RecordField Name="CFundName" />
        <ext:RecordField Name="CPFirstName"  />
        <ext:RecordField Name="CPSecondName" />
        <ext:RecordField Name="CPJuanNo"/>
        <ext:RecordField Name="CCanJia" />
        <ext:RecordField Name="CPQiNo" />
        <ext:RecordField Name="CPYeNo" />
        <ext:RecordField Name="CPRank" />
        <ext:RecordField Name="CRemark" />
        <ext:RecordField Name="CType" />
        <ext:RecordField Name="CVType" />
       </Fields>
      </ext:JsonReader>
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
                  <ext:TextField ID="会议名称TextField" runat="server" FieldLabel="按会议名" Width="420"  LabelWidth="60" LabelAlign="Right">
                  </ext:TextField>
                  <ext:TextField ID="工号TextField" runat="server" FieldLabel="按工号" Width="150" LabelWidth="50" LabelAlign="Right">
                  </ext:TextField>
                  <ext:TextField ID="参与人TextField" runat="server" FieldLabel="按参与人" Width="200" LabelWidth="50" LabelAlign="Right">
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
        <ext:Panel ID="Panel2" runat="server" Height="300" Header="false" Layout="Fit">
         <Items>
           <ext:GridPanel ID="会议GridPanel" runat="server" StoreID="会议Store" StripeRows="true" Title="会议信息" Height="800" TrackMouseOver="true" AutoScroll="True" AutoWidth="True">
            <ColumnModel ID="ColumnModel1"  runat="server">
            <Columns>
          <ext:RowNumbererColumn ColumnID="Num1"></ext:RowNumbererColumn>
          <ext:Column ColumnID="CId"  DataIndex="CId" Hidden="true" />
           <ext:Column ColumnID="CName" Header="会议名" DataIndex="CName" Width="80">
           
            </ext:Column>
             <ext:Column ColumnID="CPaperName" Header="论文名" DataIndex="CPaperName" Width="80">
             
             </ext:Column>
             <ext:Column ColumnID="CDeptName" Header="单位" DataIndex="CDeptName" Width="80">
           
            </ext:Column>
              <ext:DateColumn ColumnID="CBeginTime" Header="会议开始日期" DataIndex="CBeginTime" Width="100" Format="yyyy-MM-dd">
             
              </ext:DateColumn>
              
              <ext:Column ColumnID="CEndTime" Header="会议结束日期" DataIndex="CEndTime" Width="100">
              
               </ext:Column>
               <ext:Column ColumnID="CAcceptTime" Header="接收日期" DataIndex="CAcceptTime" Width="100">
                
               </ext:Column>
               <ext:Column ColumnID="CFundName" Header="基金" DataIndex="CFundName" Width="80">
               
               </ext:Column>
               <ext:Column ColumnID="CPFirstName" Header="第一作者" DataIndex="CPFirstName" Width="140">
               
                </ext:Column>
                <ext:Column ColumnID="CPRank" Header="会议级别" DataIndex="CPRank" Width="100">
                              
                </ext:Column>
           
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
             <Listeners>
                <RowDeselect Handler="if (!#{会议GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                <RowSelect Handler="#{详情FormPanel}.getForm().loadRecord(record);" />
             </Listeners>
            </ext:RowSelectionModel>
        </SelectionModel>
        <LoadMask ShowMask="true" />
         <BottomBar>
           <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10" DisplayInfo="false" StoreID="会议Store">
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
            <ext:Container ID="Container4" runat="server" Layout="RowLayout" Height="320">
             <Items>
              <ext:Container ID="Container5" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:TextField ID="选择编号TextField" runat="server" Hidden="true" DataIndex="CId"  ></ext:TextField>
               <ext:TextField ID="选择会议TextField" runat="server" DataIndex="CName" Width="480" FieldLabel="会议名称" LabelAlign="Left" LabelWidth="60">
               </ext:TextField>
               <ext:TextField ID="选择论文TextField" runat="server" DataIndex="CPaperName" Width="480" FieldLabel="论文名" LabelAlign="Right" LabelWidth="60"></ext:TextField>
               
               
            </Items>
            </ext:Container>
            <ext:Container ID="Container6" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:ComboBox ID="选择单位ComboBox" runat="server" DataIndex="CDeptName" StoreID="院系Store" Width="200" LabelWidth="40" FieldLabel="单位*" LabelAlign="Left" DisplayField="TCollName" ValueField="TCollName" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" ></ext:ComboBox>
              <ext:DateField ID="选择开始DateField" runat="server" DataIndex="CBeginTime" Width="180" FieldLabel="开始日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
              <ext:DateField ID="选择结束DateField" runat="server" DataIndex="CEndTime" Width="180" FieldLabel="结束日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
              <ext:DateField ID="接收日期DateField" runat="server" DataIndex="CAcceptTime" Width="180" FieldLabel="接收日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
             <ext:TextField ID="选择基金TextField" runat="server" DataIndex="CFundName" Width="260" FieldLabel="基金号/名" LabelAlign="Right" LabelWidth="80"></ext:TextField>
             
             
              </Items>
            </ext:Container>
             <ext:Container ID="Container1" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:TextField ID="第一作者TextField" runat="server" DataIndex="CPFirstName" Width="200" FieldLabel="第一作者" LabelAlign="Left" LabelWidth="60"></ext:TextField>
              <ext:TextField ID="第二作者TextField" runat="server" DataIndex="CPSecondName" Width="180" FieldLabel="第二作者" LabelAlign="Right" LabelWidth="60"></ext:TextField>
              <ext:TextField ID="选择卷号TextField" runat="server" DataIndex="CPJuanNo" Width="100" FieldLabel="卷号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择期号TextField" runat="server" DataIndex="CPQiNo" Width="100" FieldLabel="期号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择页号TextField" runat="server" DataIndex="CPYeNo" Width="150" FieldLabel="页号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择参加TextField" runat="server" DataIndex="CCanJia" Width="300" FieldLabel="参加人员" LabelAlign="Right" LabelWidth="60"></ext:TextField>
            
              </Items>
              </ext:Container>
              <ext:Container ID="Container2" runat="server" Layout="TableLayout" Height="100">
              <Items>
                <ext:ComboBox ID="选择级别ComboBox" runat="server" Width="200" DataIndex="CPRank" FieldLabel="级别" LabelAlign="Left" LabelWidth="40">
                <Items>
                 <ext:ListItem Text="国外核心会议一级" />
                 <ext:ListItem Text="国内核心会议一级" />
                 <ext:ListItem Text="国外核心会议二级" />
                 <ext:ListItem Text="国内核心会议二级" />
                 <ext:ListItem Text="国外一般会议一级" />
                 <ext:ListItem Text="国内一般会议一级" />
                 <ext:ListItem Text="国外一般会议二级" />
                 <ext:ListItem Text="国内一般会议二级" />
                 <ext:ListItem Text="省级" />
                 <ext:ListItem Text="其它" />
                </Items>
               </ext:ComboBox>
                  <ext:TextArea ID="选择备注TextArea" runat="server" FieldLabel="备注" Width="800" LabelAlign="Left" LabelWidth="40" DataIndex="CRemark">
                  </ext:TextArea>
              </Items>
              </ext:Container>
             </Items>
            </ext:Container>
           </Items>
           <Buttons>
             <ext:Button ID="审核Button" runat="server" Icon="Disk" Text="提交审核">
              <DirectEvents>
                  <Click OnEvent="提交Button_Click">
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
              <ext:Button ID="取消选择Button" runat="server" Icon="Disk" Text="取消选择">
              <DirectEvents>
                  <Click OnEvent="取消选择Button_Click">
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
