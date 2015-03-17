<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.structure.css" />
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.theme.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/style1.css">
<style>
td{
	border-style:solid;
	border-collapse:collapse;
	border-color: #7E814F;
	border-width: 1px;
	color:#7E814F;
	white-space: nowrap;
}
td.heading{
	border-style:solid;
	border-collapse:collapse;
	border-color: #7E814F;
	border-width: 1px;
	background-color:#BEC185;
	color:#7E814F;
	white-space: nowrap;
	text-align: center;
}
</style>
</head>
<body>
	<%
		String DateRange = (String) session.getAttribute("DateRange");
		HashMap<String, Double> db_IncomeExpense = (HashMap<String, Double>) session
				.getAttribute("IncomeExpense");
		ArrayList<String> db_IncomeByCatg = (ArrayList<String>) session
				.getAttribute("IncomeByCatg");
		ArrayList<String> db_ExpenseByCatg = (ArrayList<String>) session
				.getAttribute("ExpenseByCatg");
		String[] st_DateRange = DateRange.split(";");
	%>
	<div id="header">Analysis Screen</div>
	<div id="nav"><a href="index.jsp" class="navigationbar"> Home</a></div>
	<div id="section">
		<Table class="alalysistable">
			<tr>
				<td class="heading">Start Date</td>
				<td><%=st_DateRange[0]%></td>
				<td class="heading">End Date</td>
				<td><%=st_DateRange[0]%></td>
			</tr>



			<tr>
				<td class="heading" Colspan="4">Totals</td>
			</tr>
			<tr>
				<td  Colspan="2">Total Income</td>
				<td  Colspan="2"><%=db_IncomeExpense.get("CR")%></td>
			</tr>

			<tr>
				<td  Colspan="2">Total Expense</td>
				<td  Colspan="2"><%=db_IncomeExpense.get("DB")%></td>
			</tr>
			<tr>
				<td class="heading" Colspan="4">Total Income by Category</td>
			</tr>
			<%
				for (int i = 0; i < db_IncomeByCatg.size(); i++) {
					String[] arr_IncomeByCatg = db_IncomeByCatg.get(i).split(",");
			%>
			<tr>
				<td  Colspan="2"><%=arr_IncomeByCatg[0]%></td>
				<td  Colspan="2"><%=arr_IncomeByCatg[1]%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class="heading" Colspan="4">Total Expense by Category</td>
			</tr>
			<%
				for (int i = 0; i < db_ExpenseByCatg.size(); i++) {
					String[] arr_ExpenseByCatg = db_ExpenseByCatg.get(i).split(",");
			%>
			<tr>
				<td  Colspan="2"><%=arr_ExpenseByCatg[0]%></td>
				<td  Colspan="2"><%=arr_ExpenseByCatg[1]%></td>
			</tr>
			<%}%>
		</Table>
	</div>
	<div id="arti"></div>
	<div id="end">Expense Analysis System</div>
</body>
</html>