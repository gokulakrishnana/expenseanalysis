
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home!</title>
</head>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet/style1.css">
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.structure.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.theme.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css"/>
<style>
.hometable {
	border-style: solid;
	border-collapse: collapse;
	border-color: #000000;
	border-width: 1px;
	text-align: center;
	color:#7E814F;
	
}
fieldset { 
    display: table;
    margin-top:20px;
    margin-left:30px;
    margin-right:50px;
    border-style: solid;
	border-collapse: collapse;
	border-color: #7E814F;
	border-width: 2px;
	background-color: #BEC185;
}

td {
	border-style: solid;
	border-collapse: collapse;
	border-color: #7E814F;
	border-width: 1px;
	text-align: center;
}
P{
color:#7E814F;
}
</style>
<body>
<script>
$(document).ready(function(){
	$("#stdate,#enddate,#anstdate,#anenddate").datepicker({
		changeMonth: true,changeYear: true,dateFormat:"yy-mm-dd"
	});
	$("#Upload").click(function (e){
		var filevalue = $("#file").val();
		if (filevalue == ""){
			alert ("File not Choosen");
			e.preventDefault();
		}
	});
	$("#Analyse").click(function (e){
		var AnalyseStDate = $("#anstdate").val();
		var AnalyseEndDate = $("#anenddate").val();
		if (AnalyseStDate == "" || AnalyseEndDate == ""){
			alert ("Analysis Range not Choosen");
			e.preventDefault();
		}
	});

	

})
</script>
<div id="header">Welcome! </div>
<div id="nav">
<a href="index.jsp" class="navigationbar"> Home</a>
</div>
<div id="section">
		<fieldset>
		<p> Upload File </p>
			<form method="post" action="FileUpload" enctype="multipart/form-data">
				<table class="hometable">

					<tr>
						<td>Select file to upload:</td>
						<td><input type="file" name="file" id="file" /></td>
					</tr>
					<tr>
						<td colspan=2><input id="Upload" type="submit" value="Upload" /></td>
					</tr>

				</table>
			</form>
		</fieldset>

		<fieldset>
		<p> Select Date range to Retrieve and Edit Category type. </p>
			<form id="editform" name="editform" method="post" action="Editdata">
				<table class="hometable">
					<tr>
						<td>From Date:</td>
						<td><input type="text" name="stdate" id="stdate"></td>
					</tr>
					<tr>
						<td>To Date</td>
						<td><input type="text" name="enddate" id="enddate"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Retrieve"></td>
					</tr>
				</table>
			</form>
		</fieldset>
		
		<fieldset>
			<p> Select Date range to Retrieve and Analytics . </p>
			<form id="dataanalysis" name="dataanalysis" method="post" action="DataAnalysis">
				<table class="hometable">
					<tr>
						<td>From Date:</td>
						<td><input type="text" name="anstdate" id="anstdate"></td>
					</tr>
					<tr>
						<td>To Date</td>
						<td><input type="text" name="anenddate" id="anenddate"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" id="Analyse" value="Analyse"></td>
					</tr>
				</table>
			</form>
		</fieldset>

	</div>
	
<div id="arti"></div>
<div id="end">Expense Analysis System</div>	
</body>
</html>