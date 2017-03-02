<!--### name="人员信息列表(自动布局,单表结构)" type="system" version="1.0" created="2013/12/27 9:53:36" desc="列表控件自动生成布局,单表结构" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.DbModelProvider" %>
<div css="Default_People_<%=CssClass%>">
<% for(int i=0;i<Items.Count;i++){ %>
<p>·<a href="<%=GetUrl(Items[i]["ID"])%>" target="_blank">
			<%=Items[i]["OwnerID"] %>&nbsp;
    		<%=Items[i]["Fullname"] %>&nbsp;
    		<%=Items[i]["Gendar"] %>&nbsp;
    		<%=Items[i]["Title"] %>&nbsp;
    		<%=Items[i]["Position"] %>&nbsp;
    		<%=Items[i]["Office"] %>&nbsp;
    		<%=Items[i]["OfficeTime"] %>&nbsp;
    		<%=Items[i]["Phone"] %>&nbsp;
    		<%=Items[i]["Mobil"] %>&nbsp;
    		<%=Items[i]["Email"] %>&nbsp;
    		<%=Items[i]["Duty"] %>&nbsp;
    		<%=Items[i]["Field"] %>&nbsp;
    		<%=Items[i]["Photo"] %>&nbsp;
    		<%=Items[i]["Url"] %>&nbsp;
    		<%=Items[i]["Intro"] %>&nbsp;
    		<%=Items[i]["IndexLetter"] %>&nbsp;
    		<%=Items[i]["CardNumber"] %>&nbsp;
    		<%=Items[i]["Cate"] %>&nbsp;
    		<%=Items[i]["Subject"] %>&nbsp;
        <%=ToDateStr(Items[i]["Updated"],"yyyy-MM-dd") %>
</a>
</p>
<%}%>
</div>
<%--系统提供的方法
string ToStr(object fieldValue)
string ToStr(object fieldValue, int maxlength)
string ToStr(object fieldValue, int maxlength, string tail)
string ToDateStr(object fieldValue, string fmt)
string ToDateStr(object fieldValue)
int? ToInt(object fieldValue)
string GetUrl(object id)
--%>