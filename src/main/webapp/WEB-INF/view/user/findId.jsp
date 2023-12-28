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
	<script src="/js/jquery-3.2.1.min.js"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<!-- 주소 찾기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">

		$(document).on("click", "#phoneAuth", function() {
			let phoneNumber = $("#phoneNumber").val(); //사용자가 입력한 이메일 값 얻어오기
			let userName = $("#userName").val();
			//Ajax로 전송
			$.ajax({
				url : '/user/send-one',
				data : {
					phoneNumber : phoneNumber,
					userName : userName
				},
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					$('#authCode').css('display', 'block');
					code = result;
					alert("인증 코드가 입력하신 번호로 전송되었습니다.");
				}
			});
		});
	</script>
	<script type="text/javascript">
		//인증 코드 비교
		$(document).on("focusout", "#authCode", function() {
			const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기

			if(Number(inputCode) === code){
				$("#phoneAuthWarn").html('인증번호가 일치합니다.');
				$("#phoneAuthWarn").css('color', 'green');
				$('#phoneAuth').attr('disabled', true);
				$('#phoneNumber').attr('readonly', true);
				$("#findIdButton").attr("disabled", false);
			}else{
				$("#phoneAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
				$("#phoneAuthWarn").css('color', 'red');
				$("#findIdButton").attr("disabled", true);
			}
		});
	</script>
	<script type="text/javascript">

		function checkForm() {

			let nameReg = /^[가-힣]{2,5}$/;
			if(!nameReg.exec($("#userName").val())){
				alert("이름을 확인해주세요!")
				return false;
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
					<form action="/user/findId" method=post onsubmit="return checkForm();">
						<div>
							<div class="row">
								<div class="col-lg-8">
									<input id="phoneNumber" name="phoneNumber" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form_input input_website input_ph" type="text"  placeholder="핸드폰번호를 입력해주세요(숫자만 입력)">
									<div id="phoneResult"></div>
								</div>
								<div class="col-lg-4">
									<button type="button" id="phoneAuth" name="phoneAuth" class="btn btn-dark">핸드폰인증</button>
								</div>
							</div>
							<input id="authCode" name="authCode"  class="form_input input_email input_ph" type="text" style="display: none"  placeholder="인증코드 4자리를 입력해주세요">
							<div  id="phoneAuthWarn"></div>
							<input id="userName" name="userName" class="form_input input_website input_ph" type="text"  placeholder="이름을 입력해주세요">
							<div id="nameResult"></div>
						</div>
						<div>
							<button  type="submit" class="red_button message_submit_btn trans_300" value="Submit" id="findIdButton" disabled="disabled">아이디찾기</button>
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