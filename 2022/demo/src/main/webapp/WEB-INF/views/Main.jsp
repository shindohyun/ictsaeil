<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="/js/validate.js" type="text/javascript"></script>
	<script type="text/javascript">
		function searchMember() {
			const name = document.getElementById("name").value;
			const age = document.getElementById("age").value;
			
			location.href="/member-by-get?name="+name+"&age="+age;
		}
		
		function searchMemberByForm() {
			const name = document.getElementById("name").value;
			const age = document.getElementById("age").value;
			
			const form = document.createElement("form");
			form.action = "/member-by-post-obj-param";
			form.method = "post";
			
			const elName = document.createElement("input");
			elName.setAttribute("type", "hidden");
			elName.setAttribute("name", "name");
			elName.setAttribute("value", name);
			form.appendChild(elName);
			
			const elAge = document.createElement("input");
			elAge.setAttribute("type", "hidden");
			elAge.setAttribute("name", "age");
			elAge.setAttribute("value", age);
			form.appendChild(elAge);
			
			document.body.appendChild(form);
			form.submit();
		}
		
		function callRestApi() {
			$.ajax({
				type: 'GET',
				url: '/api/users',
				success: function(data, status, xhr) {
					console.log('data: ' + data + ", status: " + status);
					console.log(xhr);
				},
				error: function(xhr, status, error) {
					console.log('error!');
				},
				complete: function(xhr, status) {
					console.log('complete!');
				}
			});
			
			/*
			const data = {
					name: '김현아'
			}
			
			$.ajax({
				type: 'POST',
				url: '/api/user',
				data: JSON.stringify(data),
				contentType: 'application/json; charset=utf-8',
				contentLength: JSON.stringify(data).length,
				success: function(data, status, xhr) {
					console.log('success!');
				},
				error: function(xhr, status, error) {
					console.log('error!');
				},
				complete: function(xhr, status) {
					console.log('complete!');
				}
			});
			*/
		}
		
		function checkRegExp(){
			const regex = new RegExp($("#regex").val());
			const test = $("#regex-test").val();
			
			if(regex.test(test)) {
				alert("success!");
			} else {
				alert("fail!");
			}
		}
		
		function onClickValidateId() {
			const id = $("#validate-id").val();
			
			if(isEmpty(id)) {
				alert("값을 입력해주세요.");
				return;
			}
			
			if(validateId(id)) {
				alert("성공!");
			} else {
				alert("아이디 형식이 아닙니다.");
			}
		}
		
		function onClickValidatePassword() {
			const password = $("#validate-password").val();
			
			if(isEmpty(password)) {
				alert("값을 입력해주세요.");
				return;
			}
			
			if(validatePassword(password)) {
				alert("성공!");
			} else {
				alert("비밀번호 형식이 아닙니다.");
			}
		}
		
		function onClickValidateName() {
			const name = $("#validate-name").val();
			
			if(isEmpty(name)) {
				alert("값을 입력해주세요.");
				return;
			}
			
			if(validateName(name)) {
				alert("성공!");
			} else {
				alert("이름 형식이 아닙니다.");
			}
		}
		
		function onClickValidateEmail() {
			const email = $("#validate-email").val();
			
			if(isEmpty(email)) {
				alert("값을 입력해주세요.");
				return;
			}
			
			if(validateEmail(email)) {
				alert("성공!");
			} else {
				alert("이메일 형식이 아닙니다.");
			}
		}
		
		function onClickValidateMobile() {
			const mobile = $("#validate-mobile").val();
			
			if(isEmpty(mobile)) {
				alert("값을 입력해주세요.");
				return;
			}
			
			if(validateMobile(mobile)) {
				alert("성공!");
			} else {
				alert("전화번호 형식이 아닙니다.");
			}
		}
	</script>
</head>
<body>
	Main<br/>
	<table>
		<tr>
			<td><spring:message code="unknown"/></td>
			<td><spring:message code="id"/></td>
			<td><spring:message code="name"/></td>
			<td><spring:message code="age"/></td>
			<td><spring:message code="email"/></td>
			<td><spring:message code="mobile"/></td>
			<td><spring:message code="hello" arguments="도현, 신"/></td>
		</tr>
	</table>
	<input type="text" id="name" placeholder="name">
	<input type="text" id="age" placeholder="age">
	<button onclick="searchMember()">Search Member</button>
	<button onclick="searchMemberByForm()">Search Member By Form</button>
	----------------------<br>	
	<form action="/member-by-get-obj-param" method="get">
		<input type="text" name="name" placeholder="name"/>
		<input type="text" name="age" placeholder="age"/>
		<input type="submit" value="Search Member"/>
	</form>
	----------------------<br>
	<button onclick="callRestApi()">Call REST API</button>
	----------------------<br>
	/<input type="text" id="regex" placeholder="reg exp">/
	<br>
	<input type="text" id="regex-test" placeholder="test">
	<br>
	<button onclick="checkRegExp()">check</button>
	<br>
	<input type="text" id="validate-id"><button onclick="onClickValidateId()">validate id</button><br>
	<input type="text" id="validate-password"><button onclick="onClickValidatePassword()">validate password</button><br>
	<input type="text" id="validate-name"><button onclick="onClickValidateName()">validate name</button><br>
	<input type="text" id="validate-email"><button onclick="onClickValidateEmail()">validate email</button><br>
	<input type="text" id="validate-mobile"><button onclick="onClickValidateMobile()">validate mobile</button><br>
</body>
</html>