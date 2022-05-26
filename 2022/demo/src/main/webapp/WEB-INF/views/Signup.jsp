<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Signup Page</title>
	<script 
		src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
	</script>
	<script defer>
		const auth = true;
		
		window.onload = function(){
			if(auth){
				$('.beforeAuth').show();
				$('.afterAuth').hide();
			}
			else{
				$('.beforeAuth').hide();
				$('.afterAuth').show();
			}
		}
	
		function signup(){
			location.href="/signup";
		}
	
		function signin(){
			location.href="/signin";
		}
	
		function signout(){
			console.log('signout');
		}
	
		function myPage(){
			location.href="/my-page";
		}
	</script>
	<style>
		/* Layout */
		html,body {
			margin:0; 
			padding:0; 
			width:100%; 
			height:100%;
		}
		.container {
			display: flex;
			min-height: 100%;
		}
		.contents {
			width: min-content;
 			margin: auto;
		}
		/* Header */
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
		/* Sidebar */
		.sidebar {
			background: #e0e0e0;
			padding: 10px 50px;
			color: #265686;
		}
		.sidebar a{
			display: block;
			margin-top: 10px;
			font-size: 16px;
		}
		/* Footer */
		footer {
			padding:30px 0;
			background: #333;
			color:#fff;
			background:#265686;
			text-align: center;
			color: white;
			font-size: 13px;
			text-align: left;
		}
		footer div {
			padding: 0px 20px 0px 20px;
		}
	</style>
</head>
<body>
	<!-- Header -->
	<header>
		<h1>여성새로일하기센터 미래 ICT융합 직업교육 Spring 강의</h1>
		<div class="menu">
			<button class="beforeAuth white-button" onclick="signup()">Signup</button>
			<button class="beforeAuth green-button" onclick="signin()">Signin</button>
			<button class="afterAuth white-button" onclick="myPage()">My Page</button>
			<button class="afterAuth red-button" onclick="signout()">Signout</button>
		</div>
	</header>
	
	<!-- Container -->
	<div class="container">
		<!-- Sidebar -->
		<div class="sidebar">
			<h3>Menu</h3>
			<a href="/">Main</a>
			<a href="/my-page">My Page</a>
			<a href="/product">Product</a>
		</div>
		
		<!-- Contents -->
		<div class="contents">
			Signup
		</div>
	</div>
	
	<!-- Footer -->
	<footer>
		<div>
			<p>
			여성새로일하기센터 | (34015) 대전광역시 유성구 테크노 1로 11-3(관평동 1337) 배재대학교 대덕밸리캠퍼스 C203호<br/>
			대표. XXX | TEL. 042-123-456 | FAX. 070-1234-5678 | Email. ictsaeil@demo.ac.kr<br/>
			당사는 모든 이미지의 무단사용을 금하며, 무단사용시 저작권법 98조에 의거 민형사상 책임을 지게됩니다.<br/>
			Copyright ⓒ XXXXXX. All Rights reserved.
			</p>
		</div>
	</footer>
</body>
</html>