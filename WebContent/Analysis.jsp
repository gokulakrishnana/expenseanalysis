<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/dist/jquery.jqplot.min.js"></script>
<script type="text/javascript"
	src="scripts/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="scripts/dist/plugins/jqplot.donutRenderer.min.js"></script>

<!-- <script type="text/javascript" src="scripts/dist/plugins/jqplot.highlighter.min.js"></script> -->
<script type="text/javascript"
	src="scripts/dist/plugins/jqplot.cursor.min.js"></script>
<script type="text/javascript"
	src="scripts/dist/plugins/jqplot.dateAxisRenderer.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="stylesheet/jquery.jqplot.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css" />
<link rel="stylesheet" type="text/css"
	href="stylesheet/tables-style.css">
<script>
$(document).ready(function() {	
	var name = "#fltChartDisp";
	var menuYloc = null;
	menuYloc = parseInt($(name).css("top").substring(0,
			$(name).css("top").indexOf("px")));
	$(window).scroll(function() {
		offset = menuYloc + $(document).scrollTop() + "px";
		$(name).animate({
			top : offset
		}, {
			duration : 500,
			queue : false
		});
	});
});	
</script>
<style>
#fltChartDisp {
	position: absolute;
	top: 150px;
	left: 40%;
	margin-left: 235px;
	width: 300px;
	height: 400px;
}
</style>
<script>
function load_function() {
	income_chart_plot.activateTheme('icome_theme');	
	expense_chart_plot.activateTheme('expense_theme');	
};
</script>
</head>
<body onload="load_function()">
	<div id="fltChartDisp">Lets see if it works</div>

	<hr>
	<%
		String DateRange = (String) session.getAttribute("DateRange");
		HashMap<String, Double> db_IncomeExpense = (HashMap<String, Double>) session
				.getAttribute("IncomeExpense");
		ArrayList<String> db_IncomeByCatg = (ArrayList<String>) session
				.getAttribute("IncomeByCatg");
		ArrayList<String> db_ExpenseByCatg = (ArrayList<String>) session
				.getAttribute("ExpenseByCatg");
		ArrayList<String> db_AllRecsOrdCatg = (ArrayList<String>) session
				.getAttribute("ExpenseOrdCatg");
		String[] st_DateRange = DateRange.split(";");
	%>
	<div id="nav1">
		<a href="index.jsp"> Home</a>
	</div>
	<div id="section">

<!-- Totals  -->
		<Table class="analyse-table">
			<tr>
				<td class="analyse-td-heading">Start Date</td>
				<td class="analyse-td"><%=st_DateRange[0]%></td>
				<td class="analyse-td-heading">End Date</td>
				<td class="analyse-td"><%=st_DateRange[0]%></td>
			</tr>

			<tr>
				<td class="analyse-td-heading" Colspan="4">Totals</td>
			</tr>
			<tr>
				<td class="analyse-td" Colspan="2">Total Income</td>
				<td class="analyse-td" Colspan="2"><%=db_IncomeExpense.get("CR")%></td>
			</tr>

			<tr>
				<td class="analyse-td" Colspan="2">Total Expense</td>
				<td class="analyse-td" Colspan="2"><%=db_IncomeExpense.get("DB")%></td>
			</tr>

		</Table>
<!-- Income Chart -->		
		<Table class="analyse-table">
			<tr>
				<td class="analyse-td-heading" Colspan="4">Total Income by
					Category</td>
			</tr>
			<%
				for (int i = 0; i < db_IncomeByCatg.size(); i++) {
					String[] arr_IncomeByCatg = db_IncomeByCatg.get(i).split(",");
			%>
			<tr>
				<td class="analyse-td"><%=arr_IncomeByCatg[0]%></td>
				<td class="analyse-td"><%=arr_IncomeByCatg[1]%></td>
			</tr>
			<%
				}
			%>
		</table>
		<div id="disp_income_chart" style="width:400px;float:left;background-color:#FAFBEF">
			<div id="income_chart" style="width:400px;">
			</div>
		</div>
		<div id="disp_income_chart_indi" style="width:400px;height:300px;background-color:#FAFBEF;float:left;margin-left:2%">
		</div>
		<div style="clear:both"></div>
