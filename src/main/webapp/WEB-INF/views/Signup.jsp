<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="/js/validate.js" type="text/javascript"></script>

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
 display: none;
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
			<!-- <td><input class="signup-info-input" type="text" id="id" onfocusout="onFocusOut(event)"/></td>  -->
			<td><input class="signup-info-input" type="text" id="id"/></td>
			<td><button type="button">중복검사</button></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-id"></p></td>
		</tr>
		
		<!-- 비밀번호 -->
		<tr>
			<td><label>*비밀번호</label></td>
			<td><input class="signup-info-input" type="password" id="pw"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-pw"></p></td>
		</tr>
		
		<!-- 비밀번호 재확인 -->
		<tr>
			<td><label>*비밀번호 재확인</label></td>
			<td><input class="signup-info-input" type="password" id="pw-re"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-pw-re"></p></td>
		</tr>
		
		<!-- 이름 -->
		<tr>
			<td><label>*이름</label></td>
			<td><input class="signup-info-input" type="text" id="name"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-name"></p></td>
		</tr>
		
		<!-- 나이 -->
		<tr>
			<td><label>나이</label></td>
			<td><input class="signup-info-input" type="text" id="age"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-age">나이는 숫자 1~3자리 입니다.</p></td>
		</tr>
		
		<!-- 이메일 -->
		<tr>
			<td><label>이메일</label></td>
			<td><input class="signup-info-input" type="text" id="email"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-email"></p></td>
		</tr>
		
		<!-- 전화번호 -->
		<tr>
			<td><label>*전화번호</label></td>
			<td><input class="signup-info-input" type="text" id="mobile"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><p class="validation" id="validation-mobile"></p></td>
		</tr>
	</table>
	<div class="submit">
		<button>가입하기</button>
	</div>
</form>	

<script>
const ERROR_REQUIRED = '필수 항목입니다.'

$(window).on('load', function(){
	var elements = document.getElementsByClassName("signup-info-input")

	for(let i=0 ; i<elements.length; i++) {
		var element = elements[i]
		$('#'+element.id).on('focusout', function(event){
			onFocusOut(event)
		})
	}
})

function onFocusOut(event){
	const id = event.target.id
	
	var info = $('#'+id)
	var error = $('#validation-'+id)
	
	const value = info.val()
	var result = false
	var message = ''
	
	if((id === 'id' || id === 'pw' || id === 'pw-re' || id === 'name' || id === 'mobile') && isEmpty(value)){
		if(isEmpty(value)){
			message = ERROR_REQUIRED 
		} 
	}
	else if(id === 'id' && !validateId(value)){
		message = "아이디는 영문 대소문자, 숫자, 특수문자 '_' 허용 4~12자리 입니다."
	}
	else if(id === 'pw' && !validatePassword(value)){
		message = "비밀번호는 영문 대소문자, 숫자, 특수문자 조합 8~20자리 입니다."
	}
	else if(id === 'pw-re' && value != $('#pw').val()){
		message = "비밀번호가 일치하지 않습니다."
	}
	else if(id === 'name' && !validateName(value)){
		message = "이름은 한글 또는 영문 대소문자 2~20자리 입니다."
	}
	else if(id === 'age' && value != '' && !validateAge(value)){
		message = "나이는 숫자 1~3자리 입니다."
	}
	else if(id === 'email' && value != '' && !validateEmail(value)){
		message = "이메일 형식이 아닙니다."
	}
	else if(id === 'mobile' && !validateMobile(value)){
		message = "전화번호는 (-)을 포함한 형식입니다."
	}
	else{
		result = true
	}
	
	if(result){
		error.hide()
	}
	else{
		error.text(message)
		error.show()
	}
}
</script>