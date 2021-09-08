<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.wrap {
 width: min-content;
 margin: auto;
}
.product{
 width: 800px;
 display: flex;
}
.product img{
 width: 300px;
 height: 300px;
}
.product table{
 margin: auto;
}
.product table tr{
 height: 50px;
}
.product table label{
 font-size: 20px;
 font-weight: bold;
 margin-right: 20px;
}
.product table p{
 font-size: 20px;
 margin:0px;
}
</style>

<div class="wrap">
	<div class="product">
		<img src="/img/product_sample.jpg"/>
		<table>
			<tr>
				<td><label class="head">상품명</label></td>
				<td><p>사과</p></td>
			</tr>
			<tr>
				<td><label>가격</label></td>
				<td><p>1,000원</p></td>
			</tr>
			<tr>
				<td><label>재고</label></td>
				<td><p>2,000개</p></td>
			</tr>
			<tr>
				<td><label>상품특징</label></td>
				<td><p>신선하고 맛있는 청사과 입니다.</p></td>
			</tr>
		</table>
	</div>
	<hr style="border: solid 1px #909090;">
</div>
