<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function btnClick1() {
			location.href="/sample/sample2";
		}
		
		function btnClick2() {
			var data = document.getElementById("input1").value;
			
			var form = document.createElement("form");
			form.action = "/sample/sample2-with-form";
			form.method = "post";
			
			var elData = document.createElement("input");
			elData.setAttribute("type", "hidden");
			elData.setAttribute("name", "data");
			elData.setAttribute("value", data);
			form.appendChild(elData);
			
			document.body.appendChild(form);
			form.submit();
		}
		
		function btnClick3() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-string',
				success: function(data) {
					alert(data);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick4() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-int',
				success: function(data) {
					alert(data);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick5() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-obj',
				success: function(data) {
					alert(data.stringData + ", " + data.intData);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick6() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-map',
				success: function(data) {
					alert(data.STRING_DATA + ", " + data.INT_DATA);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick7() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-list',
				success: function(data) {
					var temp = "";
					
					for(let i = 0; i < data.length; i++) {
						temp += data[i];
						temp += ",";
					}
					
					alert(temp);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick8() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-obj-list',
				success: function(data) {
					var temp = "";
					
					for(let i = 0; i < data.length; i++) {
						temp += data[i].intData;
						temp += ",";
						temp += data[i].stringData;
						temp += "\r\n";
					}
					
					alert(temp);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick9() {
			$.ajax({
				type: 'GET',
				url: '/sample/res-map-list',
				success: function(data) {
					var temp = "";
					
					for(let i = 0; i < data.length; i++) {
						temp += data[i].INT_DATA;
						temp += ",";
						temp += data[i].STRING_DATA;
						temp += "\r\n";
					}
					
					alert(temp);
				},
				error: function(error, er) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick10() {
			var stringParam = $("#input2").val();
			var intParam = $("#input3").val();
			
			var data = {
					stringParam,
					intParam
			};
			
			$.ajax({
				type: 'GET',
				url: '/sample/req-param',
				data: data,
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick11() {
			var stringData = $("#input2").val();
			var intData = $("#input3").val();
			
			var data = {
					stringData,
					intData
			};
			
			$.ajax({
				type: 'GET',
				url: '/sample/req-model',
				data: data,
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					alert(error.responseText);
				}
			})	
		}
	
		function btnClick12() {
			var stringData = $("#input2").val();
			var intData = $("#input3").val();
			
			var data = {
					stringData,
					intData
			};
			
			var jsonData = JSON.stringify(data);
			
			$.ajax({
				type: 'POST',
				url: '/sample/req-body',
				data: jsonData,
				contentType: "application/json; charset=UTF-8",
				contentLength: jsonData.length,
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					alert(error.responseText);
				}
			})	
		}
		
		function btnClick13() {
			$.ajax({
				type: 'GET',
				url: '/sample/req-path/TEST',
				success: function(data) {
					alert(data);
				},
				error: function(error) {
					alert(error.responseText);
				}
			})	
		}
	</script>
</head>
<body>
	<h1>Sample Page</h1>
	
	<h3>Sample2 페이지 요청하기</h3>
	<a href="/sample/sample2">요청하기</a><br>
	<a href="/sample/sample2-with-data">데이터와 함께 요청하기</a><br>
	<a href="/sample/sample2-with-obj">Object 데이터와 함께 요청하기</a><br>
	<a href="/sample/sample2-with-map">Map 데이터와 함께 요청하기</a><br>
	<a href="/sample/sample2-with-list">List 데이터와 함께 요청하기</a><br>
	<a href="/sample/sample2-with-map-list">Map List 데이터와 함께 요청하기</a><br>
	<a href="/sample/sample2-with-obj-list">Object List 데이터와 함께 요청하기</a><br>
	<button onclick="btnClick1()">location.href 코드로 페이지 이동하기</button>
	<form action="/sample/sample2-with-form" method="post">
		<input type="text" name="data" placeholder="data"> 
		<input type="submit" value="form 으로 페이지 이동하기">
	</form>
	<div>
		<input type="text" id="input1" placeholder="data">
		<button onclick="btnClick2()">JavaScript로 form 생성해서 페이지 이동하기</button>
	</div>
	<hr>
		<button onclick="btnClick3()">문자열 응답 테스트</button><br>
		<button onclick="btnClick4()">숫자 응답 테스트</button><br>
		<button onclick="btnClick5()">Object 응답 테스트</button><br>
		<button onclick="btnClick6()">Map 응답 테스트</button><br>
		<button onclick="btnClick7()">List 응답 테스트</button><br>
		<button onclick="btnClick8()">Object List 응답 테스트</button><br>
		<button onclick="btnClick9()">Map List 응답 테스트</button><br>
	<hr>
	<div>
		<input type="text" id="input2" placeholder="stringData">
		<input type="text" id="input3" placeholder="intData">
		<button onclick="btnClick10()">RequestParam 테스트</button>
		<button onclick="btnClick11()">ModelAttribute 테스트</button>
		<button onclick="btnClick12()">RequestBody 테스트</button>
	</div>
	<hr>
	<button onclick="btnClick13()">PathVariable 테스트</button>
	<hr>
</body>
</html>