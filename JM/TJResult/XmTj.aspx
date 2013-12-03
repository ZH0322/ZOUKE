<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XmTj.aspx.cs" Inherits="TJResult_XmTj" %>
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
     <asp:SqlDataSource ID="项目保存SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [XMInfo] WHERE (([TNo] = @TNo) AND ([XType] = @XType))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="TNo" SessionField="TNo" 
                Type="String" />
            <asp:Parameter DefaultValue="1" Name="XType" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     <ext:Store ID="项目Store" runat="server"  DataSourceID="项目保存SqlDataSource" UseIdConfirmation="true">
     <Reader>
      <ext:JsonReader IDProperty="XMId">
       <Fields>
        <ext:RecordField Name="XMId"></ext:RecordField>
        <ext:RecordField Name="XMName" />
        <ext:RecordField Name="XMNo" />
        <ext:RecordField Name="XMType" />
        <ext:RecordField Name="XMJtType" />
        <ext:RecordField Name="XMBegin" Type="Date"></ext:RecordField>
        <ext:RecordField Name="XMFzr" />
        <ext:RecordField Name="XMDeptName" />
        <ext:RecordField Name="XMEnd" Type="Date"></ext:RecordField>
        <ext:RecordField Name="XMMoney" />
        <ext:RecordField Name="XMFundDept"  />
        <ext:RecordField Name="XMRemark"/>
        <ext:RecordField Name="XType" />
        <ext:RecordField Name="XVType" />
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
       <ext:GridPanel ID="结果GridPanel" StoreID="项目Store" TrackMouseOver="true"  runat="server"  StripeRows="true" Height="500" AutoScroll="True" AutoWidth="True" Title="提交结果">
       <ColumnModel ID="ColumnModel1"  runat="server">
         <Columns>
          <ext:RowNumbererColumn ColumnID="Num1" Header="编号" Width="40"></ext:RowNumbererColumn>
          <ext:Column ColumnID="XMName" Header="项目名称" DataIndex="XMName" Width="80" />
          <ext:Column ColumnID="XMNo" Header="项目编号" DataIndex="XMNo" Width="150">
          </ext:Column>
          <ext:Column ColumnID="XMType" Header="项目类型" DataIndex="XMType" Width="150" />
          <ext:Column ColumnID="XMJtType"  Header="具体类型" DataIndex="XMJtType" Width="100"></ext:Column>
          <ext:DateColumn ColumnID="XMEnd"  Header="结题日期" DataIndex="XMEnd" Width="100"></ext:DateColumn>
          <ext:DateColumn ColumnID="XMBegin"  Header="立项日期" DataIndex="XMBegin" Width="100"></ext:DateColumn>
          <ext:Column ColumnID="XMFzr"  Header="负责人" DataIndex="XMFzr" Width="150"></ext:Column>
          <ext:Column ColumnID="XMMoney"  Header="项目金额" DataIndex="XMMoney" Width="100"></ext:Column>
          <ext:Column ColumnID="XVType"  Header="是否通过审核" DataIndex="XVType" Width="150">
           <Renderer Fn="ChangeStrColor" />
          </ext:Column>
          </Columns>
          </ColumnModel>
           <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true">
            </ext:RowSelectionModel>
          </SelectionModel>
          <BottomBar>
          <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10" DisplayInfo="false" StoreID="项目Store">
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
