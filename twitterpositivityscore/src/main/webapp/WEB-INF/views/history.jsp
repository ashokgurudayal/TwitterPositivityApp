<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/externaljs.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/style.css"
	rel="stylesheet">
<title>Twitter Extractor</title>
<script type="text/javascript">
$(document).ready(function(){
var storedNames = JSON.parse(localStorage.getItem("names"));
var htmlVal = "<table id=\"divtable\"><tr><th>SlNo.</th><th>Date</th><th>Topic</th><th>No. of Tweets</th><th>Positivity Score</th></tr>";
for(i=0;i<storedNames.length;i+=5){
	htmlVal = htmlVal.concat("<tr>")
	htmlVal = htmlVal.concat("<td>"+storedNames[i]+"</td>")
	htmlVal = htmlVal.concat("<td>"+storedNames[i+1]+"</td>")
	htmlVal = htmlVal.concat("<td>"+storedNames[i+2]+"</td>")
	htmlVal = htmlVal.concat("<td>"+storedNames[i+3]+"</td>")
	htmlVal = htmlVal.concat("<td>"+storedNames[i+4]+"</td>")
	htmlVal = htmlVal.concat("</tr>")
}
htmlVal = htmlVal.concat("</table>")
$("#testresult").html(htmlVal)
});
</script>
</head>
<body>

	<div data-include="header"></div>
	<div id="testresult" align="center"></div>
	
	
</body>
</html>
