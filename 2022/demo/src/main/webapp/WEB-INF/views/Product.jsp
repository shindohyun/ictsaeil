<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product Page</title>
</head>
<body>
	<table>
		<tr>
			<td>IDX</td>
			<td>NAME</td>
			<td>PRICE</td>
			<td>STOCK</td>
			<td>STATUS</td>
		</tr>
		<c:forEach var="product" items="${products}">
		<tr>
			<td>${product.IDX}</td>
			<td>${product.NAME}</td>
			<td>${product.PRICE}</td>
			<td>${product.STOCK}</td>
			<td>${product.STATUS}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>