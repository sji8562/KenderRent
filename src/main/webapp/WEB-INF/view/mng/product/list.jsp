<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngheader.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/style.css">

	<div class="table-responsive m--margin">
		<c:choose>
			<c:when test="${ productList == null }">
				<p>등록된 상품이 존재하지 않습니다</p>
			</c:when>
			<c:otherwise>
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
						<c:forEach var="product" items="${ productList }">
							<tr>
								<th scope="row">${product.id}</th>
								<td>${product.id}</td>
								<td>${product.firstCategoryName} > ${product.secondCategoryName}</td>
								<td>${product.name}</td>
								<td>${product.grade}</td>
								<td>${product.status}</td>
								<td><a href="/mng/product/detail/${product.id}">상세</a><a>삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngfooter.jsp" %>