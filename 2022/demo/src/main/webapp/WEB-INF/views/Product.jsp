<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		var checkedList = [];
		
		window.onload = function() {
			search();
		};
		
		function search() {
			checkedList = [];
			
			var name = $("#searchName").val();
			
			var data = {
					name
			};
			
			$.ajax({
				type: 'POST',
				url: '/product/search',
				data: data,
				success: function(data, status, xhr){
					if(!data) return;

					// 검색어 출력
					var searchName = data.searchName;
					$("#searchName").val(searchName);
					
					// 아이템 템플릿 복사
					var item = document.getElementById('product-item');

					// 리스트 초기화
					var list = document.getElementById('product-list');
					list.innerHTML = '';
					
					// 아이템 추가
					var products = data.products;

					for(var i = 0; i < products.length; i++){
						var product = products[i];
						
						// 아이템에 데이터 넣기
						var clone = item.cloneNode(true);
						clone.style.display="table-row";
						clone.id = 'product-item-' + product.IDX;
						
						var productCheckbox = clone.getElementsByClassName('product-checkbox')[0];
						productCheckbox.id = 'product-checkbox-' + product.IDX;
						productCheckbox.addEventListener('click', function(event){
							var productIdx = this.id.split(/[-]+/).pop();
							if(event.target.checked && !checkedList.includes(productIdx)){
								checkedList.push(productIdx);
							} else {
								const index = checkedList.indexOf(productIdx);
								if (index > -1) checkedList.splice(index, 1);
							}
							console.log(checkedList);
							event.stopPropagation(); // 이벤트를 전파하지 않음
						});
						
						var productIdx = clone.getElementsByClassName('product-idx')[0];
						productIdx.id = 'product-idx-'+product.IDX;
						productIdx.innerHTML = product.IDX;
						
						var productName = clone.getElementsByClassName('product-name')[0];
						productName.id = 'product-name-'+product.IDX;
						productName.innerHTML = product.NAME;
						productName.addEventListener('click', function(event){
							var productIdx = this.id.split(/[-]+/).pop();
							showDetail(productIdx);
							event.stopPropagation(); // 이벤트를 전파하지 않음
						});
						
						var productPrice = clone.getElementsByClassName('product-price')[0];
						productPrice.id = 'product-price-'+product.IDX;
						productPrice.innerHTML = product.PRICE;
						
						var productStock = clone.getElementsByClassName('product-stock')[0];
						productStock.id = 'product-stock-'+product.IDX;
						productStock.innerHTML = product.STOCK;
						
						var productStatus = clone.getElementsByClassName('product-status')[0];
						productStatus.id = 'product-status-'+product.IDX;
						productStatus.innerHTML = product.STATUS;

						list.appendChild(clone);
					} 
				},
				error: function(xhr, status, error){
					alert(xhr.responseText);
				}
			})
		}
		
		function add() {
			location.href = "/product/add"
		}
		
		function remove() {
			if (!confirm("정말 삭제하시겠습니까?")) {
				return;
			}
			
			var data = {
					idxListStr: JSON.stringify(checkedList)
			}
			
			$.ajax({
				type: 'GET',
				url: '/product/remove',
				traditional: true,
				data: data,
				success: function(data, status, xhr){
					if(data === true) {
						if (!confirm("삭제되었습니다.")) {
							location.reload();
						} else {
							location.reload();
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
		
		function showDetail(idx) {
			alert(idx);
		}
	</script>
</head>
<body>
	<input type="text" id="searchName" placeholder="search by name" value="${saerchName}"><button onclick="search()">search</button>
	<table>
		<colgroup>
		
			<col width="5%"/>
			<col width="*"/> 
			<col width="20%"/> 
			<col width="20%"/> 
			<col width="20%"/> 
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th>IDX</th>
				<th>NAME</th>
				<th>PRICE</th>
				<th>STOCK</th>
				<th>STATUS</th>
			</tr>
		</thead>
		<tbody id="product-list">
			
		</tbody>
		<tr id="product-item" hidden>
			<td><input type="checkbox" class="product-checkbox"></td>
			<td class="product-idx"></td>
			<td class="product-name" style="cursor:pointer;"></td>
			<td class="product-price"></td>
			<td class="product-stock"></td>
			<td class="product-status"></td>
		</tr>
	</table>
	<button onclick="add()">add</button>
	<button onclick="remove()">remove</button>
</body>
</html>