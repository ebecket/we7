<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Folder.aspx.cs" Inherits="We7.CMS.Web.Admin.Folder"  MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master"
    EnableEventValidation="false" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<input type="hidden" id="hdDemoSite"
             value='<%= We7.Framework.Config.GeneralConfigs.GetConfig().IsDemoSite.ToString().ToLower() %>' />
     <script type="text/javascript" language="javascript">
        function iframeAutoFit()
             {
           try
                {
                  if(window!=parent)
                    {
                    var a = parent.document.getElementsByTagName("IFRAME");
                     for(var i=0; i<a.length; i++) //author:meizz
                       {
                        if(a[i].contentWindow==window)
                           {
                          var h1=0, h2=0;
                          a[i].parentNode.style.height = a[i].offsetHeight +"px";
                          a[i].style.height = "10px";
        if(document.documentElement&&document.documentElement.scrollHeight)
                        {
                           h1=document.documentElement.scrollHeight;
                         }
                         if(document.body) h2=document.body.scrollHeight;
                         var h=Math.max(h1, h2);
                       if(document.all) {h += 4;}
                        if(window.opera) {h += 1;}
                        a[i].style.height = a[i].parentNode.style.height = h +"px";
                        }
                  }
             }
         }
        catch (ex){}
          }
         if(window.attachEvent)
        {
           window.attachEvent("onload",iframeAutoFit);
        }
        else if(window.addEventListener)
        {
             window.addEventListener('load',   iframeAutoFit,   false);
        }
     </script>
    <script type="text/javascript">
    function SelectAll(tempControl) 
    { 
        var theBox=tempControl; 
        xState=theBox.checked;     

        elem=theBox.form.elements; 
        for(i=0;i<elem.length;i++) 
        if(elem[i].type=="checkbox" && elem[i].id!=theBox.id) 
        { 
        if(elem[i].checked!=xState) 
	        elem[i].click(); 
        } 
      }    
function doDelete() {
    var isDemoSite = document.getElementById("hdDemoSite").value;
    if (isDemoSite === "true") {
        alert("对不起，此演示站点您没有该操作权限！");
        return;
    }
    if(!confirm("您要删除选中的所有文件吗？注意：删除的文件不能恢复！")) return;
    
    var files = null;
    var items = document.getElementsByName("FileItems");
    if(items) {
        if(items.length) {
            for(var i=0; i<items.length; i++) {
                var item = items[i];
                if(item.checked) {
                    if(files == null) {
                        files = "";
                    }
                    else {
                        files += ";";
                    }
                    files += item.value;
                }
            }
        }
        else {
            if(items.checked) {
                files = items.value;
            }
        }
    }
    if(files != null) {
        document.getElementById("<%=DelsTextBox.ClientID %>").value = files;
        document.getElementById("<%=DeleteButton.ClientID %>").click();
    }
}

function doUpload() {
    var isDemoSite = document.getElementById("hdDemoSite").value;
    if (isDemoSite === "true") {
        alert("对不起，此演示站点您没有该操作权限！");
        return;
    }
    document.getElementById("<%=UploadButton.ClientID %>").click();
}

function doSelect(v, d) {
    if(d == 'True') {
        return;
    }
    weCloseDialog(v, d);
}

function doCopy() {
    var isDemoSite = document.getElementById("hdDemoSite").value;
    if (isDemoSite === "true") {
        alert("对不起，此演示站点您没有该操作权限！");
        return;
    }
    var files = null;
    var items = document.getElementsByName("FileItems");
    if(items) {
        if(items.length) {
            for(var i=0; i<items.length; i++) {
                var item = items[i];
                if(item.checked) {
                    if(files == null) {
                        files = "";
                    }
                    else {
                        files += ";";
                    }
                    files += item.value;
                }
            }
        }
        else {
            if(items.checked) {
                files = items.value;
            }
        }
    }
    if(files != null) {
        document.getElementById("<%=DelsTextBox.ClientID %>").value = files;
        document.getElementById("<%=CloneButton.ClientID %>").click();
    }
}

