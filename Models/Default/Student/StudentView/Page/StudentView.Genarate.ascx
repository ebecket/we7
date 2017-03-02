<!--### name="学生信息详细(自动布局)" type="system" version="1.0" created="2014/10/10 10:45:46" desc="" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.ArticleModelProvider" %>
<div css="Default_Student_<%=CssClass%>">
<table>
<tr><td>栏目ID:</td><td><%=Item["OwnerID"] %></td></tr>
<tr><td>姓名:</td><td><%=Item["stuName"] %></td></tr>
<tr><td>年级:</td><td><%=Item["Grade"] %></td></tr>
<tr><td>学历:</td><td><%=Item["Degree"] %></td></tr>
<tr><td>照片:</td><td><%=Item["Photo"] %></td></tr>
<tr><td>邮箱:</td><td><%=Item["Email"] %></td></tr>
<tr><td>专业:</td><td><%=Item["major"] %></td></tr>
<tr><td>备注:</td><td><%=Item["Remarks"] %></td></tr>
<tr><td>学号:</td><td><%=Item["StuNo"] %></td></tr>
<tr><td>国籍:</td><td><%=Item["Nationality"] %></td></tr>
<tr><td>性别:</td><td><%=Item["Gender"] %></td></tr>
<tr><td>前院校:</td><td><%=Item["preSchool"] %></td></tr>
<tr><td>前专业:</td><td><%=Item["preMajor"] %></td></tr>
<tr><td>毕业时间:</td><td><%=Item["Graduatetime"] %></td></tr>
<tr><td>就业公司:</td><td><%=Item["Job"] %></td></tr>
<tr><td>论文题目:</td><td><%=Item["Paper"] %></td></tr>
<tr><td>论文地址:</td><td><%=Item["Url"] %></td></tr>
<tr><td>学院:</td><td><%=Item["schoolName"] %></td></tr>
</table>
</div>
