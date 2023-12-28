<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<!-- Header -->

	<jsp:include page="../layout/headerSub.jsp" />

	<br><br><br><br><br><br><br>

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>고객센터</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" onclick="location.href='/customer/contact?type=1'">공지</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"onclick="location.href='/customer/contact?type=2'" >FAQ</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" onclick="location.href='/customer/contact?type=3'">1:1문의</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" onclick="location.href='/customer/contact?type=4'">상품질문</li>
						</ul>
					</div>
				</div>
			</div>
			<br>
			<div class="row align-items-center">
				<div class="col text-center">
					<table class="table">

						<c:choose>
						<c:when test="${param.type == 1 or param.type == 2}">
						<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${customerList }" var="customerList">
						<tr>
							<td>${customerList.id }</td>
							<td><a href="/customer/detail?id=${customerList.id }">${customerList.title }</a></td>
							<td>관리자</td>
							<td><fmt:formatDate value="${customerList.created_at }" pattern="yyyy-MM-dd" /></td>

						</tr>

						</c:forEach>
						</c:when>
						<c:otherwise>
						<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${customerList }" var="customerList">
							<tr>
								<td>${customerList.id }</td>
								<c:if test="${customerList.secret eq 0 }">
									<td><a href="/customer/detail?id=${customerList.id }">${customerList.title }</a></td>
								</c:if>
								<c:if test="${customerList.secret eq 1 }">
									<td><a href="/customer/detail?id=${customerList.id }">🔒${customerList.title }</a></td>
								</c:if>
								<td>${customerList.user_name }</td>
								<td><fmt:formatDate value="${customerList.created_at }" pattern="yyyy. MM. dd" /></td>
								<c:if test="${customerList.status != null}">
									<td>답변완료</td>
								</c:if>
								<c:if test="${customerList.status eq null}">
									<td>답변미완료</td>
								</c:if>

							</tr>

						</c:forEach>
						</c:otherwise>
						</c:choose>

						</tbody>
					</table>

					<c:if test="${param.type == 3 }">
						<button onclick="location.href='/customer/write?type=inquiry'" type="button" class="btn btn-outline-secondary float-right btn-lg"  style='cursor:pointer;'>글쓰기</button>
					</c:if>
				</div>

			</div>
		</div>

		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a href="/customer/contact?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/customer/contact?type=${param.type }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/customer/contact?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
