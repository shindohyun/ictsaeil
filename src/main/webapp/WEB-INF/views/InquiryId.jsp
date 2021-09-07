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
			<td><button>확인</button></td>
		</tr>
	</table>
</div>