<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngheader.jsp" %>
<link rel="stylesheet" href="/css/style.css">

	<div class="table-responsive m--margin">
		<table class="table">
			<thead class="table-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">고유번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">물품명</th>
					<th scope="col">물품 등급</th>
					<th scope="col">상태</th>
					<th scope="col">기능</th>
				</tr>
			</thead>
			<tbody>
				<!-- for 돌릴 부분 -->			
				<tr>
					<th scope="row">1</th>
					<td>M00001</td>
					<td>용품 > 유모차</td>
					<td>세상에서 가장 안전한 유모차</td>
					<td>최상</td>
					<td>대여중</td>
					<td><a href="/mng/product/detail/1">상세</a><a>삭제</a></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>M00001</td>
					<td>용품 > 유모차</td>
					<td>세상에서 가장 안전한 유모차</td>
					<td>최상</td>
					<td>대여중</td>
					<td><button>상세</button><button>삭제</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngfooter.jsp" %>