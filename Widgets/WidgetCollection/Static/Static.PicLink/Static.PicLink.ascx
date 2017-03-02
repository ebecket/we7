<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.BaseControl" %>
<script type="text/C#" runat="server"> 
    [ControlDescription(Desc = "Static_PicLink")]
    [ControlGroupDescription(Label = "Static", Icon = "Static", Description = "Static", DefaultType = "Static.PicLink")]
    string MetaData; 
</script>
<div class="<%=CssClass %>">
    <div class="top">
        <strong>友情链接</strong></div>
    <div class="border">
        <div class="content">
            <ul>
                <li><a href="http://www.xmu.edu.cn" target="_blank"></a></li>
                <li class="last"><a href="http://www.wise.xmu.edu.cn" target="_blank"></a></li>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
