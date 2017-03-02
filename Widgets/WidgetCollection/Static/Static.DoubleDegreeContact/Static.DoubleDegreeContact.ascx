<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.BaseControl" %>

<script type="text/C#" runat="server"> 
    [ControlDescription(Desc = "Static_DoubleDegreeContact")]
    [ControlGroupDescription(Label = "Static", Icon = "Static", Description = "Static", DefaultType = "Static.DoubleDegreeContact")]
    string MetaData; 
</script>

<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><strong>联系我们</strong>
    </div>
    <div class="border">
        <div class="content">
            <strong>联系方式：</strong>
            <table>
                <tr>
                    <th>
                        联系人
                    </th>
                    <th>
                        电话
                    </th>
                    <th>
                        邮件
                    </th>
                </tr>
                <tr>
                    <td>
                        丛老师
					</td>
                    <td>
                        0592-2182396
                    </td>
                    <td>
                        jtcl@xmu.edu.cn
                    </td>
                </tr>
                <tr>
                    <td>
                        蔡老师
                    </td>
                    <td>
                        0592-2182395
                    </td>
                    <td>
                        szcai@xmu.edu.cn
                    </td>
                </tr>                
            </table>
            <strong>办公地点：</strong>
            <p>
                厦门大学经济学院（经济楼A-313）</p>            
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
