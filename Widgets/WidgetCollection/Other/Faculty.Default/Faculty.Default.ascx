<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Faculty.Default.cs"
    Inherits="We7.CMS.Web.Widgets.Faculty_Default" %>
<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><strong>师资队伍</strong>
    </div>
    <div class="border">
        <div class="content">
            <div class="content_nav">
                <asp:DataList ID="org" runat="server" CellPadding="3" ShowFooter="false" ShowHeader="false"
                    RepeatDirection="Horizontal" RepeatColumns="4" AlternatingItemStyle-BackColor="#eeeeee"
                    CssClass="">
                    <ItemTemplate>
                        <a href="#<%# DataBinder.Eval(Container.DataItem, "id")%>">
                            <%#DataBinder.Eval(Container.DataItem, "item")%></a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="teacher_content">
                <br />
                以下教职人员均按姓氏姓名拼音排序<br />
                <a target="_blank" href="http://www.wise.xmu.edu.cn/viewNews.asp?id=442">经济学院院长&ldquo;长江学者&rdquo;讲座教授
                    洪永淼</a><br />
                <br />
                <asp:DataList ID="orglist" runat="server" ShowFooter="false" ShowHeader="false">
                    <ItemTemplate>
                        <a name="<%# DataBinder.Eval(Container.DataItem, "id")%>"></a>
                            <table>
                                <tr>
                                    <td class="teacher_arrow">
                                        <%#DataBinder.Eval(Container.DataItem, "item")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="teacher" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "myrelation") %>'
                                            ShowFooter="false" RepeatDirection="Horizontal" RepeatColumns="5" AlternatingItemStyle-BackColor="#ffffff">
                                            <ItemTemplate>
                                                <a href="/homepage/index.aspx?uid=<%# DataBinder.Eval(Container.DataItem, "t_id")%>"
                                                    target="_blank">
                                                    <%#DataBinder.Eval(Container.DataItem, "t_name")%>
                                                </a>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
