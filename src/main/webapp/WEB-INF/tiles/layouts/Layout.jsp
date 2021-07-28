<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ICTSaeil</title>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	
	<div class="container">
		<tiles:insertAttribute name="sidebar"/>
		
		<div class="contents">
			<div class="contents-wrap">
				<tiles:insertAttribute name="contents"/>
			</div>
		</div>
	</div>
	
	<tiles:insertAttribute name="footer"/>
</body>
</html>


<style>
html {
	margin:0;
	padding:0;
   	height:100%;
   	display:flex;
   	flex-direction: column;
}
body {
	margin:0;
	padding:0;
	height:100%;
	min-height:100%;
	position:relative;
	padding-bottom:100px;
	display:flex;
	flex-direction: column;
}
.container {
	display: flex;
	height:100%;
}	
.contents {
	display: flex;
	width: 100%;
	height: 100%;
}
.contents-wrap {
	margin: auto;
}
</style>