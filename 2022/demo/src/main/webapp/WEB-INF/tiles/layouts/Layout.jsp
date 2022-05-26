<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ICTSaeil Demo</title>
	<script 
		src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
	</script>
	<style>
		html,body {
			margin:0; 
			padding:0; 
			width:100%; 
			height:100%;
		}
		.container {
			display: flex;
			min-height: 100%;
		}
		.contents {
			width: min-content;
 			margin: auto;
		}
	</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	
	<div class="container">
		<tiles:insertAttribute name="sidebar" />
		
		<div class="contents">
			<tiles:insertAttribute name="contents" />
		</div>
	</div>
	
	<tiles:insertAttribute name="footer" />
</body>
</html>
