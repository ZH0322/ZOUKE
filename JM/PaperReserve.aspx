<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperReserve.aspx.cs" Inherits="PaperReserve" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <asp:SqlDataSource ID="论文保存SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [PaperInfo] WHERE (([TNo] = @TNo) AND ([PType] = @PType))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="TNo" SessionField="TNo" 
                Type="String" />
            <asp:Parameter DefaultValue="0" Name="PType" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     <ext:Store ID="论文Store" runat="server"  DataSourceID="论文保存SqlDataSource" UseIdConfirmation="true">
     <Reader>
      <ext:JsonReader IDProperty="PName">
       <Fields>
        <ext:RecordField Name="PId"></ext:RecordField>
        <ext:RecordField Name="PName" />
        <ext:RecordField Name="PJName" />
        <ext:RecordField Name="PFirstName" />
        <ext:RecordField Name="PSecondName" />
        <ext:RecordField Name="PAcceptTime" Type="Date"></ext:RecordField>
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
     </ext:Store>
      <asp:SqlDataSource ID="院系SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [ColInfo]"></asp:SqlDataSource>
    <ext:Store ID="院系Store" runat="server" DataSourceID="院系SqlDataSource" UseIdConfirmation="true">
     <Reader>
      <ext:JsonReader IDProperty="CId">
       <Fields>
        <ext:RecordField Name="CId"></ext:RecordField>
        <ext:RecordField Name="CName" />
       </Fields>
      </ext:JsonReader>
     </Reader>
     </ext:Store>
    <ext:Viewport ID="Viewport1" runat="server">
    <Items>
    <ext:BorderLayout ID="BorderLayout1" runat="server">
     <Center MarginsSummary="0 5 0 5">
      <ext:Panel ID="Panel2" runat="server" Height="500" Header="false" Layout="Fit">
      <Items>
       <ext:GridPanel ID="结果GridPanel" StoreID="论文Store" TrackMouseOver="true"  runat="server"  StripeRows="true" Height="500" AutoScroll="True" AutoWidth="True" Title="保存结果">
       <ColumnModel ID="ColumnModel1"  runat="server">
         <Columns>
          <ext:RowNumbererColumn ColumnID="Num1" Header="编号" Width="40"></ext:RowNumbererColumn>
          <ext:Column ColumnID="PName" Header="题目" DataIndex="PName" Width="80" />
          <ext:Column ColumnID="PJName" Header="期刊名" DataIndex="PJName" Width="150">
          </ext:Column>
          <ext:Column ColumnID="PFirstName" Header="第一作者" DataIndex="PFirstName" Width="150" />
          <ext:Column ColumnID="SSecondName"  Header="第二作者" DataIndex="PSecondName" Width="100"></ext:Column>
          <ext:Column ColumnID="PDeptName"  Header="单位" DataIndex="PDeptName" Width="150"></ext:Column>
          <ext:DateColumn ColumnID="PAcceptTime"  Header="接收日期" DataIndex="PAcceptTime" Width="100"></ext:DateColumn>
          <ext:Column ColumnID="PFundName"  Header="基金号/名" DataIndex="PFundName" Width="150"></ext:Column>
          <ext:Column ColumnID="PJuanNo"  Header="卷号" DataIndex="PJuanNo" Width="50"></ext:Column>
          <ext:Column ColumnID="PQiNo"  Header="期号" DataIndex="PQiNo" Width="50"></ext:Column>
          <ext:Column ColumnID="PYeNo"  Header="页号" DataIndex="PYeNo" Width="80"></ext:Column>
          <ext:Column ColumnID="PRank"  Header="级别" DataIndex="PRank" Width="150"></ext:Column>
          
          </Columns>
          </ColumnModel>
          <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
            <Listeners>
                <RowDeselect Handler="if (!#{结果GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                <RowSelect Handler="#{详情FormPanel}.getForm().loadRecord(record);" />
             </Listeners>
            </ext:RowSelectionModel>
        </SelectionModel>
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
              <ext:TextField ID="选择编号TextField" runat="server" Hidden="true" DataIndex="PId"  ></ext:TextField>
               <ext:TextField ID="选择题目TextField" runat="server" DataIndex="PName" Width="480" FieldLabel="题目" LabelAlign="Left" LabelWidth="40">
               </ext:TextField>
               <ext:TextField ID="选择期刊TextField" runat="server" DataIndex="PJName" Width="480" FieldLabel="期刊名" LabelAlign="Right" LabelWidth="60"></ext:TextField>
               
               
            </Items>
            </ext:Container>
            <ext:Container ID="Container6" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:ComboBox ID="选择单位ComboBox" runat="server" DataIndex="PDeptName" StoreID="院系Store" Width="200" LabelWidth="40" FieldLabel="单位*" LabelAlign="Left" DisplayField="CName" ValueField="CName" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" ></ext:ComboBox>
              <ext:DateField ID="接收日期DateField" runat="server" DataIndex="PAcceptTime" Width="180" FieldLabel="接收日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
             <ext:TextField ID="选择基金TextField" runat="server" DataIndex="PFundName" Width="260" FieldLabel="基金号/名" LabelAlign="Right" LabelWidth="80"></ext:TextField>
             <ext:TextField ID="选择卷号TextField" runat="server" DataIndex="PJuanNo" Width="100" FieldLabel="卷号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择期号TextField" runat="server" DataIndex="PQiNo" Width="100" FieldLabel="期号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              <ext:TextField ID="选择页号TextField" runat="server" DataIndex="PYeNo" Width="150" FieldLabel="页号" LabelAlign="Right" LabelWidth="40"></ext:TextField>
              </Items>
            </ext:Container>
             <ext:Container ID="Container1" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="第一作者TextField" runat="server" DataIndex="PFirstName" Width="180" FieldLabel="第一作者" LabelAlign="Left" LabelWidth="60"></ext:TextField>
                <ext:TextField ID="第二作者TextField" runat="server" DataIndex="PSecondName" Width="180" FieldLabel="第二作者" LabelAlign="Right" LabelWidth="60"></ext:TextField>
                <ext:ComboBox ID="选择级别ComboBox" runat="server" Width="200" DataIndex="PRank" FieldLabel="级别" LabelAlign="Left" LabelWidth="40">
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
              </Items>
              </ext:Container>
              <ext:Container ID="Container2" runat="server" Layout="TableLayout" Height="100">
              <Items>
                  <ext:TextArea ID="选择备注TextArea" runat="server" FieldLabel="备注" Width="800" LabelAlign="Left" LabelWidth="40" DataIndex="PRemark">
                  </ext:TextArea>
              </Items>
              </ext:Container>
             </Items>
            </ext:Container>
           </Items>
           <Buttons>
             <ext:Button ID="提交Button" runat="server" Icon="Disk" Text="提交">
              <DirectEvents>
                  <Click OnEvent="提交Button_Click">
                     <EventMask ShowMask="true" Msg="Verifying..." MinDelay="200" />              
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
