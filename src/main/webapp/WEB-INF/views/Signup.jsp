<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
.signup-info-form {
 margin: auto;
}
.signup-info-form label{
 font-size: 20px;
}
.signup-info-form input{
 width: 300px;
 height: 30px;
 font-size: 20px;
 margin-left: 28px;
 margin-right: 8px;
}
.signup-info-form button{
 padding: 6px 12px 6px 12px;
 font-size: 18px;
 background: #5c7792;
 color: #ffffff;
 border: none;
}
.signup-info-form button:hover{
 background: #436d96;
}
.signup-info-form button:active{
 background: #8392a0;
}
.signup-info-form .submit{
 width: 100%;
 margin-top: 30px;
 display: flex;
}
.signup-info-form .submit button{
 background: #4caf50;
 font-size: 28px;
 margin: auto;
 padding: 15px 25px
}
.signup-info-form .submit button:hover{
 background: #48A44B
}
.signup-info-form .submit button:active{
 background: #3c8f3f
}
.signup-info-form .submit button:disabled{
 background: #878a87
}
.validation{
 color: red;
 margin: 0px 0px 0px 28px;
}
</style>

<form class="signup-info-form">
	<h1>회원가입</h1>
	<table>
		<!-- 아이디 -->
		<tr>
			<td><label>*아이디</label></td>
			<td><input type="text" id="id"/></td>
			<td><button type="button">중복검사</button></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-id">temp</p></td>
		</tr>
		
		<!-- 비밀번호 -->
		<tr>
			<td><label>*비밀번호</label></td>
			<td><input type="text" id="pw"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-pw">temp</p></td>
		</tr>
		
		<!-- 비밀번호 재확인 -->
		<tr>
			<td><label>비밀번호 재확인</label></td>
			<td><input type="text" id="pw-re"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-pw-re">temp</p></td>
		</tr>
		
		<!-- 이름 -->
		<tr>
			<td><label>*이름</label></td>
			<td><input type="text" id="name"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-name">temp</p></td>
		</tr>
		
		<!-- 나이 -->
		<tr>
			<td><label>나이</label></td>
			<td><input type="text" id="age"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-age">temp</p></td>
		</tr>
		
		<!-- 이메일 -->
		<tr>
			<td><label>이메일</label></td>
			<td><input type="text" id="email"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-email">temp</p></td>
		</tr>
		
		<!-- 전화번호 -->
		<tr>
			<td><label>*전화번호</label></td>
			<td><input type="text" id="mobile"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-mobile">temp</p></td>
		</tr>
	</table>
	<div class="submit">
		<button>가입하기</button>
	</div>
</form>	
