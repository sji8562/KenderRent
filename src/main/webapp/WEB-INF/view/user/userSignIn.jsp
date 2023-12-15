<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_responsive.css">
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
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Contact</a></li>
					</ul>
				</div>

			</div>
		</div>
		<!-- Contact Us -->

		<div class="row">
		<div class="col-lg-4 "></div>
			<div class="col-lg-4 get_in_touch_col">
				<div class="get_in_touch_contents">
						<h1>로그인</h1>
					<br><br>
					<form action="/user/sign-in" method="post">
						<div>
							<input id="email" class="form_input input_website input_ph" type="email" name="email" placeholder="email" required="required" data-error="email is required.">
							<input id="password" class="form_input input_website input_ph" type="password" name="password" placeholder="password" required="required" data-error="password is required.">
						</div>
						<div>
							<button type="submit" onclick="history.back()" class="red_button message_submit_btn trans_300" value="Submit" >이메일로 로그인</button>
						</div>
					</form>
					<br>
					<a href="/user/find-email-by-user-name">이메일 찾기 | </a>
					<a href="/user/find-pwd-by-email">비밀번호 찾기 | </a>
					<a href="/user/sign-up">이메일로 회원가입</a>
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=271d310fa59cc2d79b4807e9b895349d&redirect_uri=http://localhost:80/user/kakao-callback">
					<img alt="" src="/images/kakao_login_large_wide.png" width="100%" height="60"></a>
					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=bxQuRgVT_baVA8Siz5vc&redirect_uri=http://localhost:80/user/naver-callback">
					<img alt="" src="/images/naver_login_large_wide.png" width="100%" height="60"></a>
				</div>
			</div>
			<div class="col-lg-4 "></div>
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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/js/contact_custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>