<script>
$(document).ready(function(){
	  var data = [
<%
for (int i = 0; i < db_IncomeByCatg.size(); i++) {
	String[] arr_IncomeByCatg = db_IncomeByCatg.get(i).split(",");
	if (i!=0){ %>
		,['<%=arr_IncomeByCatg[0]%>',<%=arr_IncomeByCatg[1]%>]
	<%} else {%>

['<%=arr_IncomeByCatg[0]%>',<%=arr_IncomeByCatg[1]%>]
<%}%>

<%
}
%>	
	  ];
	   income_chart_plot = jQuery.jqplot ('income_chart', [data], 
	    { 
	      seriesDefaults: {
	        // Make this a pie chart.
	        renderer: jQuery.jqplot.DonutRenderer, 
	        rendererOptions: {
	          // Put data labels on the pie slices.
	          // By default, labels show the percentage of the slice.
	          showDataLabels: true,
	          startAngle: -90,
	          sliceMargin: 3,
	        }
	      }, 
	      legend: { show:true, location: 'e' }
	    }
	  );
income_theme={seriesStyles: {
    seriesColors: [  '#00FF00','#1EFF05','#3CFF0A','#5AFF0F','#78FF14','#96FF19','#B4FF1E'
                     ,'#B9FF23','#BEFF28','#C3FF2D','#C8FF32','#CDFF37','#D2FF3C','#D7FF41'
                     ,'#DCFF46','#E1FF4B','#E6FF50','#EBFF55','#F0FF5A','#F5FF5F','#FAFF64'
                     ,'#FAFF6E','#FAFF78','#FAFF82','#FAFF8C'],
    highlightColors: [ '#00EA00','#1EEA05','#3CEA0A','#5AEA0F','#78EA14','#96EA19','#B4EA1E'
                       ,'#B9EA23','#BEEA28','#C3EA2D','#C8EA32','#CDEA37','#D2EA3C','#D7EA41'
                       ,'#DCEA46','#E1EA4B','#E6EA50','#EBEA55','#F0EA5A','#F5EA5F','#FAEA64'
                       ,'#FAEA6E','#FAEA78','#FAEA82','#FAEA8C']},
                       };
income_chart_plot.themeEngine.newTheme('icome_theme', income_theme);
	});
</script>		
<!-- Expense Chart -->
		<Table class="analyse-table">
			<tr>
				<td class="analyse-td-heading" Colspan="4">Total Expense by
					Category</td>
			</tr>
			<%
				for (int i = 0; i < db_ExpenseByCatg.size(); i++) {
					String[] arr_ExpenseByCatg = db_ExpenseByCatg.get(i).split(",");
			%>
			<tr>
				<td class="analyse-td"><%=arr_ExpenseByCatg[0]%></td>
				<td class="analyse-td"><%=arr_ExpenseByCatg[1]%></td>
			</tr>
			<%}%>
		</Table>

		<div id="disp_expense_chart" style="width:400px;float:left;">
			<div id="expense_chart" style="width:400px;">
			</div>
		</div>
		<div id="disp_expense_chart_indi" style="width:400px;background-color:#FAFBEF;float:left;margin-left:2%">
		</div>
		<div style="clear:both"></div>
