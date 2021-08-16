<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script 
	src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous">
</script>	
<script>
const isAuth = false

window.onload = function(){
	var locale = getCookie("locale")
	$("#select_locale").val(locale).prop("selected", true)
	
	var elements = []
	
	if(isAuth) { elements = document.getElementsByClassName("beforeAuth") }
	else { elements = document.getElementsByClassName("afterAuth") }

	for(var i = 0; i < elements.length; i++){
		elements[i].style.display = "none"
	}
}

function onClickSignup(){
	location.href="/signup"
}

function onClickSignin(){
	location.href="/signin"
}

function onClickSignout(){
	location.href="/"
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
header {
	background:#265686;
	text-align: center;
	padding: 50px 50px 10px 50px;
	color: white;
}
header .menu {
	float: right;
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
	<h1>대전배재대ICT융합새일센터</h1><br>
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