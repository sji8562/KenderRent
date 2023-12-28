<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/categories_responsive.css">
<style type="text/css">
.mypage_order_info_cont {
	margin: 0 0 30px 0;
	padding: 35px 0 35px 0;
	font-size: 0;
	border: 1px solid #e3e3e3;
	border-top: 1px solid #999999;
	text-align: center;
}

.mypage_order_info_cont ol {
	display: inline-block;
	width: 80%;
	font-size: 0;
	border-right: 1px solid #e3e3e3;
	vertical-align: middle;
}

.mypage_order_info_cont ol li {
	display: inline-block;
	width: 16%;
	min-width: 66px;
	padding: 0 2px 10px 10px;
	font-size: 13px;
	background: url('/images/mypgae_ing_next_bg.png') no-repeat left 50px;
	text-align: center;
}

.mypage_order_info_cont ol li:first-child {
	padding-left: 10px;
	background: none 0;
}

.mypage_order_info_cont ol li b {
	display: block;
	padding: 0 0 15px 0;
}

.mypage_order_info_cont ol li strong {
	display: inline-block;
	width: 52px;
	height: 52px;
	padding: 13px 0 0 0;
	color: #ffffff;
	font-size: 18px;
	background: url('/images/mypgae_ing_list_bg.png') no-repeat 0 0;
	text-align: center;
	vertical-align: middle;
}

* /
.mypage_order_info_cont .active strong {
	background: url('../../img/mypage/mypgae_ing_deliver_bg.png') no-repeat
		0 0;
}

.mypage_order_info_cont .order_case_list {
	display: inline-block;
	width: 19%;
	font-size: 0;
	text-align: center;
	vertical-align: middle;
}

.mypage_order_info_cont .order_case_list ul {
	display: inline-block;
	width: 70%;
	font-size: 0;
}

.mypage_order_info_cont .order_case_list ul li {
	padding: 8px 5px 10px 5px;
	font-size: 12px;
	border-top: 1px dotted #bfbfbf;
	text-align: left;
}

.mypage_order_info_cont .order_case_list ul li:first-child {
	border-top: none 0;
}

.mypage_order_info_cont .order_case_list ul li span {
	float: right;
}

.mypage_order_info_cont .order_case_list ul li span>em,
	.mypage_order_info_cont .order_case_list ul li span>strong {
	padding: 0 3px 0 0;
	font-size: 15px;
	color: #8FC400;
}
</style>
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
							<li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i> <a href="/mypage/main" style="color: black">마이페이지</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 					Sidebar -->
			<div class="row">
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h4>마이페이지</h4>
							</div>
							<br>
							<ul class="sidebar_categories">
								<li class="active"><a href="/mypage/main"><span>
								<i class="fa fa-angle-double-right" aria-hidden="true"></i></span>MY 홈</a></li>
								<li><a href="/mypage/order-list">주문 내역</a></li>
								<li><a href="/mypage/cancel-list">취소 내역</a></li>
								<li><a href="/mypage/rent-list">대여 내역</a></li>
								<li><a href="/mypage/wish-list">위시리스트</a></li>
								<li><a href="/mypage/qna">문의 내역</a></li>
								<li><a href="/mypage/user-update">회원정보 변경</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<p>
						<b>진행 중인 주문 | </b>최근 30일 내에 진행중인 주문정보입니다.
					</p>
					<div class="mypage_order_info_cont">
						<ol>
							<li class=""><b>입금대기</b> <strong>0</strong></li>
							<li class=""><b>결제완료</b> <strong>0</strong></li>
							<li class=""><b>상품준비중</b> <strong>0</strong></li>
							<li class=""><b>배송중</b> <strong>0</strong></li>
							<li class=""><b>배송완료</b> <strong>0</strong></li>
							<li class=""><b>구매확정</b> <strong>0</strong></li>
						</ol>
						<div class="order_case_list">
							<ul>
								<li><b>• 취소</b> <span>0건</span></li>
								<li><b>• 교환</b> <span>0건</span></li>
								<li><b>• 반품</b> <span>0건</span></li>
							</ul>
						</div>
					</div>

					<p>
						<b>진행 중인 주문 | </b>최근 30일 내에 진행중인 주문정보입니다.
					</p>
					<div class="mypage_lately_info_cont">
						<!-- 주문상품 리스트 -->
						<div class="mypage_table_type" style="border: 1px solid #e3e3e3; border-top: 1px solid #999999;">
							<table class="table">
								<!-- 						        <colgroup> -->
								<!-- 						            <col style="width:15%"> 날짜/주문번호 -->
								<!-- 						            <col>					상품명/옵션 -->
								<!-- 						            <col style="width:15%"> 상품금액/수량 -->
								<!-- 						            <col style="width:15%"> 주문상태 -->
								<!-- 						            <col style="width:15%"> 확인/리뷰 -->
								<!-- 						        </colgroup> -->
								<thead>
									<tr>
										<th>날짜/주문번호</th>
										<th>상품명/옵션</th>
										<th>상품금액/수량</th>
										<th>주문상태</th>
										<th>확인/리뷰</th>
									</tr>
								</thead>
								<tbody>
									<!-- 						나중에 조회해서 없으면 출력으로 수정 -->
									<tr>
										<td style="text-align: center;" colspan="6"><p>조회내역이 없습니다.</p></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<br>
					<!-- 				유저네임 가져와서 넣기 -->
					<p>
						<b>최근 본 상품 | </b>${sessionScope.principal.userName }님께서 최근 본 상품입니다.
					</p>
					<hr style="background: black;">
					<div class="goods_list_cont">
						<ul>
							<c:forEach items="${goodsProduct }" var="goodsProduct">
								<li style="width: 25%; float: left; margin-right: 50px">
									<div class="item_cont">
										<div class="item_photo_box">
											<a href="/product/detail/${goodsProduct.id }"> <img src=${goodsProduct.picUrl } width="250" alt="${goodsProduct.name }" title="${goodsProduct.name }" class="middle">
											</a>
										</div>
										<!-- //item_photo_box -->

										<div class="item_info_cont">
											<div class="item_tit_box">
												<a href="/product/detail/${goodsProduct.id }"> <strong class="item_name">${goodsProduct.name }</strong>
												</a>
											</div>
											<!-- //item_tit_box -->
											<div class="item_money_box">
												<strong class="item_price"> <span style="">${goodsProduct.price }원 </span>
												</strong>

											</div>
											<!-- //item_money_box -->
											<!-- //item_number_box -->

											<!-- //item_icon_box -->
										</div>

										<!-- //item_info_cont -->
									</div> <!-- //item_cont -->
								</li>
							</c:forEach>
						</ul>
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
	<script src="/js/categories_custom.js"></script>
	<script src="/js/dropdown.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>