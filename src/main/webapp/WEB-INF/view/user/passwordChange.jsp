<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>Kinder Lend</title>
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
<script src="/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/styles/main_styles.css">
<!-- CSS only -->
z

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
	$(function() {
// 		비밀번호 규칙 (숫자, 영어 대소문자, 특수문자 (!, @, #, $, %) 4~16자리 사용 가능)
		let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
		$("#password").on("change", function() {
			if(!passwdReg.exec($("#password").val())){
				$("#passwd1Result").html("비밀번호 형식을 확인해주세요.<br> 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
			}else{
				$("#passwd1Result").html("사용 가능한 비밀번호 형식 입니다!").css("color", "blue");
			}
		})
		// 비밀번호가 일치하는 지 확인
		$("#password2").on("change", function() {
			if(!passwdReg.exec($("#password2").val())){
				$("#passwd2Result").html("비밀번호 형식을 확인해주세요.<br> 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
			}else{
				if($("#password").val() != $("#password2").val()){
					$("#passwd2Result").html("비밀번호가 일치하지 않습니다!").css("color", "red");
				}else{
					$("#passwd2Result").html("비밀번호가 일치합니다!").css("color", "blue");
				}
			}
		})
	});
	function checkForm() {
		let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
		if(!passwdReg.exec($("#password").val())){
			alert("비밀번호 형식을 확인해주세요!");
			return false;
		}
		if($("#password").val() != $("#password2").val()){
			alert("비밀번호가 일치하는 지 확인해주세요!")
			return false;
		}
	}
</script>
<script type="text/javascript">
function changPassword() {
	result = window.confirm("비밀번호를 변경하시겠습니까?");
	if(result){
		alert("비밀번호가 변경되었습니다.")
	}
}
</script>
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
				<div class="col-lg-4"></div>
				<div class="col-lg-4 get_in_touch_col">
					<div class="row">
						<div class="logo_container">
							<a href="/"><img src="/images/Logo2.png" style="max-width: 80%; height: auto;"></a>
							<br><br><br><br>
						</div>
					</div>
					<div class="get_in_touch_contents">
						<form action="/user/passwordChangePro?email=${param.email }" method="post" onsubmit="return checkForm();">
							<div>
								<input id="password" name="password" class="form_input input_website input_ph" type="password"  placeholder="비밀번호입력">
								<div id="passwd1Result"></div>
								<input id="password2" name="password2" class="form_input input_website input_ph" type="password"  placeholder="비밀번호확인">
								<div id="passwd2Result"></div>
							</div>
							<div>
								<button type="submit" class="red_button message_submit_btn trans_300" onclick='changPassword()' id="passwordChangeButton" value="비밀번호변겅">비밀번호 변경</button>
							</div>
						</form>
					</div>
				</div>
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
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
</body>

</html>