function doCreate() {
    var isDemoSite = document.getElementById("hdDemoSite").value;
    if (isDemoSite === "true") {
        alert("对不起，此演示站点您没有该操作权限！");
        return;
    }
    document.getElementById("<%=CreateButton.ClientID %>").click();
  }
	
	function UploadCancel()
	{
		location.href = location.href;
	}
	
	function reNameFile(name,fullpath)
	{
	    var newName=prompt("请输入新的文件名：",name);
//	    debugger;
	    if(newName && name != newName)
	    { 
	        var FullNameTextBox=document.getElementById("<%=FullNameTextBox.ClientID %>");
	        var NewNameTextBox=document.getElementById("<%=NewNameTextBox.ClientID %>");
	        if(FullNameTextBox && NewNameTextBox)
	        {
	            NewNameTextBox.value=newName;
	            FullNameTextBox.value=fullpath;
	            document.getElementById("<%=RenameButton.ClientID %>").click();
	        }
	    }
	}
		
    </script>
        <h2 style="display:none">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/logo_folder.gif" />
            <asp:Label ID="NameLabel" runat="server" Text="当前目录">
            </asp:Label>
            <span class="summary">
            </span>
        </h2>
       <div id="position" >
        <asp:Label ID="PathLabel" runat="server" Text="">
                </asp:Label><span>/</span>
                <asp:Label ID="FilterLabel" runat="server" Text=""></asp:Label>
       </div> 
        <div class="toolbar" >
            <asp:HyperLink ID="GoParentHyperLink" runat="server">
                <asp:Image ID="ParentImage" runat="server" ImageUrl="~/admin/Images/icon_parent.gif" />上一级</asp:HyperLink>
            <span> </span>
            <asp:HyperLink ID="DeleteHyperLink" NavigateUrl="javascript:doDelete();" runat="server">
                <asp:Image ID="DeleteImage" runat="server" ImageUrl="~/admin/Images/icon_delete.gif" />删除</asp:HyperLink>
             <asp:HyperLink ID="CopyHyperLink" NavigateUrl="javascript:doCopy();" runat="server">
                创建副本
            </asp:HyperLink>
            <span> </span> <span>新文件夹:</span>
            <asp:TextBox ID="FolderTextBox" runat="server"></asp:TextBox>
            <asp:HyperLink ID="CreateHyperLink" NavigateUrl="javascript:doCreate();" runat="server">
                <asp:Image ID="CreateImage" runat="server" ImageUrl="~/admin/Images/icon_new.gif" />创建
            </asp:HyperLink>
            <span> </span>

        </div>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
        <div  class="fileContainer">
            <div style="width: 97%">
                <asp:GridView ID="FileListGridView" runat="server" AutoGenerateColumns="False" 
                    CssClass="List" GridLines="Horizontal"  
                    OnRowDataBound="DataGridView_RowDataBound" >
                    <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:doSelect('<%#DataBinder.Eval(Container.DataItem, "FullName") %>','<%#DataBinder.Eval(Container.DataItem, "IsDirectory") %>');">
                                    选择</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  >
                       <HeaderTemplate>
                            <asp:CheckBox ID="chkHeader" runat="server" onclick="javascript:SelectAll(this);"
                                AutoPostBack="false" />
                        </HeaderTemplate> 
                            <ItemStyle Width="10px" />
                            <ItemTemplate>
                                <input type="checkbox" name="FileItems" value="<%#DataBinder.Eval(Container.DataItem, "FullName") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Icon" DataImageUrlFormatString="images/filetype/{0}">
                            <ItemStyle Width="20px" />
                        </asp:ImageField>
                        <asp:TemplateField HeaderText="名称">
                            <ItemTemplate>
                                <%# Eval("Url", "{0}") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="FileNewNameTextbox" runat="server" Text='<%# Eval("Name", "{0}") %>' ></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FileType" DataFormatString="{0}" HeaderText="文件类型" />
                        <asp:BoundField DataField="Created" DataFormatString="{0}" HeaderText="创建日期" 
                            ItemStyle-Font-Size="10px" >
                            <ItemStyle Font-Size="10px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Size" DataFormatString="{0}" HeaderText="大小" 
                            ItemStyle-Font-Size="10px" >
                        
                            <ItemStyle Font-Size="10px"></ItemStyle>
                        </asp:BoundField>
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
            <div class="toolbar" style="height:70px;">  
                <asp:Image ID="UploadImage" runat="server" ImageUrl="~/admin/Images/icon_upload.gif" />
                <span>上传文件：</span>
                <asp:FileUpload ID="FileUploador" runat="server" Width="250px" />
                <span>重命名：</span>
                <asp:TextBox ID="FileNameTextBox" runat="server" Columns="10" Width="150px"></asp:TextBox>
                <div style="margin-top:5px">
                <asp:CheckBox ID="ZipCheckBox" runat="server" Checked="true" /><span>自动解压缩zip文件</span>
                  <asp:HyperLink ID="UploadHyperLink" NavigateUrl="javascript:doUpload();" runat="server">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/admin/Images/icon_save.gif" />
                            上传</asp:HyperLink>
                </div>
            <div style="display: none">
                <asp:TextBox ID="DelsTextBox" runat="server"></asp:TextBox>&nbsp;
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                <asp:Button ID="CreateButton" runat="server" Text="Create" OnClick="CreateButton_Click" />
                <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload"   />
               <asp:TextBox ID="FullNameTextBox" runat="server"></asp:TextBox>     
               <asp:TextBox ID="NewNameTextBox" runat="server"></asp:TextBox>
              <asp:Button ID="RenameButton" runat="server" Text="rename" onclick="RenameButton_Click"  />
              <asp:Button ID="CloneButton" 
                    runat="server" Text="Clone" onclick="CloneButton_Click"   />
            </div>
        </div>
                        
</asp:Content>
