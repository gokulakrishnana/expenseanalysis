<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit!</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet/weblayout.css"/>
<link rel="stylesheet" type="text/css" href="stylesheet/style1.css">
</head>
<body>

<script>

function execute(X){
	var keyid      = "key" + X;
	var categoryid = "category" + X;
	var selcategoryid = "selcategory" +  X;
	var Deleteid = "Delete" + X;
	var keyvalue = document.getElementById(keyid).value
	var categoryvalue = document.getElementById(categoryid).value
	var selcategoryvalue  = keyvalue + "!" + categoryvalue;
	document.getElementById(selcategoryid).value = selcategoryvalue
	document.getElementById(Deleteid).checked=false;
}
function delfunction(X){
	var keyid      = "key" + X;
	var selcategoryid = "selcategory" +  X;
	document.getElementById(selcategoryid).value = "MISC";
}
</script>
<div id="header">Edit Data Screen </div>
<div id="nav"><a href="index.jsp" class="navigationbar"> Home</a></div>
<div id="section">

<p id="demo"></p>
	<% List<String> fileLine = (List<String>) session.getAttribute("filelines");
		List<String> catgline = (List<String>) session.getAttribute("catglines");
	int i =0;
	%>
	<form method="post" action="ProcessEditData">
		<table class="uploadtable">
			<tr>
				<td class="headingupload">Del</td>
<!-- 				<td class="headingupload">Key</td> -->
				<td class="headingupload">Value Date</td>
				<td class="headingupload">Transaction Date</td>
				<td class="headingupload">Remarks</td>
				<td class="headingupload">Cr/Db</td>
				<td class="headingupload">Amt</td>
				<td class="headingupload">Category</td>
			</tr>
			<%
    for(String line:fileLine)
   {
    String strar[] = line.split(",");
    %>
			<tr>
				<td class="uploadtable">
				<input id="Delete<%=strar[0]%>" name ="DeleteLines" type="checkbox"  size="3" value="Delete<%=strar[0]%>" onclick="delfunction(<%=strar[0]%>)">
				<input id="key<%=strar[0]%>" type="text" readonly size="3" value="<%=strar[0]%>" hidden></td>
<%-- 				<td class="uploadtable"><input id="key<%=strar[0]%>" type="text" readonly size="3" value="<%=strar[0]%>" hidden></td> --%>
				<td class="uploadtable"><%=strar[1]%></td>
				<td class="uploadtable"><%=strar[2]%></td>
				<td class="uploadtable"><%=strar[3]%></td>
				<td class="uploadtable"><%=strar[4]%></td>		
				<td class="uploadtable"><%=strar[5]%></td>	
				<td class="uploadtable">	
				<input id="selcategory<%=strar[0]%>"type="text" name="selcategory" value=""  hidden readonly>
				
				<select id="category<%=strar[0]%>" name="category" onchange="execute(<%=strar[0]%>)" >
				<% for (String catg:catgline){
				if (strar[6].trim().equals(catg.trim())){%>
					<option name="category" selected ><%=catg %></option>
				<%} else{%>
					<option name="category"><%=catg %></option>	
				<%}} %>
				</select>
				</td>								
			</tr>
			<%}%>
		<tr>
		<td class="uploadtable" colspan="7" align="center"> <input type="submit" value="Submit"></td>
		</tr>	
		</table>
		
</form>
</div>		
<div id="arti">Check for Deleting and Select Category for Updating. Then submit the form. </div>
<div id="end">Expense Analysis System</div>
</body>
</html>