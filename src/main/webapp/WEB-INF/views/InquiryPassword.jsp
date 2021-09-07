<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/validate.js" type="text/javascript"></script>

<style>
.wrap {
 width: min-content;
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
.wrap button:disabled{
 background: #878a87
}
.validation{
 display: none;
 color: red;
 margin: 0px 0px 0px 0px;
}
</style>

<div class="wrap">
	<h1>비밀번호 재설정</h1>
	<table>
		<tr>
			<td><input class="signup-info-input" type="text" id="id" placeholder="아이디"/></td>
		</tr>
		<tr>
			<td><input class="signup-info-input" type="password" id="pw" placeholder="비밀번호"/></td>
		</tr>
		<tr>
			<td><p class="validation" id="validation-pw"></p></td>
		</tr>
		<tr>
			<td><input class="signup-info-input" type="password" id="pw-re" placeholder="비밀번호 재확인"/></td>
		</tr>
		<tr>
			<td><p class="validation" id="validation-pw-re"></p></td>
		</tr>
		<tr>
			<td><button id="reset" disabled>비밀번호 재설정</button></td>
		</tr>
	</table>
</div>

<script>
$(window).on('load', function(){
	var elements = document.getElementsByClassName("signup-info-input")

	for(let i=0 ; i<elements.length; i++) {
		var element = elements[i]
		$('#'+element.id).on('input', function(event){
			onInput(event)
		})
	}
})

function onInput(event){
	const id = event.target.id
	
	var info = $('#'+id)
	var error = $('#validation-'+id)
	
	const value = info.val()
	var result = false
	var message = ''
	
	if((id === 'pw' || id === 'pw-re') && isEmpty(value)){
		message = ERROR_REQUIRED 
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
	
	changeResetStatus()
}

function changeResetStatus(){
	var elements = document.getElementsByClassName("validation")
	
	for(let i=0 ; i<elements.length; i++) {
		const element = elements[i]
		if(element.style.display === 'block'){
			$('#reset').attr('disabled', true)
			return
		}
	}
	
	if(isEmpty($('#id').val()) 		||
		isEmpty($('#pw').val()) 	||
		isEmpty($('#pw-re').val())){
		$('#reset').attr('disabled', true)
		return
	}
	
	$('#reset').attr('disabled', false)
}
</script>