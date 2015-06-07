<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Response</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="stylesheets/jquery-ui.structure.css" />
<link rel="stylesheet" type="text/css"
	href="stylesheets/jquery-ui.theme.css" />
	
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css" />
<link rel="stylesheet" type="text/css" href="stylesheet/button-style.css">
<link rel="stylesheet" type="text/css" href="stylesheet/tables-style.css">

</head>
<body>
	<%
		int UpdateCount = (Integer) session.getAttribute("UpdateCount");
		int DeleteCount = (Integer) session.getAttribute("DeleteCount");
	%>
<div id="nav1"> 
<a href="index.jsp"> Home</a>
</div>

	<div id="section">
		<center>
			<Table class="editiresponsetable">
				<tr>
					<td class="editiresponsetdheading">Rows Updated Count</td>
					<td class="editiresponsetd"><%=UpdateCount%></td>
					<td class="editiresponsetdheading">Rows Deleted Count</td>
					<td class="editiresponsetd"><%=DeleteCount%></td>
				</tr>
			</Table>
		</center>
	</div>
	<div id="arti"></div>
	<div id="end">Expense Analysis System</div>
</body>
</html>