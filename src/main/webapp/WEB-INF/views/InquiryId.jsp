<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
</style>

<div class="wrap">
	<h1>아이디 찾기</h1>
	<table>
		<tr>
			<td><input type="text" id="name" placeholder="이름"></td>
		</tr>
		<tr>
			<td><input type="text" id="mobile" placeholder="전화번호"></td>
		</tr>
		<tr>
			<td><button onclick="onClickInquiryId()">확인</button></td>
		</tr>
	</table>
</div>

<script>
function onClickInquiryId(){
	const name = $('#name').val()
	const mobile = $('#mobile').val()
	
	if(name == null || name === ''){
		alert('이름을 입력해주세요.')
		return
	}
	
	if(mobile == null || mobile === ''){
		alert('전화번호를 입력해주세요.')
		return
	}
	
	var data = {
		name: name,
		mobile: mobile
	}
	
	$.ajax({
		type: 'POST',
		url: '/api/inquiryid',
		data: JSON.stringify(data),
		contentType: 'application/json; charset=utf-8',
		contentLength: JSON.stringify(data).length,
		dataType: 'json',
		success: function(data, status, xhr){
			if(status === 'success'){
				alert('아이디 찾기 결과: ' + data.id)
				location.href='/signin'
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