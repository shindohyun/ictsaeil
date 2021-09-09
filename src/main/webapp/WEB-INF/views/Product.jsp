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
.comment-wrap{
 width: 800px;
 margin-top: 100px;
 margin-bottom:50px;
}
.comment-wrap textarea{
 width: 99%;
 height: 80px;
 resize:none;
 font-size:18px;
}
.comment-wrap p{
 float: right;
 margin: 0px;
}
.comment-wrap button{
 width: 100%;
 margin-top: 10px;
 padding: 6px;
 font-size: 18px;
 background: #4caf50;
 color: #ffffff;
 border: none;
}
.comment-wrap button:hover{
 background: #48A44B;
}
.comment-wrap button:active{
 background: #3c8f3f;
}
.comment-list{
 padding: 10px;
 background: #4caf5036;
}
.comment-item{
 background: #f7f7f7;
 padding:10px;
 cursor:pointer;
}
.comment-item:hover{
 background: #f3f3f3;
}
.comment-item table{
 width: 100%;
}
.comment-item .comment-id{
 font-size:16px;
 font-weight: bold;
}
.comment-item .comment-date{
font-size:16px;
float:right;
}
.comment-item .comment-delete{
 float:right;
 color:#ffffff;
 background: #ff7171;
 border:none;
 border-radius: 4px;
 padding: 5px 14px;
 cursor:pointer;
}
.comment-item .comment-delete:hover{
 background: #e46666;
}
.comment-item .comment-delete:active{
 background: #ca5c5c;
}
.comment-item input{
 width: 99%;
 font-size:18px;
 margin-top: 5px;
 border: none;
 outline:none;
 text-overflow: ellipsis;
 cursor:pointer;
 background: transparent;
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
	
	<div class="comment-wrap">
		<h2>댓글</h2>
		<textarea placeholder="댓글을 입력해주세요.(최대 500자)" maxlength="500" oninput="onInputComment(value)"></textarea>
		<p id="current-length">0/500</p>
		<button>저장</button>
	</div>
	
	<div class="comment-list">
		<div class="comment-item">
			<div>
				<table>
					<tr>
						<td><label class="comment-id">id</label></td>
					 	<td style="width:20%;"><label class="comment-date">date</label></td>
					 	<td style="width:10%;"><button class="comment-delete">삭제</button></td>
					</tr>
				</table>
			</div>
			<div>
				<input value="commentcommentcommentcommentcommentcommentcommentcommentcommentcommentcommentcomment" readonly>
			</div>
		</div>
	</div>
</div>

<script>
function onInputComment(value){
	$('#current-length').text(value.length+"/500")
}
</script>
