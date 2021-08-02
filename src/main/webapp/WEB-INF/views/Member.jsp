<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<tr>
		<td>IDX</td>
		<td>ID</td>
		<td>PASSWORD</td>
   		<td>NAME</td>
   		<td>AGE</td>
   		<td>EMAIL</td>
   		<td>MOBILE</td>
	</tr>
	<c:forEach var="user" items="${member}">
	<tr>
		<td>${user.IDX}</td>
     	<td>${user.ID}</td>
     	<td>${user.PASSWORD}</td>
   		<td>${user.NAME}</td>
   		<td>${user.AGE}</td>
   		<td>${user.EMAIL}</td>
   		<td>${user.MOBILE}</td>
	</tr>  
	</c:forEach>
</table>