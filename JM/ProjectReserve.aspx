<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectReserve.aspx.cs" Inherits="ProjectReserve" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Linq" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script runat="server">
     protected void TypeRefresh(object sender, StoreRefreshDataEventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Server.MapPath("Type.xml"));
            List<object> data = new List<object>();

            foreach (XmlNode profNode in xmlDoc.SelectNodes(string.Concat("XMTypes/xmtype[@code='", this.选择类型ComboBox.SelectedItem.Value, "']/type")))
            {
                string id = profNode.SelectSingleNode("id").InnerText;
                string name = profNode.SelectSingleNode("name").InnerText;

                data.Add(new { Id = id, Name = name });
            }
            this.类型Store.DataSource = data;

            this.类型Store.DataBind();
        }
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
            <asp:Parameter DefaultValue="0" Name="XType" Type="String" />
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
      <ext:Store runat="server" ID="类型Store" AutoLoad="false" OnRefreshData="TypeRefresh">
        <DirectEventConfig>
            <EventMask ShowMask="false" />
        </DirectEventConfig>
        <Reader>
            <ext:JsonReader IDProperty="Id">
                <Fields>
                    <ext:RecordField Name="id" Type="String" Mapping="Id" />
                    <ext:RecordField Name="name" Type="String" Mapping="Name" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <Listeners>
            <Load Handler="#{具体类型ComboBox}.setValue(#{具体类型ComboBox}.store.getAt(0).get('id'));" />
        </Listeners>
    </ext:Store>
    <ext:Viewport ID="Viewport1" runat="server">
    <Items>
    <ext:BorderLayout ID="BorderLayout1" runat="server">
     <Center MarginsSummary="0 5 0 5">
      <ext:Panel ID="Panel2" runat="server" Height="500" Header="false" Layout="Fit">
      <Items>
       <ext:GridPanel ID="结果GridPanel" StoreID="项目Store" TrackMouseOver="true"  runat="server"  StripeRows="true" Height="500" AutoScroll="True" AutoWidth="True" Title="保存结果">
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
      <South> 
        <ext:FormPanel ID="详情FormPanel" runat="server" ButtonAlign="Right" Padding="5" Height="240" Title="详情">
           <Items>
            <ext:Container ID="Container4" runat="server" Layout="RowLayout" Height="320">
             <Items>
              <ext:Container ID="Container5" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:TextField ID="选择编号TextField" runat="server" Hidden="true" DataIndex="XMId"  ></ext:TextField>
               <ext:TextField ID="选择名称TextField" runat="server" DataIndex="XMName" Width="480" FieldLabel="项目名称" LabelAlign="Left" LabelWidth="60">
               </ext:TextField>
               <ext:TextField ID="选择项目号TextField" runat="server" DataIndex="XMNo" Width="480" FieldLabel="项目号" LabelAlign="Left" LabelWidth="60">
               </ext:TextField>
              
            </Items>
            </ext:Container>
            <ext:Container ID="Container6" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:ComboBox ID="选择类型ComboBox" runat="server"  FieldLabel="项目类别" Width="160" DataIndex="XMType" LabelAlign="Left" LabelWidth="60" Editable="false"  TypeAhead="true"  Mode="Local" ForceSelection="true" TriggerAction="All" SelectOnFocus="true" >
                <Listeners>
                      <Select Handler="#{具体类型ComboBox}.clearValue(); #{类型Store}.reload();" />
                </Listeners>        
                <Items>
                    <ext:ListItem Text="横向项目" Value="HXXM" />
                    <ext:ListItem Text="纵向项目" Value="ZXXM" />
                 </Items>
               </ext:ComboBox>
               <ext:ComboBox ID="具体类型ComboBox" runat="server" Width="220" FieldLabel="具体类型" DataIndex="XMJtType" LabelAlign="Right" LabelWidth="60" StoreID="类型Store" TypeAhead="true" Mode="Local" ForceSelection="true" TriggerAction="All"  DisplayField="name" ValueField="id"  />

              <ext:DateField ID="选择立项日期DateField" runat="server" DataIndex="XMBegin" Width="180" FieldLabel="立项日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
              <ext:DateField ID="选择结题DateField" runat="server" DataIndex="XMEnd" Width="180" FieldLabel="结题日期" LabelAlign="Right" LabelWidth="60"></ext:DateField>
              <ext:ComboBox ID="选择单位ComboBox" runat="server" DataIndex="XMDeptName" StoreID="院系Store" Width="220" LabelWidth="50" FieldLabel="单位*" LabelAlign="Right" DisplayField="CName" ValueField="CName" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" ></ext:ComboBox>
              
             
              
              </Items>
            </ext:Container>
             <ext:Container ID="Container1" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:TextField ID="选择负责人TextField" runat="server" DataIndex="XMFzr" Width="160" FieldLabel="负责人" LabelAlign="Left" LabelWidth="60"></ext:TextField>
             <ext:TextField ID="选择金额TextField" runat="server" DataIndex="XMMoney" Width="180" FieldLabel="项目金额" LabelAlign="Right" LabelWidth="60"></ext:TextField>
                  <ext:Label ID="Label1" runat="server" Text="万元">
                  </ext:Label>
              <ext:TextField ID="选择资助单位TextField" runat="server" DataIndex="XMFundDept" Width="340" FieldLabel="资助单位" LabelAlign="Right" LabelWidth="70"></ext:TextField>
              </Items>
              </ext:Container>
              <ext:Container ID="Container2" runat="server" Layout="TableLayout" Height="100">
              <Items>
                  <ext:TextArea ID="选择备注TextArea" runat="server" FieldLabel="备注" Width="960" LabelAlign="Left" LabelWidth="60" DataIndex="XMRemark">
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
