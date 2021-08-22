<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="/js/validate.js" type="text/javascript"></script>
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

function onCheckRegExp(){
	const regex = new RegExp($("#regex").val())
	const test = $("#regex-test").val()
	
	if(regex.test(test)){
		alert("success!")
	}
	else{
		alert("fail!")
	}
}

function onClickValidateId(){
	var id = $("#validate-id").val()
	if(isEmpty(id)){
		alert('값을 입력해주세요.')
		return
	}
	
	if(validateId(id)){
		alert('성공!')
	}
	else{
		alert('아이디 형식이 아닙니다.')
	}
}

function onClickValidatePassword(){
	var password = $("#validate-password").val()
	if(isEmpty(password)){
		alert('값을 입력해주세요.')
		return
	}
	
	if(validatePassword(password)){
		alert('성공!')
	}
	else{
		alert('비밀번호 형식이 아닙니다.')
	}
}

function onClickValidateName(){
	var name = $("#validate-name").val()
	if(isEmpty(name)){
		alert('값을 입력해주세요.')
		return
	}
	
	if(validateName(name)){
		alert('성공!')
	}
	else{
		alert('이름 형식이 아닙니다.')
	}
}

function onClickValidateEmail(){
	var email = $("#validate-email").val()
	if(isEmpty(email)){
		alert('값을 입력해주세요.')
		return
	}
	
	if(validateEmail(email)){
		alert('성공!')
	}
	else{
		alert('이메일 형식이 아닙니다.')
	}
}

function onClickValidateMobile(){
	var mobile = $("#validate-mobile").val()
	if(isEmpty(mobile)){
		alert('값을 입력해주세요.')
		return
	}
	
	if(validateMobile(mobile)){
		alert('성공!')
	}
	else{
		alert('전화번호 형식이 아닙니다.')
	}
}
</script>

Main
<br/>
<input type="text" id="name" placeholder="name">
<input type="text" id="age" placeholder="age">
<button onclick="onClickSearchMember()">Search Member</button>
<br/>
<button onclick="onClickRestApi()">CALL REST API</button>

<br/>
<br/>
/<input type="text" id="regex" placeholder="reg exp">/
<br/>
<input type="text" id="regex-test" placeholder="test">
<br/>
<button onclick="onCheckRegExp()">check</button>


<br>
<br>
<input type="text" id="validate-id"><button onclick="onClickValidateId()">validate id</button><br>
<input type="text" id="validate-password"><button onclick="onClickValidatePassword()">validate password</button><br>
<input type="text" id="validate-name"><button onclick="onClickValidateName()">validate name</button><br>
<input type="text" id="validate-email"><button onclick="onClickValidateEmail()">validate email</button><br>
<input type="text" id="validate-mobile"><button onclick="onClickValidateMobile()">validate mobile</button><br>
