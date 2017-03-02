<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Publish_chart.ascx.cs" Inherits="We7.CMS.Web.Admin.Publish_chart" %>
     <link rel="STYLESHEET" type="text/css" href="../ajax/datepicker/dhtmlxcalendar.css">
     <script>
          window.dhx_globalImgPath="../ajax/datepicker/imgs/";
    </script>
    <script  src="../ajax/datepicker/dhtmlxcommon.js"></script>
    <script  src="../ajax/datepicker/dhtmlxcalendar.js"></script>
    
     <script type="text/javascript" src="../OpenFlashChart/swfobject.js"></script>
    <script type="text/javascript">
    function loadChart(fromTime,toTime)
    {
        var url= "../OpenFlashChart/publish_data.aspx?begin="+fromTime+"&end="+toTime;
        swfobject.embedSWF("../OpenFlashChart/open-flash-chart.swf", "my_chart", "800", "300",
          "9.0.0", "../OpenFlashChart/expressInstall.swf",
          {"data-file": url}
          );
   }
  function showDateSeletor()
  {
//    debugger;
        var dateSeletor=document.getElementById("dateSeletor");
        var f_date_range=document.getElementById("f_date_range");
        if(dateSeletor)
        {
            if(dateSeletor.style.display=='')
            {
                dateSeletor.style.display='none';
                f_date_range.className="";
            }
            else
            {
                dateSeletor.style.display='';
                f_date_range.className="current";
            }
        }
  }
    </script>

	<script type="text/javascript" >
    var fromCal,toCal;
	dhtmlxCalendarLangModules = new Array();
    //set new language and date format
    dhtmlxCalendarLangModules['cn'] = {
        langname:    'cn',
        dateformat:    '%Y年%m月%d日',
        monthesFNames:    ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthesSNames:    ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
        daysFNames:    ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
        daysSNames:    ["日", "一", "二", "三", "四", "五", "六"],
        weekend:    [0, 6],
        weekstart:    1,
        msgClose:     "关闭",
        msgMinimize: "最小化",
        msgToday:     "今天"
    }
 
	window.onload = function () {
		fromCal = new dhtmlxCalendarObject('fromCalendar', false, {isMonthEditable: true, isYearEditable: true});
		fromCal.setYearsRange(1980, 2020);
		fromCal.setDateFormat("%Y-%m-%d");
		fromCal.loadUserLanguage("cn");
		fromCal.attachEvent("onClick",fromSelectDate);
		document.getElementById('starttime').value =formatDate(new Date(),-1);
		var newdateVal = document.getElementById('starttime').value;
        fromCal.setDate(newdateVal);
		fromCal.draw();
		
		toCal = new dhtmlxCalendarObject('toCalendar', false, {isMonthEditable: true, isYearEditable: true});
		toCal.setYearsRange(1980, 2020);
		toCal.setDateFormat("%Y-%m-%d");
		toCal.loadUserLanguage("cn");
		toCal.attachEvent("onClick",toSelectDate);
		
		document.getElementById('endtime').value =formatDate(new Date(),0);
		newdateVal = document.getElementById('endtime').value;
        toCal.setDate(newdateVal);
        toCal.draw();
        
        document.getElementById('date_range_span').innerHTML=document.getElementById('starttime').value+" - "+document.getElementById('endtime').value;
        loadChart(document.getElementById('starttime').value,document.getElementById('endtime').value);
	}
	
    function formatDate(now,y)
    {
          y=now.getFullYear()+y;
          m=now.getMonth()+1;
          d=now.getDate();
          m=m<10?"0"+m:m;
          d=d<10?"0"+d:d;
          return y+"-"+m+"-"+d;
    }
    
    function fromSelectDate(date) {
        document.getElementById('starttime').value = fromCal.getFormatedDate("%Y-%m-%d", date);
        var dateFrom = new Date(fromCal.date);
        var dateTo = new Date();
        toCal.setSensitive(dateFrom, dateTo);
        return true;
    }
  
  function toSelectDate(date) {
        document.getElementById('endtime').value = toCal.getFormatedDate("%Y-%m-%d", date);
        return true;
    }
    
  function applyAction()
  {
      document.getElementById('date_range_span').innerHTML=document.getElementById('starttime').value+" - "+document.getElementById('endtime').value;
      showDateSeletor();
      loadChart(document.getElementById('starttime').value,document.getElementById('endtime').value);
  }
  
	</script>
	
  <div>
  <div class="chartName">内容发布量曲线图</div>
  <div class="date_range">
  <a href="#" id="f_date_range" onclick="showDateSeletor()" >
   <table width="100%" cellpadding="0" cellspacing="0" > <tr> <td align="left"></td><td></td><td class="date_range_display"><span id="date_range_span"> 2009-5-1 - 2009-6-20 </span></td> <td class="comparison_dropdown" id="comparison_dropdown">  <div >  </div>  </td> </tr> </table>
  </a>
  </div>
  <div id="dateSeletor" style="display:none">
  <table  style="margin-top:0;padding:0;width:400px;"  >
        <tr>
            <td >
                <div id="fromCalendar"></div>
            </td>
            <td>
                <div id="toCalendar"></div>
            </td>
            <td>
                时间段：
                <br />
             <input id="starttime" name="starttime"  style="width: 92px" />
                <br />
                ~
               <br />
               <input id="endtime"   name="endtime" style="width: 90px" />
           <br />
           <input type="button" id="applyButton" value="确定" onclick="applyAction()" />
           <br />
                </td>
               <td width="50"></td> 
        </tr>
    </table>
</div>
    </div>
     <div id="my_chart" style="margin-top:15px">
    </div>