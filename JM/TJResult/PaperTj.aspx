<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperTj.aspx.cs" Inherits="TJResult_PaperTj" %>
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
    <asp:SqlDataSource ID="论文保存SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:JMConnectionString %>" 
        SelectCommand="SELECT * FROM [PaperInfo] WHERE (([TNo] = @TNo) AND ([PType] = @PType))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="TNo" SessionField="TNo" 
                Type="String" />
            <asp:Parameter DefaultValue="1" Name="PType" Type="String" />
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
         <ext:RecordField Name="PVType" />
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
       <ext:GridPanel ID="结果GridPanel" StoreID="论文Store" TrackMouseOver="true"  runat="server"  StripeRows="true" Height="500" AutoScroll="True" AutoWidth="True" Title="提交结果">
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
          <ext:Column ColumnID="PVType"  Header="是否通过审核" DataIndex="PVType" Width="150">
           <Renderer Fn="ChangeStrColor" />
          </ext:Column>
          </Columns>
          </ColumnModel>
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
    </ext:BorderLayout>
    </Items>
    
    </ext:Viewport>
    </form>
</body>
</html>
