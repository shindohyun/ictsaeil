<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" 
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>

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

function onClickRestApi(){
	var data={
		name: '김현아'
	}
	
	$.ajax({
   		type: 'PUT',
		url: '/api/users/1',
		//data: data,
		data: JSON.stringify(data),
		contentType:'application/json; charset=utf-8',
		contentLength: JSON.stringify(data).length,
		success: function(data, status, xhr) {
			console.log('success!')
		},
		error : function(xhr, status, error){
			console.log('error!')
		},
		complete: function(xhr, status){
			console.log('complete!')
		}
   	});
	
	/* data: JSON.stringify(data),
	contentType:'application/json; charset=utf-8',
	contentLength: JSON.stringify(data).length, */
}
</script>

Main
<br/>
<input type="text" id="name" placeholder="name">
<input type="text" id="age" placeholder="age">
<button onclick="onClickSearchMember()">Search Member</button>
<br/>
<button onclick="onClickRestApi()">CALL REST API</button>