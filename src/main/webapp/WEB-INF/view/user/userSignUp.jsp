<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<meta charset="utf-8">
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
<link rel="stylesheet" href="/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/contact_responsive.css">
</head>
<body>
	<div class="super_container">

		<!-- Header -->

		<jsp:include page="../layout/header.jsp" />

		<div class="fs_menu_overlay"></div>



		<div class="container contact_container">
			<div class="row">
				<div class="col">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li class="active"><a href="#"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Contact</a></li>
						</ul>
					</div>

				</div>
			</div>
			<!-- Contact Us -->

			<div class="col-sm-8">
				<h2>이메일로 가입하기</h2>
				<h5></h5>
				<div>
					<form action="/user/sign-up" method="post"
						enctype="multipart/form-data">
						<!-- 이메일 인증 기능 추가 -->
						<!-- 이메일 아이디 -->
						<div class="form-group">
							<label for="email">이메일</label> <input type="text"
								class="form-control" placeholder="이메일을 입력해주세요." id="email"
								name="email">
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호</label> <input type="password"
								class="form-control" placeholder="숫자,영문 포함 최소 8자 이상" id="pwd"
								name="password">
						</div>
						<div class="form-group">
							<label for="pwdChk">비밀번호 확인</label> <input type="password"
								class="form-control" placeholder="비밀번호 한 번 더 입력" id="pwdChk"
								name="passwordCheck">
						</div>
						<div class="form-group">
							<label for="userName">이름</label> <input type="text"
								class="form-control" placeholder="이름을 입력하세요." id="userName"
								name="userName">
						</div>
						<!-- 약관 동의 체크박스 -->
						<div class="약관맨이야"></div>


						<button type="submit" class="btn btn-primary">이메일로 회원가입</button>
					</form>

				</div>

			</div>
		</div>

		<!-- Newsletter -->


		<!-- Footer -->

		<jsp:include page="../layout/footer.jsp" />

	</div>

	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/css/styles/bootstrap4/popper.js"></script>
	<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/plugins/easing/easing.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="/js/contact_custom.js"></script>
</body>
</html>