<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.wrap {
 margin: auto;
 margin-top: 100px;
}
.wrap h1{
 font-size: 50px;
 margin-bottom: 100px;
}
.wrap .menu{
 width: 100%;
}
.wrap .menu #goto-main{
 background: #f38c8c;
 padding: 20px 20px;
 color: #ffffff;
 font-size: 20px;
 text-decoration:none; 
}
.wrap .menu #goto-signin{
 background: #8dc18f;
 padding: 20px 30px;
 color: #ffffff;
 font-size: 20px;
 text-decoration:none; 
}
</style>

<div class="wrap">
	<h1>${message}</h1>
	<div class="menu">
		<a id="goto-main" href="/">메인화면으로</a>
		<a id="goto-signin" href="/signin">로그인하기</a>
	</div>
</div>
