<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
z
<link rel="stylesheet" type="text/css"
	href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css" href="/css/myPage.css">
<link rel="stylesheet" type="text/css" href="/css/order.css">
<body>
	<div class="super_container">
		<!-- Header -->
		<jsp:include page="../layout/header.jsp" />
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
								aria-hidden="true"></i>대여 내역</li>
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
								<li><a href="/mypage/order-list">주문 내역</a></li>
								<li><a href="/mypage/cancel-list">취소 내역</a></li>
								<li class="active"><a href="/mypage/rent-list"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i><span>
									</span>대여 내역</a></li>
								<li><a href="/mypage/wish-list">위시리스트</a></li>
								<li><a href="#">문의 내역</a></li>
								<li><a href="#">회원정보 변경</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="mypage_lately_info_cont">
						<div class="box_title"
							style="margin-bottom: 10px; border-bottom: none; padding-left: 40px">
							대여 내역</div>

						<!-- 주문상품 리스트 -->
						<div id="container"
							style="margin-left: -30px; display: flex; justify-content: center;">
							<div id="content"
								style="display: relative; justify-content: center;">
								<c:choose>
									<c:when test="${empty rent}">
										<div style="text-align: center;">
											<p style="font-size: 18px">대여하신 상품이 없습니다.</p>
											<a href="/">
												<button class="continue_button" style="align-items: center;">쇼핑하러
													가기 ></button>
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<table>
											<tbody>
												<c:forEach var="rent" items="${rent}">
													<tr>
														<td class="vertical-center">
															<div class="box_content">
																<div class="box_title" style="margin-bottom: 10px">
																	배송 완료
																	<div style="float: right; padding-right: 5px;">
																		<a href="/mypage/rent-list/detail?id=${rent.id}"
																			class="text_product_name"
																			style="font-size: 13px; color: gray;"> 주문 상세 보기 >
																		</a>
																	</div>
																</div>

																<div class="box_goods">
																	<div class="box_picture">
																		<a href="/product/rent/${rent.product_id}"> <img
																			src=${rent.pic_url } width="100" height="100">
																		</a>
																	</div>
																	<div class="box_product_info">
																		<form action="/cart/delete?id=${product.id }"
																			method="post">
																			<a href="/mypage/order-list/rent?id=${rent.id}"
																				class="text_product_name"> ${rent.name} </a>
																		</form>
																		<div></div>
																		<span class="text_product_price"> <fmt:formatNumber
																				value="${rent.price}" pattern="#,###" />원
																		</span>
																		<p>
																			대여 기간 :
																			<fmt:formatDate value="${rent.start_day}"
																				pattern="yyyy.MM.dd" var="formattedStartDay" />${formattedStartDay}
																			~
																			<fmt:formatDate value="${rent.end_day}"
																				pattern="yyyy.MM.dd" var="formattedEndDay" />${formattedEndDay}</p>
																	</div>
																</div>
																<div
																	style="display: flex; justify-content: center; margin-top: 30px;">
																	<form method="post"
																		action="/product/order/kakao-pay/cancel"
																		class="box_button" style="margin-right: 20px">
																		<input type="hidden" name="orderId" value="${rent.id}" />
																		<button type="button" onclick="location.href='/customer/write?type=productInquiry'"
																			style="border: none; background: none; border: none;">
																			반납 신청</button>
																	</form>
																	<button type="submit" class="box_button">배송조회</button>
																</div>
																<div class="add_review">
																	<form id="review_form" action="post">
																		<div>
																			<h1 style="font-weight: bold; float: left">리뷰작성</h1>
																			<ul class="user_star_rating">
																				<li><i class="fa fa-star" aria-hidden="true" onclick="setRating(1)"></i></li>
																				<li><i class="fa fa-star" aria-hidden="true" onclick="setRating(2)"></i></li>
																				<li><i class="fa fa-star" aria-hidden="true" onclick="setRating(3)"></i></li>
																				<li><i class="fa fa-star" aria-hidden="true" onclick="setRating(4)"></i></li>
																				<li><i class="fa fa-star" aria-hidden="true" onclick="setRating(5)"></i></li>
																			</ul>
																		</div>
																		<div>
																			<textarea id="review_message" class="input_review"
																				name="message" placeholder="Your Review" rows="4"
																				required data-error="Please, leave us a review."></textarea>
																		</div>
																		<div class="text-left text-sm-right">
																			<button id="review_submit" type="submit"
																				class="red_button review_submit_btn trans_300"
																				value="Submit">작성 완료</button>
																		</div>
																	</form>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</div>
				</div>
				<br> <br>
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
	<script src="/js/categories_custom.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    function setRating(clickedIndex) {
        var starElements = document.querySelectorAll('.user_star_rating i');

        for (var i = 0; i < starElements.length; i++) {
            if (i < clickedIndex) {
                starElements[i].classList.remove('fa-star-o');
                starElements[i].classList.add('fa-star');
            } else {
                starElements[i].classList.remove('fa-star');
                starElements[i].classList.add('fa-star-o');
            }
        }
    }
</script>
</body>
</html>