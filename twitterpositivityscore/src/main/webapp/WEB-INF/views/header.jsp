<%@page contentType="text/jsp" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
</head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
</script>

<script>
$('a').each(function() {
	if ($(this).prop('href') == window.location.href) {
		$(this).addClass('active');
	}
});

</script>

</head>
<body>
<h1 align="center">
    <image src="${pageContext.request.contextPath}/resources/twitter.png" alt="raspberrypilogo"  style=" max-width:50px; max-height:50px;">
    </image>
    TWITTER POSITIVITY APP
    </h1>
    <div class="topnav">
     
  <a  href="home">HOME</a>
  <a  href="feeds">FEEDS</a>
  <a href="history">HISTORY</a>
 
</div>
</body>
</html>