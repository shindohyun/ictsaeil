<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script 
	src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous">
</script>	
<script>
window.onload = function(){
	var locale = getCookie("locale")
	$("#select_locale").val(locale).prop("selected", true)
	
	var userIdx = "${user.idx}"
	if(userIdx == null || typeof userIdx === 'undefined' || userIdx === ''){
		$('.beforeAuth').show()
		$('.afterAuth').hide()
	}
	else{
		console.log(userIdx)
		$('.beforeAuth').hide()
		$('.afterAuth').show()
	}
}

function onClickSignup(){
	location.href="/signup"
}

function onClickSignin(){
	location.href="/signin"
}

function onClickSignout(){
	$.ajax({
		type: 'POST',
		url: '/api/signout',
		dataType: 'text',
		success: function(data, status, xhr){
			if(status === 'success'){
				alert('로그아웃 되었습니다. 메인화면으로 이동합니다.')
				location.href="/"
			}
			else{
				alert('로그아웃을 실패했습니다.')
			}
		},
		error: function(xhr, status, error){
			alert('서버와의 통신 중 문제가 발생했습니다.(error code: ' + status + ', message: ' + error + ')')
		}
	})
}

function onClickMyPage(){
	location.href="/my-page"
}


function onChangeLocale(value){
	setCookie('locale', value)
	location.reload()
}

function getCookie(key){
	var value = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
	return value? value[2] : null;
}

function setCookie(key, value) {
  	document.cookie = key + '=' + value + '; path=/';
}

</script>

<style>
header{
	background:#265686;
	text-align: center;
	color: white;
	display:inline-block;
	width: 100%;
}
header h1{
	margin: 0px;
	padding: 50px 20px 20px 50px;
}
header .menu {
	padding: 14px;
	display:inline-block;
	float: right;
}
header .menu select{
	padding: 15px 15px 15px 15px;
	font-size: 14px;
}
header .menu button{
	padding: 15px 20px 15px 20px;
    border: none;
    font-weight: bold;
    font-size: 16px;
}
.white-button{
	background: white;
}
.white-button:hover{
	background: #efefef;
}
.white-button:active{
	background: #b1b1b1;
}
.green-button{
	background: #4caf50;
	color: white;
}
.green-button:hover{
	background: #48A44B;
}
.green-button:active{
	background: #3c8f3f;
}
.red-button{
	background: #ff5151;
	color: white;
}
.red-button:hover{
	background: #e14949;
}
.red-button:active{
	background: #c84343;
}
</style>

<header>
	<div>
		<h1>대전배재대ICT융합새일센터</h1>
	</div>
	<div class="menu">
		<select id="select_locale" onchange="onChangeLocale(this.value)">
			<option value="ko">한국어</option>
			<option value="en">영어</option>
			<option value="zh">중국어</option>
			<option value="ja">일본어</option>
		</select>
		<button class="beforeAuth white-button" onclick="onClickSignup()">Signup</button>
		<button class="beforeAuth green-button" onclick="onClickSignin()">Signin</button>
		<button class="afterAuth white-button" onclick="onClickMyPage()">My Page</button>
		<button class="afterAuth red-button" onclick="onClickSignout()">Signout</button>
	</div>
</header>