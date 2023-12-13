<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
									<li class="active"><a href="#"><i class="fa fa-angle-right"
												aria-hidden="true"></i>Contact</a></li>
								</ul>
							</div>

						</div>
					</div>
					<!-- Contact Us -->

					<div class="col-sm-8">
						<h2>이메일로 가입하기</h2>
						<h5></h5>
						<div>
							<form action="/user/sign-up" method="post" enctype="multipart/form-data">
								<!-- 이메일 인증 기능 추가 -->
								<!-- 이메일 아이디 -->
								<div class="form-group">
									<label for="email">이메일</label> <input type="text" class="form-control"
										placeholder="이메일을 입력해주세요." id="email" name="email">
								</div>
								<div class="form-group">
									<label for="pwd">비밀번호</label> <input type="password" class="form-control"
										placeholder="숫자,영문 포함 최소 8자 이상" id="pwd" name="password">
								</div>
								<div class="form-group">
									<label for="pwdChk">비밀번호 확인</label> <input type="password" class="form-control"
										placeholder="비밀번호 한 번 더 입력" id="pwdChk" name="passwordCheck"> <span
										id="chkMsg"></span>
								</div>
								<div class="form-group">
									<label for="userName">사용자 이름</label> <input type="text" class="form-control"
										placeholder="이름을 입력하세요." id="userName" name="userName">
								</div>
								<div class="form-group">
									<label for="phoneNumber">연락처</label> <input type="text" class="form-control"
										placeholder="연락처를 입력하세요.(하이픈 포함)" id="phoneNumber" name="phonenum">
								</div>
								<div class="form-group">
									<label for="address">기본 주소</label> <input type="text" class="form-control"
										placeholder="기본 주소를 입력하세요" id="address" name="address">
								</div>
								<div class="form-group">
									<label for="addressDetail">상세 주소</label> <input type="text" class="form-control"
										placeholder="상세 주소를 입력하세요" id="address" name="addressDeta">
								</div>
								<!-- 약관 동의 체크박스 -->
								<div class="약관맨이야"></div>


								<button type="submit" class="btn btn-primary">이메일로 회원가입</button>
							</form>
							<script>
								$("#pwd, #pwdChk").keyup(function () {
									let pwd = $("#pwd").val();
									let pwdChk = $("#pwdChk").val();

									if (pwd == '' && pwdChk == '') {
										$("#chkMsg").text("");
										return;
									}
									if (pwd.length >= 8 && pwdChk.length >= 8) {
										if (pwd == pwdChk) {
											$("#chkMsg").text("비밀번호 일치").css('color', '#000');
											return
										}
										if (pwd != pwdChk) {
											$("#chkMsg").text("비밀번호 불일치").css('color', '#fba082'); // 여기 수정
											return;
										}
									}
								});
								$('#register_form').submit(function () {
									if ($('#pwd').val() != $('#pwdChk').val()) {
										alret('비밀번호가 불일치 합니다.');
										$('#pwd').val('').focus();
										$('#pwdChk').val('');
										return false;
									}
									if ($('#pwd').val().trim() == '') {
										$("#password").text("비밀번호를 입력하세요.");
										$('#pwd').val('').focus();
										return false;
									}
									let allow_pwd = /^[A-Za-z0-9]{8,16}$/;

									if (!allow_pwd.test(pwd.value)) {
										$('#password').text("8~16자의 영문 대소문자, 숫자로 입력하세요.");
										$('#pwd').val('').focus();
										$('#pwdChk').val('');
										return false;
									}
								});
							</script>

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