<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		function save() {
			var name = $("#name").val();
			var price = $("#price").val();
			var stock = $("#stock").val();
			
			if(!name) {
				alert("상품명을 입력해주세요.");
				return;
			}
			
			if(!price) {
				alert("가격을 입력해주세요.");
				return;
			}
			
			if(!stock) {
				alert("개수를 입력해주세요.");
				return;
			}
			
			var data = {
					name,
					price,
					stock
			};
			
			$.ajax({
				type: 'POST',
				url: '/product/save',
				data: data,
				success: function(data, status, xhr){
					if(data === true) {
						if (!confirm("저장되었습니다.")) {
							location.href="/product";
						} else {
							location.href="/product";
						}
					} else {
						alert('에러가 발생했습니다.');
					}
				},
				error: function(xhr, status, error){
					alert(xhr.responseText);
				}
			});
		}
	
		function cancel() {
			window.history.back();
		}
	</script>
</head>
<body>
	<h1>Add Product</h1>
	<input type="text" id="name" placeholder="name"><br>
	<input type="text" id="price" placeholder="price"><br>
	<input type="text" id="stock" placeholder="stock"><br>
	<button onclick="save()">save</button>
	<button onclick="cancel()">cancel</button>
</body>
</html>