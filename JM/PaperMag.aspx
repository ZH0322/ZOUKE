﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperMag.aspx.cs" Inherits="PaperMag" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
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
    <ext:FormPanel ID="论文录入FormPanel" runat="server" ButtonAlign="Right" Height="600" Padding="5"
        Title="论文录入">
        <Items>
             <ext:Container ID="Container1" runat="server" Layout="RowLayout" Height="180">
             <Items>
              <ext:TextField ID="题目TextField" runat="server"  Width="800" FieldLabel="论文题目*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
              <ext:TextField ID="期刊名TextField" runat="server"  Width="800" FieldLabel="期刊名*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
              <ext:Container ID="Container12" runat="server" Layout="TableLayout" Height="30">
              <Items>
                <ext:TextField ID="第一作者TextField" runat="server"   Width="180" FieldLabel="第一作者*" LabelAlign="Left" LabelWidth="60"></ext:TextField>
               <ext:TextField ID="第二作者TextField" runat="server"  Width="300" FieldLabel="第二作者" LabelAlign="Right" LabelWidth="200"></ext:TextField>
               <ext:DateField ID="接收日期DateField" runat="server"  Width="220" FieldLabel="接收日期*" LabelAlign="Right" LabelWidth="100"></ext:DateField>
               <ext:TextField ID="基金TextField" runat="server"  Width="300" FieldLabel="基金名/号*" LabelAlign="Right" LabelWidth="80"></ext:TextField>
               
               
              </Items>
              </ext:Container>
               <ext:Container ID="Container13" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:TextField ID="卷号TextField" runat="server" Width="180" FieldLabel="卷号" LabelAlign="Left" LabelWidth="60"></ext:TextField>
               <ext:TextField ID="期号TextField" runat="server"  Width="300" FieldLabel="期号" LabelAlign="Right" LabelWidth="200"></ext:TextField>
               <ext:ComboBox ID="单位ComboBox" runat="server" StoreID="院系Store" Width="220" FieldLabel="单位*" LabelAlign="Right" DisplayField="CName" ValueField="CName" SelectedIndex="19" Editable="true" TypeAhead="true" Mode="Local"  SelectOnFocus="true" LabelWidth="60"></ext:ComboBox>
               <ext:TextField ID="页码TextField" runat="server" Width="200" FieldLabel="页码" LabelAlign="Right" LabelWidth="80"></ext:TextField>
              
              </Items>
              </ext:Container>
               <ext:Container ID="Container14" runat="server" Layout="TableLayout" Height="30">
              <Items>
               <ext:ComboBox ID="级别ComboBox" runat="server" Width="300" SelectedIndex="0" FieldLabel="级别*" LabelAlign="Left" LabelWidth="60">
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
             </Items>
            </ext:Container>
            <ext:FieldSet ID="上传论文FieldSet" runat="server" Height="200"  FormGroup="true" Title="上传论文">
                <Items>
                    <ext:FileUploadField ID="上传论文FileUploadField" FieldLabel="上传论文" LabelAlign="Left"  LabelWidth="60" runat="server" Width="300">
                    </ext:FileUploadField>
                    <ext:Button ID="上传Button" runat="server" Text="上传">
                     <DirectEvents>
                      <Click OnEvent="上传Button_Click"></Click>
                     </DirectEvents>
                    </ext:Button>
                </Items>
            </ext:FieldSet>
             <ext:FieldSet ID="备注FieldSet" runat="server" Height="200"  FormGroup="true" Title="备注" TitleCollapse="false">
                <Items>
                 <ext:TextArea ID="备注TextArea" runat="server" Height="80" FieldLabel="备注" LabelAlign="Left" LabelWidth="60" Width="800"></ext:TextArea>
                </Items>
             </ext:FieldSet>
        </Items>
        <Buttons>
            <ext:Button ID="保存Button" runat="server" Icon="Disk" Text="保存">
              <DirectEvents>
                  <Click OnEvent="保存Button_Click"></Click>
              </DirectEvents>
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
