<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
/* 페이지 요청 방식1. location.href
function onClickSearchMember(){
	var name = document.getElementById("name").value
	var age = document.getElementById("age").value
	
	location.href="/member?name="+name+"&age="+age
}
*/

/* 페이지 요청 방식2. Form Submit
function onClickSearchMember(){
	var name = document.getElementById("name").value
	var age = document.getElementById("age").value
	
	var form = document.createElement("form")
	form.action = "/member"
	form.method = "get"
	
	var elName = document.createElement("input")
	elName.setAttribute("type", "hidden")
	elName.setAttribute('name', 'name')
	elName.setAttribute("value", name)
	form.appendChild(elName)
	
	var elAge = document.createElement("input")
	elAge.setAttribute("type", "hidden")
	elAge.setAttribute('name', 'age')
	elAge.setAttribute("value", age)
	form.appendChild(elAge)
	
	document.body.appendChild(form)
	form.submit()	
}
*/

// 페이지 요청 방식2. Form Submit - post
function onClickSearchMember(){
	var name = document.getElementById("name").value
	var age = document.getElementById("age").value
	
	var form = document.createElement("form")
	form.action = "/member"
	form.method = "post"
	
	var elName = document.createElement("input")
	elName.setAttribute("type", "hidden")
	elName.setAttribute('name', 'name')
	elName.setAttribute("value", name)
	form.appendChild(elName)
	
	var elAge = document.createElement("input")
	elAge.setAttribute("type", "hidden")
	elAge.setAttribute('name', 'age')
	elAge.setAttribute("value", age)
	form.appendChild(elAge)
	
	document.body.appendChild(form)
	form.submit()	
}
</script>

Main
<br/>
<input type="text" id="name" placeholder="name">
<input type="text" id="age" placeholder="age">
<button onclick="onClickSearchMember()">Search Member</button>