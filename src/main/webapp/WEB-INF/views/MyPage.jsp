<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
My Page
<table>
	<tr>
		<td><spring:message code="id" text="id"/></td>
		<td><spring:message code="name" text="name"/></td>
		<td><spring:message code="age" text="age"/></td>
		<td><spring:message code="email" text="email"/></td>
		<td><spring:message code="mobile" text="mobile"/></td>
		<td><spring:message code="hello" text="mobile" arguments="도현"/></td>
	</tr>
</table>