<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<!-- Header -->
<jsp:include page="../layout/headerSub.jsp" />
		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">
					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="/">Home</a></li>
							<li class="active"><i class="fa fa-angle-right"
								aria-hidden="true"></i> <a href="/mypage/main"
								style="color: black">마이페이지</a></li>
							<li class="active"><i class="fa fa-angle-right"
								aria-hidden="true"></i>취소 내역</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<a href="/mypage/main" style="color: black; font-size: 24px;">마이페이지</a>
							</div>
							<br>
							<ul class="sidebar_categories">
								<li><a href="/mypage/main">MY 홈</a></li>
								<li><a href="/mypage/order-list">주문 내역</a></li>
								<li class="active"><a href="/mypage/cancel-list"><span>
											<i class="fa fa-angle-double-right" aria-hidden="true"></i>
									</span>취소 내역</a></li>
									<li><a href="/mypage/rent-list">대여 내역</a></li>
								<li><a href="/mypage/wish-list">위시리스트</a></li>
								<li><a href="#">문의 내역</a></li>
								<li><a href="#">회원정보 변경</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="mypage_lately_info_cont">
					<div class="box_title" style="margin-bottom: 10px; border-bottom: none; padding-left: 40px"> 
						취소 내역</div>
						<div id="container"
							style="margin-left: -30px; display: flex; justify-content: center;">
							<div id="content"
								style="display: relative; justify-content: center;">
								<div class="col text-center">
									<table class="table" style="width: 720px; border-bottom: 1px solid #ECECEC;">
										<thead>
											<tr>
												<th class="column1">접수일자</th>
												<th class="column2">진행상태</th>
												<th>상품이름</th>
												<th>상품금액</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cancelList" items="${cancelList}">
												<tr>
													<td class="vertical-center">
														<fmt:formatDate value="${cancelList.create_at}"
															  pattern = "yyyy년 MM월 dd일"/></td>
													<td>
														<c:choose>
															<c:when test="${cancelList.status == 1}">
																처리중
															</c:when>
															<c:when test="${cancelList.status == 2}">
																완료
															</c:when>
														</c:choose></td>
													<td>${cancelList.name }</td>
													<td class="vertical-center"><fmt:formatNumber value="${cancelList.money}" pattern="#,###" />원</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/css/styles/bootstrap4/popper.js"></script>
	<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/plugins/easing/easing.js"></script>
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="/js/single_custom.js"></script>
	<script src="/js/cancel.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>