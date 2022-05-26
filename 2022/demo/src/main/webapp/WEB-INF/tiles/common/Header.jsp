<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<style type="text/css">
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
</head>
<body>
	<header>
		<h1>여성새로일하기센터 미래 ICT융합 직업교육 Spring 강의</h1>
		<div class="menu">
			<button class="beforeAuth white-button" onclick="signup()">Signup</button>
			<button class="beforeAuth green-button" onclick="signin()">Signin</button>
			<button class="afterAuth white-button" onclick="myPage()">My Page</button>
			<button class="afterAuth red-button" onclick="signout()">Signout</button>
		</div>
	</header>
</body>
</html>