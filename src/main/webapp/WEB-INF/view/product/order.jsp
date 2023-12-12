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
<link rel="stylesheet" type="text/css" href="/css/order.css">
<title>주문 / 결제하기</title>
</head>
<body>
	<div class="super_container">
		<!-- Header -->
		<jsp:include page="../layout/header.jsp" />
		<br> <br> <br> <br> <br> <br> <br>
		<div id="container" style="padding: 150px;">
			<div class="col text-center">
				<div class="section_title new_arrivals_title"
					style="margin-bottom: 100px;">
					<h2 style="text-align: center; font-size: 30px;">주문 및 결제</h2>
				</div>
			</div>

			<div id="content" style="">
				<div class="row">
					<div class="col-lg-6">
						<div style="float: left; width: 710px">
							<!-- 주문자 정보 -->
							<div class="box_content">
								<div class="box_title">주문자 정보</div>
								<div class="box_form">
									<div class="box_label">
										<label for="user_name">주문자</label>
									</div>
									<div class="box_info">
										<label>${userInfo.userName}</label>
									</div>
								</div>
								<div class="box_form">
									<div class="box_label">
										<label for="user_phoneNumber">연락처</label>
									</div>
									<div class="box_info">
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
							<!-- 배송지 정보 -->
							<div class="box_content" style="margin-top: 16px">
								<div class="box_title">배송지 정보</div>
								<br> <input type="checkbox"> <label>주문자 정보와
									동일</label>
								<div class="box_form">
									<div class="box_label">
										<label for="user_name">이름</label>
									</div>
									<input type="text" id="info_name" class="box_input" title="이름"
										placeholder="이름을 입력해 주세요">
								</div>
								<div class="box_form">
									<div class="box_label">
										<label for="user_name">연락처</label>
									</div>
									<input type="text" id="info_phoneNumber" class="box_input"
										title="번호" placeholder="연락처를 입력해주세요">
								</div>
								<div class="box_form">
									<div class="box_label">
										<label for="user_name">주소</label>
									</div>
									<input type="text" id="sample4_postcode" class="box_input"
										style="width: 350px;" title="우편번호" placeholder="우편번호">
									<input type="button" class="btn_address"
										onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
									<div class="box_label">
										<label for="user_name"></label>
									</div>
									<input type="text" id="sample4_roadAddress" class="box_input"
										placeholder="도로명주소">
									<div class="box_label">
										<label for="user_name"></label>
									</div>
									<input type="text" id="sample4_extraAddress" class="box_input"
										placeholder="참고항목">
									<div class="box_label">
										<label for="user_name"></label>
									</div>
									<input type="text" id="sample4_jibunAddress" class="box_input"
										placeholder="지번주소"> <span id="guide"
										style="color: #999; display: none"></span>
									<div class="box_label">
										<label for="user_name"></label>
									</div>
									<input type="text" id="sample4_detailAddress" class="box_input"
										placeholder="상세주소">
								</div>
							</div>
							<!-- 결제 수단 -->
							<div class="box_content" style="margin-top: 16px">
								<div class="box_title">결제 수단</div>
								<br>
								<div style="flex: 1 1; position: relative;">
									<div class="payment_box">
										<input type="radio" name="payment" id="payment_select"
											class="payment_radio" checked> <label
											class="payment_label">카카오페이 결제 <img
											src="/images/payment_icon_yellow_small.png" width="60"
											height="25">
										</label>
										<form method="post" action="/kakaoPay">
											<button style="width: 250px; height: 50px">카카오페이로 결제하기</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div>
							<p>오른쪽</p>
							<div style="float: right; width: 472px;">
								<div style="border: 1px solid; border-radius: 8px;"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 이곳에 필요한 추가적인 내용을 추가할 수 있습니다. -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/order.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>