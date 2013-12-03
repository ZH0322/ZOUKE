<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TecInfo.aspx.cs" Inherits="TecInfo" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
     <ext:Store ID="民族Store" runat="server">
     <Reader>
      <ext:ArrayReader>
       <Fields>
        <ext:RecordField Name="Nation"></ext:RecordField>
       </Fields>
      </ext:ArrayReader>
     </Reader>
    </ext:Store>
     <ext:FormPanel ID="详情FormPanel" runat="server" ButtonAlign="Right" Padding="5" Height="200" Title="人员详细信息">
         <Items>
            <ext:Container ID="Container1" runat="server" Layout="RowLayout" Height="180">
             <Items>
              <ext:Container ID="Container11" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="教工号TextField" runat="server"   Width="180" FieldLabel="教工号" LabelAlign="Left" LabelWidth="60">
               </ext:TextField>
               <ext:TextField ID="教师姓名TextField" runat="server"   Width="260" FieldLabel="姓名" LabelAlign="Right" LabelWidth="100"></ext:TextField>
               <ext:ComboBox ID="性别ComboBox" runat="server"   Width="260" FieldLabel="性别" LabelAlign="Right" LabelWidth="100">
                  <Items>
                   <ext:ListItem Text="男" Value="男" />
                   <ext:ListItem Text="女" Value="女" />
                  </Items>
                 </ext:ComboBox>
               <ext:DateField ID="教师出生DateField" runat="server"  Width="260" FieldLabel="出生日期" LabelAlign="Right" LabelWidth="100"></ext:DateField>
               
              </Items>
              </ext:Container>
              <ext:Container ID="Container12" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="籍贯TextField" runat="server"  Width="180" FieldLabel="籍贯" LabelAlign="Left" LabelWidth="60"></ext:TextField>
               <ext:ComboBox runat="server" ID="民族ComBox"   FieldLabel="民族" Width="260" LabelAlign="Right" LabelWidth="100" StoreID="民族Store" DisplayField="Nation" ValueField="Nation" Editable="true" TypeAhead="true" Mode="Local" Resizable="true" SelectOnFocus="true" SelectedIndex="0">
               </ext:ComboBox>
               <ext:TextField ID="院系TextField" runat="server"  Width="260" FieldLabel="院系" LabelAlign="Right" LabelWidth="100"></ext:TextField>
               <ext:TextField ID="教育程度TextField" runat="server"  Width="260" FieldLabel="教育程度" LabelAlign="Right" LabelWidth="100"></ext:TextField>
              </Items>
              </ext:Container>
               <ext:Container ID="Container13" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:ComboBox ID="政治面貌ComBox" runat="server" ReadOnly="true" FieldLabel="政治面貌" SelectedIndex="1" Width="180" LabelAlign="Left" LabelWidth="60">
                  <Items>
                   <ext:ListItem Text="党员" Value="党员" />
                   <ext:ListItem Text="团员" Value="团员" />
                   <ext:ListItem Text="群众" Value="群众" />
                   <ext:ListItem Text="预备党员" Value="预备党员" />
                   <ext:ListItem Text="无党派民主人士" Value="无党派民主人士" />
                  </Items>
                 </ext:ComboBox>
               <ext:TextField ID="邮箱TextField" runat="server" ReadOnly="true"  Width="260" FieldLabel="邮箱" LabelAlign="Right" LabelWidth="100">
                
               </ext:TextField>
              </Items>
              </ext:Container>
             </Items>
            </ext:Container>
           </Items>
           <Buttons>
             <ext:Button ID="修改Button" runat="server" Icon="Disk" Text="修改">
              <DirectEvents>
                   <Click OnEvent="修改Button_Click"> 
                   </Click>
              </DirectEvents>
             </ext:Button>
             <ext:Button ID="保存Button" runat="server" Icon="Disk" Text="保存">
              <DirectEvents>
                  <Click OnEvent="保存Button_Click"> 
                  </Click>
              </DirectEvents>
             </ext:Button>
           </Buttons>
    </ext:FormPanel>
    <ext:FieldSet ID="成果统计FieldSet" runat="server" Title="成果统计"  FormGroup="true" AutoHeight="true" >
        <Items>
        <ext:Container ID="Container2" runat="server" Layout="RowLayout" Height="180">
             <Items>
              <ext:Container ID="Container21" runat="server" Layout="TableLayout" Height="30">
              <Items>
                <ext:Label ID="发表论文Label" Text="1.发表论文总数：" Width="600" runat="server"></ext:Label>
              </Items>
              </ext:Container>
              <ext:Container ID="Container22" runat="server" Layout="TableLayout" Height="30">
              <Items>
              <ext:Label ID="参加会议Label" Text="2.参加会议总数：" Width="600" runat="server"></ext:Label>
              </Items>
              </ext:Container>
               <ext:Container ID="Container23" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:Label ID="项目总数Label" Text="3.参加项目总数：" Width="600" runat="server"></ext:Label>
               <ext:Label ID="Label1"  Width="50" runat="server"></ext:Label>
               
                <ext:Label ID="横向项目Label" Text="横向项目总数：" Width="600" runat="server"></ext:Label>
                 <ext:Label ID="Label2"  Width="50" runat="server"></ext:Label>
                <ext:Label ID="纵向项目Label" Text="纵向项目总数：" Width="600" runat="server"></ext:Label>
                <ext:Label ID="Label3"  Width="50" runat="server"></ext:Label>
              </Items>
              </ext:Container>
             </Items>
            </ext:Container>
        </Items>
    </ext:FieldSet>

    </form>
</body>
</html>
