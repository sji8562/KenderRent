<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_responsive.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

<script>
	$(function() {
		var $userNameID = $("#userNameID");
		var $phoneNumberID = $("#phoneNumberID");
		var $idText = $("#idText");

		var $emailPwd = $("#emailPwd");
		var $userNamePwd = $("#userNamePwd");
		var $phoneNumberPwd = $("#phoneNumberPwd");

		// JS 모달
		var $findOk = new bootstrap.Modal(document.getElementById('findOk'));
		var $findNone = new bootstrap.Modal(document.getElementById('findNone'));

		$("#findId").click(function() {

			$.ajax({
				type : "POST",
				url : "/user/findUserEmail",
				data : {
					"email" : $emailID.val(),
					"phoneNumber" : $phoneNumberID.val()
				},
				success : function(data) {
					if (data == "") {
						//console.log("없음!")
						$findNone.show();
					} else {
						//console.log("data :"+data)
						$idText.text("회원님의 아이디 : " + data)
						$idText.css({
							"color" : "#0D6EFD",
							"font-weight" : "bold",
							"font-size" : "10px"
						})
						$findOk.show();
					}
				}
			})
		})

		$("#findPwd").click(function() {

			$.ajax({
				type : "POST",
				url : "/user/findUserPwd",
				data : {
					"mid" : $emailPwd.val(),
					"mname" : $userNamePwd.val(),
					"mphone" : $phoneNumberPwd.val()
				},
				success : function(data) {
					if (data == "") {
						//console.log("없음!")
						$findNone.show();
					} else {
						//console.log("data :"+data)
						$idText.text("회원님의 임시 비밀번호를 이메일로 발송하였습니다. 확인부탁드립니다.");
						$idText.css({
							"color" : "#0D6EFD",
							"font-weight" : "bold",
							"font-size" : "10px"
						})
						$findOk.show();
					}
				}
			})
		})
	})
</script>
<style>
#idText {
	color: #FA3E3E;
	font-weight: bold;
}

.fint_input>img {
	width: 200px;
	margin: 10px 0 30px 75px;
}

.fint_input>div>input {
	font-size: 12px;
	height: 50px;
}

.fint_input>div>label {
	padding: 14px;
}

.mb-4>P {
	color: #222;
	font-size: 20px;
	line-height: 24px;
	font-weight: 600;
}

.drivder {
	width: 354px;
}

.bg-white {
	padding: 30px 0 20px 150px;
}
</style>
<title>아이디/비밀번호 찾기</title>
</head>
<body>


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
			<div class="content bg-light">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-6 contents bg-white" style="padding-left: 150px;">
							<div class="col-md-8-custom fint_input">
								<img src="../images/logo.png" alt="" />
								<div class="mb-4">

									<p>아이디 찾기</p>
								</div>
								<!-- <span>이름</span> -->
								<div class="form-group last mb-4">
									<label for="userNameID" id="nameTxt">이름을 입력해주세요</label> <input type="text" class="form-control" name="userNameID" id="userNameID">
								</div>

								<!-- <span>핸드폰 번호</span> -->
								<div class="form-group last mb-4">
									<label for="phoneNumberID" id="phoneTxt">핸드폰번호를 입력해주세요 (번호만 입력)</label> <input type="text" class="form-control" name="phoneNumberID" id="phoneNumberID">
								</div>

								<button type="button" class="btn btn-block btn-primary" id="findId" style="width: 356px; margin-bottom: 20px;">아이디 찾기</button>
								<hr class="drivder">
								<div class="mb-4">
									<p>비밀번호 찾기</p>
								</div>
								<!-- <span>아이디</span> -->
								<div class="form-group first">
									<label for="emailPwd" id="id">아이디를 입력해주세요 (5~20자 입력)</label> <input type="text" class="form-control" name="emailPwd" id="emailPwd">
								</div>
								<!-- <span>이름</span> -->
								<div class="form-group last mb-4">
									<label for="userNamePwd" id="nameTxt">이름을 입력해주세요</label> <input type="text" class="form-control" name="userNamePwd" id="userNamePwd">
								</div>

								<!-- <span>핸드폰 번호</span> -->
								<div class="form-group last mb-4">
									<label for="phoneNumberPwd" id="phoneTxt">핸드폰번호를 입력해주세요 (번호만 입력)</label> <input type="text" class="form-control" name="phoneNumberPwd" id="phoneNumberPwd">
								</div>


								<button type="button" class="btn btn-block btn-primary" id="findPwd" style="width: 356px; margin-bottom: 20px;">비밀번호 찾기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="findOk" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">계정 정보 확인</h4>

					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-9">
								<div class="row">
									<p id="idText"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="/goodjob/login/loginform"><button type="button" class="btn btn-default">로그인 화면으로 돌아가기</button></a>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="findNone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">계정 정보 확인</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-9">
								<div class="row">
									<p id="idText">계정 정보를 확인 할 수 없습니다</p>
									<p id="idText">정확한 정보를 확인 후 다시 입력해주세요</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="/goodjob/login/loginform"><button type="button" class="btn btn-default">로그인 화면으로 돌아가기</button></a>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../layout/footer.jsp" />
</body></html>