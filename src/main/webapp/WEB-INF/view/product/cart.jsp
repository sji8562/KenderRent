<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	href="/css/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/responsive.css">

</head>
<body>
	<div class="super_container">
		<!-- Header -->

		<jsp:include page="../layout/header.jsp" />

		<br> <br> <br> <br> <br> <br> <br>

		<div class="new_arrivals">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<div class="section_title new_arrivals_title"
							style="margin-bottom: 100px;">
							<h2>장바구니</h2>
						</div>
					</div>
				</div>
				<div class="product_details">
					<div class="product_details_title">
						<c:choose>
							<c:when test="${empty cartList}">
								<div style="text-align: center;">
									<p style="font-size: 18px">장바구니에 담긴 상품이 없습니다.</p>
									<a href="/">
										<button class="continue_button" style="align-items: center;">
											쇼핑하러 가기 ></button>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 구매 목록 -->
								<div class="col text-center">
									<table class="table">
										<thead>
											<tr>
												<th class="column1"><input type="checkbox"
													id="selectAll" onclick="selectAll()"></th>
												<th class="column2">구분</th>
												<th>상품이름</th>
												<th>상품금액</th>
												<th class="cloumn5"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${cartList}">
												<tr>
													<c:choose>
														<c:when test="${product.status == 1}">
															<td class="vertical-center"><input type="checkbox"
																name="selectedProduct" value="${product.id}"
																data-price="${product.price}"
																onchange="calculateTotalPrice(); selectedProductId('${product.id}');">
															</td>
														</c:when>
														<c:otherwise>
															<td class="vertical-center"><input type="checkbox"
																disabled></td>
														</c:otherwise>
													</c:choose>

													<td class="vertical-center">${product.formatItemForSale()}</td>
													<td>
														<div>
															<a href="/product/detail/${product.id}" target="_blank">
																<img src=${product.picUrl
																}
																	class="product_picture"
																style="vertical-align: top;"></a>
														</div>
														<div>
															<a href="/product/detail/${product.id }" target="_blank"
																style="font-size: 15px" class="cart_table_name">
																${product.name} 
															<c:choose>
																<c:when test="${product.status != 1}">
																	<label class="cart_table_name"
																		style="font-size: 12px; padding-top: 8px; padding-left: 5px;">[품절]</label>
																</c:when>
															</c:choose></a>
															<div class="cart_table_option">선택기간: ${product.code}개월</div>
														</div>
													</td>
													<td class="vertical-center">${product.formatPrice()}</td>
													<td>
														<form action="/cart/delete?id=${product.id }"
															method="post">
															<button type="submit" class="cancel-button">×</button>
														</form>
													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<br>
								<div class="row justify-content-end">
									<div
										class="col d-flex flex-row text-center justify-content-center"
										style="border: solid 1px lightgray; padding-top: 10px;">
										<p id="selectedProductPrice" class="price">선택 상품금액: 0원</p>
										<p class="price">+</p>
										<p id="deliveryFee" class="price">배송비: 0원</p>
										<p class="price">=</p>
										<p class="price">
											총 주문금액: <span id="totalPrice" style="color: red;">0원</span>
										</p>
										<form action="/product/order" method="post"
											onsubmit="return validateOrder()">
											<input type="hidden" name="id" id="selectedProductsInput"
												value="">
											<button type="submit" class="red_button buy_button"
												style="width: 140px; float: right;">구매하기</button>
										</form>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
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
	<script src="/js/cart.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>