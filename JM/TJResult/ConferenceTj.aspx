<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConferenceTj.aspx.cs" Inherits="TJResult_ConferenceTj" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        /*var template1 = '<span >{0}</span>';
        var ChangeStr = function (value) {
        return String.format(template1, (value ==0) ? "待审核" : "通过", value);
        };*/
        var template2 = '<span style="color:{0};">{1}</span>';
        var ChangeStrColor = function (value) {
            return String.format(template2, (value == 0) ? "red" : "green", (value == 0) ? "待审核" : "通过");
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
     <asp:SqlDataSource ID="会议保存SqlDataSource" runat="server" 
      ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [CInfo] WHERE (([TNo] = @TNo) AND ([CType] = @CType))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="TNo" SessionField="TNo" 
                Type="String" />
            <asp:Parameter DefaultValue="1" Name="CType" Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>
     <ext:Store ID="会议Store" runat="server"  DataSourceID="会议保存SqlDataSource" UseIdConfirmation="true">
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
     <ext:Viewport ID="Viewport1" runat="server">
    <Items>
    <ext:BorderLayout ID="BorderLayout1" runat="server">
     <Center MarginsSummary="0 5 0 5">
      <ext:Panel ID="Panel2" runat="server" Height="500" Header="false" Layout="Fit">
      <Items>
       <ext:GridPanel ID="结果GridPanel" StoreID="会议Store" TrackMouseOver="true"  runat="server"  StripeRows="true" Height="500" AutoScroll="True" AutoWidth="True" Title="保存结果">
       <ColumnModel ID="ColumnModel1"  runat="server">
         <Columns>
          <ext:RowNumbererColumn ColumnID="Num1" Header="编号" Width="40"></ext:RowNumbererColumn>
          <ext:Column ColumnID="CName" Header="会议名称" DataIndex="CName" Width="80" />
          <ext:Column ColumnID="CPaperName" Header="论文名" DataIndex="CPaperName" Width="150">
          </ext:Column>
          <ext:Column ColumnID="CDeptName" Header="单位" DataIndex="CDeptName" Width="150" />
          <ext:DateColumn ColumnID="CBeginTime"  Header="会议开始日期" DataIndex="CBeginTime" Width="100"></ext:DateColumn>
          <ext:DateColumn ColumnID="CEndTime"  Header="会议结束日期" DataIndex="CEndTime" Width="100"></ext:DateColumn>
          <ext:DateColumn ColumnID="CAcceptTime"  Header="论文接收日期" DataIndex="CAcceptTime" Width="100"></ext:DateColumn>
          <ext:Column ColumnID="CFundName"  Header="基金号/名" DataIndex="CFundName" Width="150"></ext:Column>
          <ext:Column ColumnID="CPFirstName"  Header="第一作者" DataIndex="CPFirstName" Width="100"></ext:Column>
          <ext:Column ColumnID="CCanJia"  Header="参加人员" DataIndex="CCanJia" Width="150"></ext:Column>
          
          <ext:Column ColumnID="CPRank"  Header="级别" DataIndex="CPRank" Width="150"></ext:Column>
           <ext:Column ColumnID="CVType"  Header="是否通过审核" DataIndex="CVType" Width="150">
           <Renderer Fn="ChangeStrColor" />
          </ext:Column>
          </Columns>
          </ColumnModel>
          <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
           
            </ext:RowSelectionModel>
        </SelectionModel>
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
    </ext:GridPanel>
     </Items>
    </ext:Panel>
    
    </Center>
    </ext:BorderLayout>
    </Items>
    </ext:Viewport>
    </form>
</body>
</html>
