<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">

	</script>
</head>
<body>
	<h1>Sample2 Page</h1>
	
	<c:if test="${!DATA}">${DATA}</c:if>
	
	<c:if test="${!empty OBJ_DATA}">
		${OBJ_DATA.stringData}<br>
		${OBJ_DATA.intData}
	</c:if>
	
	<c:if test="${!empty MAP_DATA}">
		${MAP_DATA.STRING_DATA}<br>
		${MAP_DATA.INT_DATA}
	</c:if>
	
	<c:if test="${!empty LIST_DATA}">
		<c:forEach var="item" items="${LIST_DATA}">
			${item}<br>
		</c:forEach>
	</c:if>
	
	<c:if test="${!empty MAP_LIST_DATA}">
		<c:forEach var="map" items="${MAP_LIST_DATA}">
			${map.STRING_DATA}, ${map.INT_DATA}<br>
		</c:forEach>
	</c:if>
	
	<c:if test="${!empty OBJ_LIST_DATA}">
		<c:forEach var="obj" items="${OBJ_LIST_DATA}">
			${obj.stringData}, ${obj.intData}<br>
		</c:forEach>
	</c:if>
	
	<c:if test="${!empty FORM_DATA}">
		${FORM_DATA}
	</c:if>
</body>
</html>