<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Article_tag.ascx.cs" Inherits="We7.CMS.Web.Admin.controls.Article_tag" %>
<DIV class=TagsList>
  <DIV id=conbox>             
  <DL>
  <DT>»文章标签<br />
  <img src="/admin/images/bulb.gif" align="absmiddle"/> <LABEL 
  class=block_info>文章标签用于筛选文章到页面不同位置，及用来建立文章关联。下面的系统标签与常用标签点击即可加入为本篇文章的标签。</LABEL> 
    <DD>
<UL id="tagList">
 <asp:Literal ID="TagListLitiral" runat="server"></asp:Literal>
 </UL>

<INPUT id=tagNameInput name=tagNameInput  > 
<br />
<INPUT class=Btn id=tagAddSubmit type=button value=添加 onclick="addTag(tagNameInput.value)" hidefocus> 

<P class=Hint>标签必须是标准的中文或英文单词，且文字与字母间不允许有其他字符或空格。</P>
<DD>
<H1>系统字典标签</H1>
<div>
<asp:Literal ID="TagDictionaryLiteral" runat="server"></asp:Literal>
</div>
<DD>
<H1>本站常用标签</H1>
<div>
 <asp:Literal ID="CommonTagsLiteral" runat="server"></asp:Literal>
</div>

</DL>
</DIV>
</DIV>
<asp:Literal ID=ArticleIDHidden runat="server"></asp:Literal>
