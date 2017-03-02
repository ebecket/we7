<%@ Control Language="C#" AutoEventWireup="true" Codebehind="db_fresh.ascx.cs"
    Inherits="We7.CMS.Web.Admin.controls.db_fresh" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>

<WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»数据库数据更新<br />
            <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info">对统计数据及缓存数据进行更新；</label>
        </dt>
    </dl>
    <div style="display:table;width:100%;padding-left:50px">
      <div>
    对所有表进行冗余字段进行更新
        <table width="100%" >
            <tr>
                <td width="25%">
                   所有表冗余字段更新
                </td>
                <td>
                     <asp:Button ID="UpdateButton" runat="server" Text="更新所有冗余字段" 
            onclick="UpdateButton_Click" />
                </td>
            </tr>
        </table>
  
    </div><br />
    <div style="border-bottom: #FECCAB 1px solid;"></div>
    <br />
    <div>
    <div>对文章表进行冗余字段的更新</div>
        <table style="width: 100%;">
            <tr>
                <td width="25%">
                  更新点击率
                </td>
                <td>
                    <asp:Button ID="UpdateClickButton" runat="server" Text="更新点击率" 
                        onclick="UpdateClickButton_Click" />
                </td>
            </tr>
            <tr>
                <td width="25%">
                    更新评论数
                </td>
                <td>
                    <asp:Button ID="UpdateCommentsButton" runat="server" Text="更新评论数" 
                        onclick="UpdateCommentsButton_Click" />
                </td>
            </tr>
            <tr>
                <td width="25%">
                   更新文章标签
                </td>
                <td>
                   <asp:Button ID="UpdateArticleTagsButton" runat="server" Text="更新文章标签" 
                        onclick="UpdateArticleTagsButton_Click" />
                </td>
            </tr>
                        <tr>
                <td width="25%">
                   更新文章索引
                </td>
                <td>
                   <asp:Button ID="Button1" runat="server" Text="更新文章索引" 
                        onclick="UpdateArticleIndexButton_Click" />
                        <a href="javascript:showNotice(Span1)">[?]</a>
                        <br />
                        <span id="Span1" class="notice" style="display: none">把导库前的文章往文章索引表添加数据 </span>
                </td>
                
            </tr>
              <tr>
                <td width="25%">
                   更新文章SN
                </td>
                <td>
                   <asp:Button ID="Button3" runat="server" Text="更新文章SN" 
                        onclick="UpdateArticleSNButton_Click" />
                        <a href="javascript:showNotice(Span3)">[?]</a>
                        <br />
                        <span id="Span3" class="notice" style="display: none">此用于数据采集来的数据进行更新</span>
                </td>
                
            </tr>
            
            <tr>
                <td width="25%">
                   更新文章其他冗余字段
                </td>
                <td>
                   <asp:Button ID="UpdateOtherButton" runat="server" Text="更新文章其他冗余字段" 
                        onclick="UpdateOtherButton_Click" />
                         <a href="javascript:showNotice(divChannelName)">[?]</a>
                        <br />
                        <span id="divChannelName" class="notice" style="display: none">更新文章栏目ChannelFullUrl，文章中EnumState为空就初始化，文章，产品等过期已过把文章状态设成过期状态，默认的过期时间为100天。 </span>
                      
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="border-bottom: #FECCAB 1px solid;"></div>
    <br />
    <div>
    <div>对栏目表进行冗余字段的更新</div>
        <table style="width: 100%;">
            <tr>
                <td width="25%">
                   更新标签
                </td>
                <td>
                    <asp:Button ID="UpdateChannelTagsButton" runat="server" Text="更新栏目标签" 
                        onclick="UpdateChannelTagsButton_Click" />
                </td>
            </tr>
        </table>
    </div>
   <br />
    <div style="border-bottom: #FECCAB 1px solid;"></div>
    <br />
    <div>
    <div>对流量统计表进行冗余字段的更新</div>
        <table style="width: 100%;">
            <tr>
                <td width="25%">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="UpdatePVButton" runat="server" Text="更新统计数据" 
                        onclick="UpdatePVButton_Click" />
                </td>
            </tr>
        </table>
    </div>
    
        <div>
    <div>对会员数据进行批量更新</div>
        <table style="width: 100%;">
            <tr>
                <td width="25%">
                    为会员赋予默认角色：注册用户</td>
                <td>
                    <asp:Button ID="InitRoleButton" runat="server" Text="更新会员初始化角色" 
                        onclick="InitRoleButton_Click" />
                </td>
            </tr>
            <tr>
                <td width="25%">
                    为用户赋予模型绑定角色</td>
                <td>
                    <asp:Button ID="BindModelUserroleButton" runat="server" Text="更新模型用户绑定角色" 
                        onclick="BindModelUserroleButton_Click" />
                </td>
            </tr>
        </table>
    </div>
   <br />
    </div>
    </script>
</div>
