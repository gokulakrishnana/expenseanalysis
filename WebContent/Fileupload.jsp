<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CSV Upload</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet/style1.css">
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css"/>
</head>
<body>
<div id="header">File Upload Response Screen </div>
<div id="nav"><a href="index.jsp" class="navigationbar"> Home</a></div>
<div id="section">
	<% List<String> thisLine = (List<String>) session.getAttribute("filelines");
	int i =0;
	%>
	<form method="post">
		<table class="uploadtable">
			<tr>
				<td class="headingupload">Start Date</td>
				<td class="headingupload">End Date</td>
				<td class="headingupload">Remarks</td>
				<td class="headingupload">Cr/Db</td>
				<td class="headingupload">Amt</td>
				<td class="headingupload">Balance</td>
			</tr>
			<%
    for(String line:thisLine)
   {
    String strar[] = line.split(",");
    %>
			<tr>
				<td class="uploadtable"><%=strar[0]%></td>
				<td class="uploadtable"><%=strar[1]%></td>
				<td class="uploadtable"><%=strar[2]%></td>
				<td class="uploadtable"><%=strar[3]%></td>
				<td class="uploadtable"><%=strar[4]%></td>		
				<td class="uploadtable"><%=strar[5]%></td>										
			</tr>
			<%}%>
		</table>
</div>
<div id="arti"></div>
<div id="end">Expense Analysis System</div>	
</body>
</html>