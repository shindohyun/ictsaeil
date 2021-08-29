<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICTSaeil</title>
<style>
	html,body {
		margin:0; 
		padding:0; 
		width:100%; 
		height:100%
	}
	.container {
		display: flex;
		min-height: 100%;
	}	
</style>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	
	<div class="container">
		<tiles:insertAttribute name="sidebar"/>
		<tiles:insertAttribute name="contents"/>
	</div>
	
	<tiles:insertAttribute name="footer"/>
</body>
</html>