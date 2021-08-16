<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
// 페이지 요청 방식1. location.href
/*function onClickSearchMember(){
	var name = document.getElementById("name").value
	var age = document.getElementById("age").value
	
	location.href="/member?name="+name+"&age="+age
}*/

// 페이지 요청 방식2. Form Submit
/*function onClickSearchMember(){
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
}*/

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
	//var data={
	//	name: '김현아',
	//}
	
	$.ajax({
   		type: 'GET',
		url: '/api/users',
		//data: data,
		//data: JSON.stringify(data),	
		//contentType:'application/json; charset=utf-8',
		//contentLength: JSON.stringify(data).length, 
		success: function(data, status, xhr) {
			console.log("data: " + data + ", status: " + status)
			console.log(xhr)
		},
		error : function(xhr, status, error){
			console.log("status: " + status + ", error: " + error)
			console.log(xhr)
		},
		complete: function(xhr, status){
			console.log("complete!")
		}
   	});
}
</script>

Main
<br/>
<input type="text" id="name" placeholder="name">
<input type="text" id="age" placeholder="age">
<button onclick="onClickSearchMember()">Search Member</button>
<br/>
<button onclick="onClickRestApi()">CALL REST API</button>