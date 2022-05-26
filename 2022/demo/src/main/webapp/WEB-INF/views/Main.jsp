<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	</script>
</head>
<body>
	Main<br/>
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
</body>
</html>