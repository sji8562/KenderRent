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
								aria-hidden="true"></i> 전체 주문 내역</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h4>마이페이지</h4>
							</div>
							<br>
							<ul class="sidebar_categories">
								<li><a href="/mypage/main">MY 홈</a></li>
								<li class="active"><a href="/mypage/order-list"><span>
											<i class="fa fa-angle-double-right" aria-hidden="true"></i>
									</span>주문 내역</a></li>
								<li><a href="/mypage/cancel-list">취소 내역</a></li>
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


						<!-- 주문상세 내역 -->
						<div id="container"
							style="margin-left: -30px; display: flex; justify-content: center;">
							<div id="content"
								style="display: relative; justify-content: center;">
								<label style="font-weight: bold; font-size: 17px"><fmt:formatDate value="${rent.createdAt}"
																				pattern="yyyy년 MM월 dd일" var="formattedDay" />${formattedDay}
									주문</label>
								<div style="float: right; padding-right: 5px;">
									<p>주문번호 ${rent.id}</p>
								</div>
								<div class="box_content">
									<div class="box_title" style="margin-bottom: 10px">결제 정보</div>
									<div style="padding: 0px 30px 40px -20px;">
										<div>
											<span class="text_price">상품금액</span> <span
												class="text_number"> <fmt:formatNumber
													value="${product.price}" pattern="#,###" />원
											</span>
										</div>
										<div style="display: block; clear: both; content: '';"></div>
										<div>
											<span class="text_price">배송비</span> <span class="text_number">${product.getDeliveryFee()}</span>
										</div>
										<div style="display: block; clear: both; content: '';"></div>
										<div>
											<span class="text_price">결제수단</span> <span
												class="text_number" style="font-size: 15px">카카오페이</span>
										</div>
									</div>
									<div
										style="height: 0px; border-bottom: 1px solid gray; margin-top: 50px;"></div>
									<div
										style="padding: 16px 30px 40px -20px; margin-bottom: 40px;">
										<span class="text_price"
											style="font-size: 18px; color: black;">총 결제 금액</span> <span
											class="text_number"
											style="font-size: 20px; font-weight: 700;">${product.totalPriceForOne()}</span>
									</div>
								</div>
								<div class="box_content">
									<div class="box_title">배송지 정보</div>
									<div class="box_form">
										<div class="box_label">
											<label for="user_name">이름</label>
										</div>
										<div class="box_info" id="nameInfo">
											<label>${userInfo.userName}</label>
										</div>
									</div>
									<div class="box_form">
										<div class="box_label">
											<label for="user_phoneNumber">연락처</label>
										</div>
										<div class="box_info" id="phoneInfo">
											<label>${userInfo.phoneNumber}</label>
										</div>
									</div>
									<div class="box_form">
										<div class="box_label">
											<label for="user_adress">주소</label>
										</div>
										<div class="box_info">
											<label>${userInfo.address}</label>
										</div>
									</div>
									<div class="box_form">
										<div class="box_label">
											<label for="user_email">이메일</label>
										</div>
										<div class="box_info">
											<label>${userInfo.email}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<br> <br>
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
	<script src="/js/categories_custom.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>