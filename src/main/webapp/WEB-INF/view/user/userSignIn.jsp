<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<img src="#" alt="Image" class="img-fluid">
						</div>
						<div class="col-md-6 contents">
							<div class="row justify-content-center">
								<div class="col-md-8">
									<div class="mb-4">
										<div class="title1">킨더렌드의 모든 혜택을 로그인을 통해 누리세요.</div>
										<div class="title2">킨더렌드의 회원이 아니시라면, 지금 바로 회원가입!</div>
									</div>
									<form action="/user/sign-in" method="post" onsubmit="return loginSubmit()">
										<!-- 이메일로 로그인 -->
										<div class="signIn">
											<span class="d-block text-left my-4 text-muted">사이트 로그인</span>
											<div class="form-group first">
												<!--  <label for="username">이메일</label> -->
												<p>이메일</p>
												<input type="text" class="form-control" id="user" name="user" placeholder="이메일"> <input type="hidden" class="form-control" id="username" name="username">

											</div>
											<div class="form-group last mb-4">
												<!-- <label for="password">패스워드</label> -->
												<p>비밀번호</p>
												<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
											</div>
										</div>

										<!-- 로그인 유지 체크박스 -->
										<div class="d-flex mb-5 align-items-center">
											<label class="control control--checkbox mb-0"><span class="caption">로그인 유지</span> <input type="checkbox" checked="checked" />
												<div class="control__indicator"></div> </label>
											<!-- 로그인 버튼 -->
											<span class="ml-auto">
												<button type="submit" onclick="history.back()" id="signInBtn" value="Submit" class="red_button message_submit_btn trans_300">이메일로 로그인</button>
											</span>
										</div>
										<!-- 소셜 로그인 -->
										<div class="social-login">
											<span class="d-block text-left my-4 text-muted">소셜 간단 로그인</span>
											<div>
												<!-- 카카오 -->
												<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=271d310fa59cc2d79b4807e9b895349d&redirect_uri=http://localhost:80/user/kakao-callback"> <img src="/images/kakao_login_large_wide.png" width="342" height="50" alt="" />
												</a>
												<!-- 네이버 -->
												<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=bxQuRgVT_baVA8Siz5vc&redirect_uri=http://localhost:80/user/naver-callback"> <img src="/images/naver_login_large_wide.png" width="342" height="50" alt="" />
												</a>
											</div>
										</div>
										<br> <br>
										<div class="col-sm-8 float-left">
											<!-- 이메일/비밀번호 찾기 -->
											<a href="/user/find-account-user">
												<button type="button" class="btn btn-outline-secondary" style="width: 180px; height: 50px;">이메일/비밀번호 찾기</button>
											</a>
										</div>
										<div class="col-sm-4 float-left">
											<!-- 회원 가입 -->
											<span class="ml-auto"> <a href="/user/sign-up">
													<button type="button" class="btn btn-outline-primary" style="width: 150px; height: 50px;">회원 가입</button>
											</a>
											</span>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="/js/contact_custom.js"></script>
	<script src="/js/dropdown.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>