<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
.service{
 display: block;
 margin-top: 14px;
 text-align: center;
}
.service a{
 text-decoration: none
}
.checkbox{
 margin-top: 5px;
}
.checkbox input{
 width: 20px;
 height: 20px;
 vertical-align: middle;
}
.checkbox label{
 margin-left: 5px;
 vertical-align: middle;
}
</style>

<div class="wrap">
	<h1>로그인</h1>
	<table>
		<tr>
			<td><input type="text" id="id" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><input type="password" id="pw" placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td><div class="checkbox"><input type="checkbox" id="keep"><label for="keep">로그인 상태 유지</label></div></td>
		</tr>
		<tr>
			<td><button onclick="onClickSignin()">로그인</button></td>
		</tr>
		<tr>
			<td class="service"><a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="/signup">회원가입</a></td>
		</tr>
	</table>
</div>
<script>
function onClickSignin(){
	const id = $('#id').val()
	const pw = $('#pw').val()
	
	if(id == null || id === ''){
		alert('아이디를 입력해주세요.')
		return
	}
	
	if(pw == null || pw === ''){
		alert('비밀번호를 입력해주세요.')
		return
	}
	
	var data = {
		username: id,
		password: pw
	}
	
	$.ajax({
		type: 'POST',
		url: '/api/signin',
		data: JSON.stringify(data),
		contentType: 'application/json; charset=utf-8',
		contentLength: JSON.stringify(data).length,
		dataType: 'text', 
		success: function(data, status, xhr){
			if(status === 'success'){
				location.href='/'
			}
		},
		error: function(xhr, status, error){
			if(xhr.status === 404){
				alert(xhr.responseText)	
			}
			else{
				alert('서버와의 통신 중 문제가 발생했습니다.(error code: ' + xhr.status + ', message: ' + xhr.responseText + ')')	
			}
		}
	})
}
</script>