<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
<div class="super_container">

	<!-- Header -->

	<jsp:include page="../layout/header.jsp" />

	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="/">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>signIn</a></li>
					</ul>
				</div>

			</div>
		</div>
	
		<!-- Contact Us -->

		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4 get_in_touch_col">
				<div class="row" style="padding: 30px;">
					<div class="logo_container" style="text-align: center;">
						<a href="/"><img src="/images/Logo2.png" style="max-width: 80%; height: auto;"></a>
						<br><br><br><br>
					</div>
				</div>
				<div class="get_in_touch_contents">
					<form action="/user/signIn" method="post">
						<div>
							<input id="email" name="email" class="form_input input_email input_ph" type="email"  placeholder="Email" required="required" data-error="이메일을 입력해주세요"
								   oninput="this.value=this.value.replace(/[^a-zA-Z0-9~!@#$%^&*()_+|<>?:{}.]/g,'');">
							<input id="password" name="password" class="form_input input_website input_ph" type="password"  placeholder="Password" required="required" data-error="비밀번호를 입력해주세요"
								   oninput="this.value=this.value.replace(/[^a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]/g,'');">
						</div>
						<div>
							<button  type="submit" class="red_button message_submit_btn trans_300 button__submit" value="Submit">로그인</button>
						</div>
						<div style="margin-top: 16px; text-align: center;">
							<ul >
								<li class="list-item">
									<a href="/user/findId">아이디 찾기</a>
								</li>
								<li class="list-item">
									<a href="/user/findPassword">비밀번호 찾기</a>
								</li>
								<li class="list-item">
									<a href="/user/signUp">회원가입</a>
								</li>
							</ul>
						</div>
						<div style="margin-top: 32px; padding-top: 32px; border-top: 1px solid #eee; text-align: center;">
							<h4 class="social-title">간편 로그인</h4>
							<div class="social-icons">
								<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0a29e10b57cb7259eec5a50bdced4aa7&redirect_uri=http://localhost:80/user/kakao-callback&prompt=login">
			  					<img alt="" src="/images/kakaotalk.png" class="social-icon" style="margin-right: 40px"><span style="margin-right: 40px">카카오 로그인</span></a>
			  					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=LbaGbefoStQkPYuwldjm&state=123&redirect_uri=http://localhost:80/user/naver-callback">
			  					<img alt="" src="/images/naver.png" class="social-icon"><span>네이버 로그인</span></a>
			  				</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

	
	<!-- Footer -->
	<jsp:include page="../layout/footer.jsp" />
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
</body>
</html>