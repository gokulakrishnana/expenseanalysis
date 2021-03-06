
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
<link rel="stylesheet" type="text/css" href="stylesheet/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/jquery-ui.structure.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/jquery-ui.theme.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/tables-style.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/button-style.css"/>
<style>

td {
	border-style: solid;
	border-collapse: collapse;
	border-color: #A9F5BC;
	border-width: 0px;
	text-align: center;
}

fieldset { 
    display: table;
    margin-top:20px;
    margin-left:5%;
    margin-right:50px;
	border-collapse: collapse;
	border-color: #FFFFFF;
	border-width: 0px; 
	border-style:groove;
	border-corner-shape:curve;
	border-radius:18px;
	background-color: #A9E2F0;
	width: 50%;
	font-size:medium;
	font-size-adjust: inherit;	
} 

.fldsetpara{
font-size: 20px;
font-weight: bold;
}

P{
color:#FFFFFF;
}
</style>
<body>
<script>
$(document).ready(function(){
	$("#stdate,#enddate,#anstdate,#anenddate,#datepicker").datepicker({
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
<!-- <div id="header">Welcome! </div> -->
<div id="nav1"> 
<a href="index.jsp"> Home</a>
<a href="#"> About</a>
<a href="#"> Contact US</a>
</div>
<div id="section">
		<fieldset>
		<p class="fldsetpara"> Upload </p>
			<form method="post" action="FileUpload" enctype="multipart/form-data">
				<table class="hometable">

					<tr>
						<td>Select file to upload:</td>
						<td><input class="btnClass1" type="file" name="file" id="file" /></td>
					</tr>
					<tr>
						<td colspan=2><input class="btnClass1" id="Upload" type="submit" value="Upload" /></td>
					</tr>

				</table>
			</form>
		</fieldset>

		<fieldset>
		<p class="fldsetpara"> Edit and Delete </p>
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
						<td colspan="2"><input class="btnClass1" type="submit" value="Retrieve"></td>
					</tr>
				</table>
			</form>
		</fieldset>
		
		<fieldset>
			<p class="fldsetpara"> Analytics</p>
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
						<td colspan="2"><input class="btnClass1" type="submit" id="Analyse" value="Analyse"></td>
					</tr>
				</table>
			</form>
		</fieldset>

</div>
<div id="end">Expense Analysis System</div>	

</body>
</html>