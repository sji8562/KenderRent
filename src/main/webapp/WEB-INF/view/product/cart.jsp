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
						<div class="section_title new_arrivals_title">
							<h2>장바구니</h2>
						</div>
					</div>
				</div>
				<form id="cartForm">
					<input type="checkbox" id="selectAll" onclick="selectAll()">
					<label for="selectAll">전체 선택</label> 
					<!-- 개별 체크박스들 -->
					<table class="table">
						<thead>
							<tr>
								<th>선택</th>
								<th>상품 이름</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${cartList}">
								<tr>
									<td><input type="checkbox" name="selectedProduct"
										value="${product.price}" onchange="calculateTotalPrice()"></td>
									<td>${product.name}</td>
									<td>${product.price}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				<hr>
				<p id="totalPrice">총 가격: 0</p>
				<div class="red_button buy_button">
								<a href="/product/order">구매하기</a>
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
</body>
</html>