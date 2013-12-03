<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectMag.aspx.cs" Inherits="ProjectMag" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Linq" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script runat="server">
        private string insertedValue;
        public void sel()
        {
            DBHelp db = new DBHelp();
            SqlConnection mycon = db.MyCon;
            mycon.Open();
            SqlCommand mycmd = mycon.CreateCommand();
            string selstr = "select * from XPInfo where XPXMNo='" + 编号TextField.Text + "'";
            mycmd.CommandText = selstr;
            SqlDataReader myreader = mycmd.ExecuteReader();

            参与人Store.DataSourceID = "";
            参与人Store.DataSource = myreader;
            参与人Store.DataBind(); 
        }
        protected void 参与人Store_BeforeRecordInserted(object sender, BeforeRecordInsertedEventArgs e)
        {
            参与人SqlDataSource.InsertParameters["XNo"].DefaultValue = 编号TextField.Text;
         }
        
        protected void 参与人Store_AfterRecordInserted(object sender, AfterRecordInsertedEventArgs e)
        {
            //The deleted and updated records confirms automatic (depending AffectedRows field)
            //But you can override this in AfterRecordUpdated and AfterRecordDeleted event
            //For insert we should set new id for refresh on client
            //If we don't set new id then old id will be used
            if (e.Confirmation.Confirm && !string.IsNullOrEmpty(insertedValue))
            {
                e.Confirmation.ConfirmRecord(insertedValue);
                insertedValue = "";
            }
            sel();
        }
        protected void 参与人Store_AfterRecordDeleted(object sender, AfterRecordDeletedEventArgs e)
        {
            if (e.Confirmation.Confirm && !string.IsNullOrEmpty(insertedValue))
            {
                e.Confirmation.ConfirmRecord(insertedValue);
                insertedValue = "";
            }
            sel();
        }
        protected void 参与人SqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //use e.AffectedRows for ensure success action. The store read this value and set predefined Confirm depend on e.AffectedRows
            //The Confirm can be granted or denied in OnRecord....ed event
            insertedValue = e.Command.Parameters["@newId"].Value != null
                                ? e.Command.Parameters["@newId"].Value.ToString()
                                : "";
            
        }
        protected void 选择结果Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {
            
            this.院系Store.DataBind();
        }
        protected void 参与人Store_RefershData(object sender, StoreRefreshDataEventArgs e)
        {

            this.参与人Store.DataBind();
        }
        protected void TypeRefresh(object sender, StoreRefreshDataEventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Server.MapPath("Type.xml"));
            List<object> data = new List<object>();

            foreach (XmlNode profNode in xmlDoc.SelectNodes(string.Concat("XMTypes/xmtype[@code='", this.项目类别ComboBox.SelectedItem.Value, "']/type")))
            {
                string id = profNode.SelectSingleNode("id").InnerText;
                string name = profNode.SelectSingleNode("name").InnerText;

                data.Add(new { Id = id, Name = name });
            }
            this.类型Store.DataSource = data;

            this.类型Store.DataBind();
        }
        protected void TextChange(object sender,EventArgs e)
        {
            TextField5.Text = 编号TextField.Text;
            
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
    <asp:SqlDataSource ID="参与人SqlDataSource" runat="server" 
         ConnectionString="<%$ ConnectionStrings:JMConnectionString2 %>" 
         DeleteCommand="delete from XPInfo where (XPId = @XPId);" 
         InsertCommand="INSERT INTO XPInfo(XPNo, XPName, XPDeptName, XPEduBack, XPXMNo) VALUES (@XPNo, @XPName, @XPDeptName, @XPEduBack, @XNo);" 
          OnInserted="参与人SqlDataSource_Inserted" 
        SelectCommand="select * from XPInfo where (XPXMNo=@XPXMNo);">
        <DeleteParameters>
            <asp:Parameter Name="XPId" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="XPNo" />
            <asp:Parameter Name="XPName" />
            <asp:Parameter Name="XPDeptName" />
            <asp:Parameter Name="XPEduBack" />
            <asp:Parameter Name="XNo" />
            <asp:Parameter Direction="Output" Name="newId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter   Name="XPXMNo" />
        </SelectParameters>
     </asp:SqlDataSource>
     <ext:Store ID="参与人Store" runat="server" DataSourceID="参与人SqlDataSource" OnBeforeRecordInserted="参与人Store_BeforeRecordInserted" UseIdConfirmation="true" OnAfterRecordDeleted="参与人Store_AfterRecordDeleted" OnAfterRecordInserted="参与人Store_AfterRecordInserted" OnRefreshData="参与人Store_RefershData">
     <Reader>
      <ext:JsonReader IDProperty="XPId">
       <Fields>
        <ext:RecordField Name="XPId"></ext:RecordField>
        <ext:RecordField Name="XPNo" />
        <ext:RecordField Name="XPName" />
        <ext:RecordField Name="XPDeptName" />
        <ext:RecordField Name="XPEduBack" />
        <ext:RecordField Name="XPXMNo" />
       </Fields>
      </ext:JsonReader>
     </Reader>
     <Listeners>
          <LoadException Handler="Ext.Msg.alert('参与人 - Load failed', e.message || e);" />
          <CommitFailed Handler="Ext.Msg.alert('参与人 - Commit failed', 'Reason: ' + msg);" />
          <SaveException Handler="Ext.Msg.alert('参与人 - Save failed', e.message || e);" />
          <CommitDone Handler="Ext.Msg.alert('参与人 - Commit', 'The data successfully saved');" />
     </Listeners> 
     </ext:Store>
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
      <ext:FormPanel ID="项目管理FormPanel" runat="server" ButtonAlign="Right"  Height="700" Padding="5"
        Title="项目录入">
        <Items>
             <ext:Container ID="Container1" runat="server" Layout="RowLayout" Height="680">
             <Items>
                  <ext:TextField ID="名称TextField" runat="server"  Width="800" FieldLabel="项目名称*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
                  <ext:TextField ID="编号TextField" runat="server"  OnDirectChange="TextChange" Width="800" FieldLabel="项目编号*" LabelAlign="Left" LabelWidth="60">
                   
                  </ext:TextField>
                  <ext:Container ID="Container12" runat="server" Layout="TableLayout" Height="30">
                  <Items>
                      <ext:ComboBox ID="项目类别ComboBox" runat="server" Width="220" FieldLabel="项目类别" LabelAlign="Left" LabelWidth="60" Editable="false"  TypeAhead="true"  Mode="Local" ForceSelection="true" TriggerAction="All" SelectOnFocus="true">
                      <Listeners>
                           <Select Handler="#{具体类型ComboBox}.clearValue(); #{类型Store}.reload();" />
                      </Listeners>        
                      <Items>
                         <ext:ListItem Text="横向项目" Value="HXXM" />
                         <ext:ListItem Text="纵向项目" Value="ZXXM" />
                      </Items>
                      </ext:ComboBox>
                      <ext:ComboBox ID="具体类型ComboBox" runat="server" Width="220" FieldLabel="具体类型" LabelAlign="Right" LabelWidth="60" StoreID="类型Store" TypeAhead="true" Mode="Local" ForceSelection="true" TriggerAction="All"  DisplayField="name" ValueField="id" ValueNotFoundText="Loading..." />
                      <ext:DateField ID="立项日期DateField" runat="server"  Width="220" FieldLabel="立项日期*" LabelAlign="Right" LabelWidth="100"></ext:DateField>
                      
                      <ext:TextField ID="负责人TextField" runat="server"  Width="180" FieldLabel="负责人*" LabelAlign="Right" LabelWidth="60">
                       
                      </ext:TextField>
                      
                      <ext:DateField ID="结题时间DateField" runat="server"  Width="200" FieldLabel="结题时间*" LabelAlign="Right" LabelWidth="60">
                      
                      </ext:DateField>
                      
                 </Items>
                 </ext:Container>
                 <ext:Container ID="Container13" runat="server" Height="300">
                 <Items>
                      <ext:Container ID="Container131" runat="server" Layout="TableLayout" Height="30">
                      <Items>
                           <ext:ComboBox ID="单位ComboBox" runat="server" StoreID="院系Store" Width="260" LabelWidth="80" FieldLabel="负责人单位*" LabelAlign="Left" DisplayField="CName" ValueField="CName" SelectedIndex="19" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" ></ext:ComboBox>
                           <ext:TextField ID="项目金额TextField" runat="server" Height="30"  Width="220" FieldLabel="项目金额*" LabelAlign="Right" LabelWidth="60"></ext:TextField>   
                           <ext:TextField ID="资助单位TextField" runat="server" Height="30"  Width="380" FieldLabel="资助单位*" LabelAlign="Right" LabelWidth="100"></ext:TextField>                    
                      </Items>
                      </ext:Container>
                    
                     <ext:Panel ID="Panel1" runat="server" Height="360" Title="Title" Header="false" Layout="Fit" >
                     <Items>
                          <ext:GridPanel ID="参与人GridPanel" runat="server" Height="350" Title="参与人" StoreID="参与人Store" Width="800" CtCls="paneltop" StripeRows="true"  TrackMouseOver="true" AutoScroll="True" AutoWidth="True">
                            <ColumnModel ID="ColumnModel1"  runat="server">
                            <Columns>
                            <ext:RowNumbererColumn ColumnID="Num1" Header="编号" Width="80"></ext:RowNumbererColumn>
                            <ext:Column ColumnID="XPId" Hidden="true" DataIndex="XPId"></ext:Column>
                            <ext:Column ColumnID="XPNo" Header="参与人工号" DataIndex="XPNo" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField1" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="XPName" Header="姓名" DataIndex="XPName" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField4" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="XPDeptName" Header="单位" DataIndex="XPDeptName" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField2" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="XPEduBack" Header="教育背景" DataIndex="XPEduBack" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField3" runat="server"></ext:TextField>
                            </Editor>
                            </ext:Column>
                             <ext:Column ColumnID="XPXMNo"  Header="项目编号" DataIndex="XPXMNo" Width="200">
                            <Editor>
                                <ext:TextField ID="TextField5" ReadOnly="true" runat="server">
                                </ext:TextField>
                            </Editor>
                            </ext:Column>
                            </Columns>
                            </ColumnModel>
                             <SelectionModel>
                                        <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" />
                                    </SelectionModel>
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
                            <Click Handler="#{参与人GridPanel}.save();"  />
                        </Listeners>
                        
                        </ext:Button>
                        <ext:Button ID="btnDelete" runat="server"  Text="删除" Icon="Delete">
                        <Listeners>
                            <Click Handler="#{参与人GridPanel}.deleteSelected();#{参与人GridPanel}.save();if (#{参与人GridPanel}.hasSelection()) {#{btnDelete}.disable();}" />
                        </Listeners>
                        </ext:Button>
                         <ext:Button ID="查看已添加Button" runat="server"  Text="已添加参与人" Icon="Add">
                           <DirectEvents>
                                <Click OnEvent="已添加参与人Button_Click"></Click>
                           </DirectEvents>
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
              <Listeners>
               <Click Handler="#{参与人GridPanel}.reload();" />
              </Listeners>
            </ext:Button>
             <ext:Button ID="提交Button" runat="server" Icon="Disk" Text="提交">
             <DirectEvents>
                  <Click OnEvent="提交Button_Click"></Click>
              </DirectEvents>
            </ext:Button>
             
        </Buttons>
          
    </ext:FormPanel>
    </form>
</body>
</html>