<!--    comment scripts from here   -->
<script>
$(document).ready(function(){
	  var data = [
<%
for (int i = 0; i < db_ExpenseByCatg.size(); i++) {
	String[] arr_ExpenseByCatg = db_ExpenseByCatg.get(i).split(",");
%>

['<%=arr_ExpenseByCatg[0]%>',<%=arr_ExpenseByCatg[1]%>],

<%
}
%>	              
	  ];
	   expense_chart_plot = jQuery.jqplot ('expense_chart', [data], 
	    { 
	      seriesDefaults: {
	        // Make this a pie chart.
	        renderer: jQuery.jqplot.DonutRenderer,
	        rendererOptions: {
	          // Put data labels on the pie slices.
	          // By default, labels show the percentage of the slice.
	              showDataLabels: true,
		          startAngle: -90,
		          sliceMargin: 3 }
	      }, 
	      legend: { show:true, location: 'e' }
	    }
	  );

	  expense_theme={seriesStyles: {
		    seriesColors: ['#FF0000','#FF0B05','#FF160A','#FF210F','#FF2C14','#FF3719','#FF421E',
		                   '#FF4D23','#FF5828','#FF632D','#FF6E32','#FF7937','#FF843C','#FF8F41',
		                   '#FF9A46','#FF9F50','#FFA45A','#FFA964','#FFAE6E','#FFB378','#FFB882',
		                   '#FFBD8C','#FFC296','#FFC7A0','#FFCCAA'],
		    highlightColors: ['#EA0000','#EA0B05','#EA160A','#EA210F','#EA2C14','#EA3719','#EA421E',
		                      '#EA4D23','#EA5828','#EA632D','#EA6E32','#EA7937','#EA843C','#EA8F41',
		                      '#EA9A46','#EA9F50','#EAA45A','#EAA964','#EAAE6E','#EAB378','#EAB882',
		                      '#EABD8C','#EAC296','#EAC7A0','#EACCAA',]},
		                       };
	  expense_chart_plot.themeEngine.newTheme('expense_theme', expense_theme);
	});
</script>
</div>

<div style="clear: both;"></div>
<div id="end">Expense Analysis System</div>


	<%String catg_name = " ";
	for( int i=0;i<=(db_AllRecsOrdCatg.size()- 1);i++) {
		String [] catg_chart =  db_AllRecsOrdCatg.get(i).toString().split(",");
		if (catg_name.equals(catg_chart[0].trim())){%>

	,['<%=catg_chart[1].toString().trim()%>',<%=catg_chart[2].toString().trim()%>]

	<%}else{ %>
	<%if (i!=0) {%>
	]; plot_<%=catg_name%>
	= $.jqplot('chart_<%=catg_name%>', [line_<%=catg_name%>], 
	{ title:'Data Point for	<%=catg_name%>',
	 axes:{ xaxis:{ renderer:$.jqplot.DateAxisRenderer,
	tickOptions:{ formatString:'%b&nbsp;%#d' } }, yaxis:{ tickOptions:{
	formatString:'$%.2f' } } }, highlighter: { show: true, sizeAdjust: 7.5
	}, cursor: { show: false } }); });
	</script>
	<%}
		catg_name = catg_chart[0].trim();%>
	<div id="chart_<%=catg_name%>" style="height: 300px; width: 600px;"></div>
	<script>
		$(document).ready(function(){

 		var line_<%=catg_name%> = [['<%=catg_chart[1]%>',<%=catg_chart[2]%>]
		<%}%>
<%}%>]
 		plot_<%=catg_name%> = $.jqplot('chart_<%=catg_name%>', [line_<%=catg_name%>], {
 			title:'Data Point for <%=catg_name%>',
 	      axes:{
 	        xaxis:{
 	          renderer:$.jqplot.DateAxisRenderer,
 	          tickOptions:{
 	            formatString:'%b&nbsp;%#d'
 	          } 
 	        },
 	        yaxis:{
 	          tickOptions:{
 	            formatString:'$%.2f'
 	            }
 	        }
 	      },
 	      highlighter: {
 	        show: true,
 	        sizeAdjust: 7.5
 	      },
 	      cursor: {
 	        show: false
 	      }
 	  });
 	});
 	</script>



</body>
</html>