<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="/js/validate.js" type="text/javascript"></script>

<style>
.wrap {
 width: min-content;
 height: min-content;
 margin: auto;
 margin-bottom: 500px;
}
.wrap input{
 width: 400px;
 height: 30px;
 font-size: 20px;
}
.wrap button{
 width: 100%;
 margin-top: 20px;
 padding: 6px;
 font-size: 18px;
 background: #4caf50;
 color: #ffffff;
 border: none;
}
.wrap button:hover{
 background: #48A44B;
}
.wrap button:active{
 background: #3c8f3f;
}
</style>

<div class="wrap">
	<h1>로그인</h1>
	<table>
		<tr>
			<td><input id="id" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><input type="password" id="pw" placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td><button>로그인</button></td>
		</tr>
	</table>
</div>