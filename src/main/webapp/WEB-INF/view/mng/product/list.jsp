<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/style.css">
	<div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">물품 관리</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item active" aria-current="page">
                                    	<a href="/mng/product/register" style="text-decoration: none"><button>상품 등록</button></a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


	<div class="table-responsive">
		<c:choose>
			<c:when test="${ productList == null }">
				<p>등록된 상품이 존재하지 않습니다</p>
			</c:when>
			<c:otherwise>
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col">고유번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">물품명</th>
							<th scope="col">물품 등급</th>
							<th scope="col">상태</th>
							<th scope="col">기능</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${ productList }">
							<tr>
								<td scope="row">${product.id}</td>
								<td>${product.firstCategoryName} > ${product.secondCategoryName}</td>
								<td><a href="/mng/product/detail/${product.id}" style="text-decoration: none; color: black;">${product.name}</a></td>
								<td>${product.grade}</td>
								<td>${product.formatStatusToString()}</td>
									<td><a href="/mng/product/modify/${product.id}">수정</a>
									<a onclick="confirmOpen('del', ${product.id})">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<%-- 페이징 --%>
	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a
					href="user?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }"
				   end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="user?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
					href="user?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

	<script>
		function confirmOpen(type, id) {
			console.log(type);
			console.log(id);

			if(type == 'del') {
				if(confirm('삭제하시겠습니까?')) {
					fetch('/mng/product/' + id + '/delete')
							.then((response) => console.log("response", response)) //성공했을때
							.catch((error) => console.log("error:", error)) //실패했을때
				}
			}
		}
	</script>
</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>