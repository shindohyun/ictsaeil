<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ICTSaeil</title>
</head>

<body>
	<!-- Header -->
	<div class="header">
		<h1>대전배재대ICT융합새일센터</h1><br>
		<div class="menu">
			<button class="beforeAuth white-button" onclick="onClickSignup()">Signup</button>
			<button class="beforeAuth green-button" onclick="onClickSignin()">Signin</button>
			<button class="afterAuth white-button" onclick="onClickMyPage()">My Page</button>
			<button class="afterAuth red-button" onclick="onClickSignout()">Signout</button>
		</div>
	</div>
	
	<div class="middle">
		<!-- Sidebar -->
		<div class="sidebar">
			<h3>Menu</h3>
			<a href="/">Main</a>
			<a href="/my-page">My Page</a>
		    <a href="/product">Product</a>
		</div>
		
		<!-- Contents -->
		<div class="contents">
			<div style="margin: auto">
				Signin
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<footer class="footer">
		<div>
			<p>
			대전배재대ICT융합새일센터 | (34015) 대전광역시 유성구 테크노 1로 11-3(관평동 1337) 배재대학교 대덕밸리캠퍼스 C203호<br/>
			대표. XXX | TEL. 042-123-456 | FAX. 070-1234-5678 | Email. ictsaeil@sample.ac.kr<br/>
			당사는 모든 이미지의 무단사용을 금하며, 무단사용시 저작권법 98조에 의거 민형사상 책임을 지게됩니다.<br/>
			Copyright ⓒ XXXXXX. All Rights reserved.
			</p>
		</div>
	</footer>
</body>
</html>

<script>
const isAuth = false

window.onload = function(){
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
</script>

<style>
html {
	margin:0;
	padding:0;
   	height:100%;
   	display:flex;
   	flex-direction: column;
}
body {
	margin:0;
	padding:0;
	height:100%;
	min-height:100%;
	position:relative;
	padding-bottom:100px;
	display:flex;
	flex-direction: column;
}
.header {
	background:#265686;
	text-align: center;
	padding: 50px 50px 10px 50px;
	color: white;
}
.header .menu {
	float: right;
}
.header .menu button{
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
.footer {
	width:100%;
	height:100px;
	position:absolute;
	bottom:0;
	background:#265686;
	text-align: center;
	color: white;
	font-size: 13px;
	text-align: left;
}
.footer div {
	padding: 0px 20px 0px 20px;
}
.middle {
	display: flex;
	height:100%;
}	
.sidebar {
	display: block;
	width:200px;
	height: 100%;
	background: #e0e0e0;
	padding: 20px;
	color: #265686;
}
.contents {
	display: flex;
	width: 100%;
	height: 100%;
}
.sidebar a{
	display: block;
	margin-top: 10px;
}
</style>
