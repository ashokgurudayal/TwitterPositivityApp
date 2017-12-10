<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feeds</title>
<link href="${pageContext.request.contextPath}/resources/style.css"
	rel="stylesheet">
	
<!-- for google charts --> 
<script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js">
      </script>
      <script type = "text/javascript">
         google.charts.load('current', {packages: ['corechart']});     
      </script>
<!--  -->
      
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/externaljs.js"></script>
<script>
function Create2DArray(rows,columns) {
	   var x = new Array(rows);
	   for (var i = 0; i < rows; i++) {
	       x[i] = new Array(columns);
	   }
	   return x;
	}
function drawChart(a,b,c) {
    // Define the chart to be drawn.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Browser');
    data.addColumn('number', 'Percentage');
    data.addRows([
       ['Positive', a],
       ['Neutral', b],
       ['Negative', c]
    ]);
       
    // Set chart options
    var options = {
       'title':'Positivity Score:',
       'width':300,
       'height':300,
       'chartArea': {'width': '100%', 'height': '80%'},
       'legend': {'position': 'bottom'},
       'colors':['Green', 'Orange', 'Red']
    };

    // Instantiate and draw the chart.
    var chart = new google.visualization.PieChart(document.getElementById('displaychart'));
    chart.draw(data, options);
 }
 
$(document).ready(function(){
	
	
	$("#searchform").submit(function(){
		$.ajax({
			url: 'http://localhost:8081/querytweet',
			type: 'GET',
			data: {id:$("#searchform #textname").val(),count:$("#searchform #nooftweets").val()},
			success: function(data){
				var tweets = Create2DArray($("#nooftweets").val(),3);
				var posCount=0,negCount=0,neuCount=0;
				for(i=0;i<$("#searchform #nooftweets").val();i++){
					if(data.positivity[i] == 1){
						tweets[posCount][0] = data.text[i]+"  "+data.date[i];
						posCount++;
					}
					else if(data.positivity[i] == 0){
						tweets[neuCount][1] = data.text[i]+"  "+data.date[i];
						neuCount++;
					}
					else if(data.positivity[i] == -1){
						tweets[negCount][2] = data.text[i]+"  "+data.date[i];
						negCount++;
					}
				}
				console.log(tweets)
				var htmlVal = "<table id=\"divtable\"><tr><th>Positive</th><th>Neutral</th><th>Negative</th></tr>";
				for(i=0;i<Math.max(posCount,negCount,neuCount);i++){
					htmlVal = htmlVal.concat("<tr>")
					htmlVal = htmlVal.concat("<td>"+(tweets[i][0]==undefined?"":tweets[i][0])+"</td>")
					htmlVal = htmlVal.concat("<td>"+(tweets[i][1]==undefined?"":tweets[i][1])+"</td>")
					htmlVal = htmlVal.concat("<td>"+(tweets[i][2]==undefined?"":tweets[i][2])+"</td>")
					htmlVal = htmlVal.concat("</tr>")
				}
				htmlVal = htmlVal.concat("</table>")
				console.log("test"+htmlVal)
				
				$("#displayresults").html(htmlVal)
				
				//$("#divtable").css({'background-color':'#dddddd'})
				$("#displayresults table th").css({'background-color':'#99ccff'})
				$("#displayresults table tr:nth-child(even").css({'background-color':'#ccffdd'})
				//$("table", this).css({'font-family':'arial, sans-serif','border-collapse':'collapse','width':'100%'})
				//$("tr:nth-child(even)", this).css({'background-color':'#dddddd'})
				if(localStorage.getItem("names"))
				var temp = JSON.parse(localStorage.getItem("names"));
				else
					var temp =[]
				var len = temp.length
				var d = new Date()
				
				temp[len] = len/5+1
				temp[len+1] = d.getMonth()+" "+d.getDate()+","+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()
				temp[len+2] = $("#searchform #textname").val()
				temp[len+3] = $("#searchform #nooftweets").val()
				temp[len+4] = parseInt((posCount/($("#searchform #nooftweets").val()))*100)
				
				localStorage.setItem("names", JSON.stringify(temp));
				
				
				drawChart(posCount,neuCount,negCount);
				
			}
		});
		return false;
	});
});
</script>



</head>
<body>
<div data-include="header"></div>
<br>

<div id="leftdiv" style="width:70%;float:left" align="center">
<br><br>
<form id="searchform" >
<label for="textname" style="color:blue;font-family: Times New Roman;"><h3>Enter the search string,number of tweets and press the submit button<h3></h3></label><br>
<input  type="text" style="height:30px" name="textname" id="textname">&nbsp&nbsp&nbsp<input style="width:30px;height:30px"  type="text" name="nooftweets" value=25 id="nooftweets"><br><br>
<input id="submitbutton" type="submit" style="width:70px; height:50px" name="submit" value="SUBMIT">
</form>
</div>
<div id="displaychart" style="margin-left:50%;" align="right"></div>

<div id="displayresults"></div>
</body>
</html>