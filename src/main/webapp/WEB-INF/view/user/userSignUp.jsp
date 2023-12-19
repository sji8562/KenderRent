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

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script>
	var idchk = false; // 아이디 검사
	var emchk = false; // 이메일
	var emconfirmchk = false; // 이메일 인증
	var pwdchk = false; // 패스워드
	var pwdConfrimchk = false; // 패스워드 확인
	var namechk = false; // 이름
	var phchk = false; // 핸드폰

	$(function() {
		var $id = $("#id");
		var $email = $("#email");
		var $password = $("#password");
		var $pwdConfrim = $("#pwdConfrim");
		var $userName = $("#userName");
		var $phoneNumber = $("#phoneNumber");

		var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
		var $emailconfirm = $("#emailconfirm"); // 인증번호 확인input
		var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt

		//console.dir("mid : "+$id);

		// 아이디 정규식
		$id
				.on(
						"keyup",
						function() { // 키보드 눌렀을 때 실행
							var regExp = /^[a-z]+[a-z0-9]{5,15}$/g;

							if (!regExp.test($id.val())) { // id 가 공백인 경우 체크
								idchk = false;
								$userName
										.html("<span id='check'>사용할 수 없는 아이디입니다.</span>");
								$("#check").css({
									"color" : "#FA3E3E",
									"font-weight" : "bold",
									"font-size" : "10px"
								})
							} else { // 공백아니면 중복체크
								$
										.ajax({
											type : "POST",
											url : "/user/checkid",
											data : {
												"type" : "user",
												"id" : $id.val()
											},
											success : function(data) {
												if (data == 1) { // 1이면 중복
													idchk = false;
													$userName
															.html("<span id='check'>이미 존재하는 아이디입니다</span>")
													$("#check").css({
														"color" : "#FA3E3E",
														"font-weight" : "bold",
														"font-size" : "10px"

													})
													//console.log("중복아이디");
												} else { // 아니면 중복아님
													idchk = true;
													$userName
															.html("<span id='check'>사용가능한 아이디입니다</span>")

													$("#check").css({
														"color" : "#0D6EFD",
														"font-weight" : "bold",
														"font-size" : "10px"

													})
													//console.log("중복아닌 아이디");
												}
											}
										})
							}
						});

		// 비밀번호 정규식
		$password.on("keyup", function() {
			var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
			//console.log("email : "+$email.val());
			if (!regExp.test($password.val())) {
				//console.log("형식 미확인");

				$("#cpwdnew").html("<span id='chkpwd'>패스워드 형식이 맞지 않습니다</span>")
				$("#chkpwd").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
				pwdchk = false;
			} else {
				//console.log("형식 확인");
				$("#cpwdnew").html("<span id='chkpwd'>패스워드 형식을 확인했습니다</span>")
				$("#chkpwd").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
				pwdchk = true;
				//console.log("idchk : "+idchk);
				//console.log("pwdConfrimchk : "+pwdConfrimchk);
				//console.log("emlchkchk : "+emlchkchk);

			}
		})

		// 패스워드 2중 검사
		$pwdConfrim.on("keyup", function() {
			if ($pwdConfrim.val() != $password.val()) {
				pwdConfrimchk = false;
				//console.log("불일치");
				$("#pwdText")
						.html("<span id='checkpwd'>비밀번호가 일치하지 않습니다</span>")
				$("#checkpwd").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
			} else {
				pwdConfrimchk = true;
				//console.log("동일한 비밀번호");
				$("#pwdText").html("<span id='checkpwd'>비밀번호 일치 확인</span>")
				$("#checkpwd").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "10px"

				})
			}
		})

		// 이름 확인
		$mname.on("keyup", function() {
			if ($mname.val() == "") { // id 가 공백인 경우 체크
				namechk = false;
				$("#nameTxt").html("<span id='nmchk'>이름은 필수입니다</span>");
				$("#nmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
			} else {
				namechk = true;
				$("#nmchk").hide();
			}
		})

		// 이메일 정규식 검사
		$email
				.on(
						"keyup",
						function() {
							var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							//console.log("email : "+$email.val());
							if (!regExp.test($email.val())) {
								//console.log("형식 미확인");
								emchk = false;

								$("#mailTxt")
										.html(
												"<span id='chkmail'>이메일 형식이 맞지 않습니다</span>")
								$("#chkmail").css({
									"color" : "#FA3E3E",
									"font-weight" : "bold",
									"font-size" : "10px"
								})
							} else {
								emchk = true;

								//console.log("형식 확인");
								$("#mailTxt")
										.html(
												"<span id='chkmail'>이메일을 형식을 확인했습니다</span>")
								$("#chkmail").css({
									"color" : "#0D6EFD",
									"font-weight" : "bold",
									"font-size" : "10px"
								})
							}
						})

		// 이메일 인증번호
		$checkEmail.click(function() {
			$.ajax({
				type : "POST",
				url : "/goodjob/login/mailConfirm",
				data : {
					"email" : $email.val()
				},
				success : function(data) {
					alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
					console.log("data : " + data);
					chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
				}
			})
		})

		// 핸드폰 번호
		$phoneNumber.on("keyup", function() {
			var regExp = /^\d{3}\d{4}\d{4}$/;
			//console.log("email : "+$email.val());
			if (!regExp.test($phoneNumber.val())) {
				//console.log("형식 미확인");

				$("#phoneTxt").html(
						"<span id='chkphone'>핸드폰 번호 형식이 맞지 않습니다</span>")
				$("#chkphone").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
				phchk = false;
			} else {
				//console.log("형식 확인");
				$("#phoneTxt").html(
						"<span id='chkphone'>핸드폰 번호를 형식을 확인했습니다</span>")
				$("#chkphone").css({
					"text-align" : "center",
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "10px"
				})
				phchk = true;
				//console.log("idchk : "+idchk);
				//console.log("pwdConfrimchk : "+pwdConfrimchk);
				//console.log("emlchkchk : "+emlchkchk);

			}
		})

		// selectBox 관련 JS
		var selectTarget = $('.selectbox select');

		// focus 가 되었을 때와 focus 를 잃었을 때
		selectTarget.on({
			'focus' : function() {
				$(this).parent().addClass('focus');
			},
			'blur' : function() {
				$(this).parent().removeClass('focus');
			}
		});

		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();
			$(this).siblings('label').text(select_name);
			$(this).parent().removeClass('focus');
		});

	});

	// 이메일 인증번호 체크 함수
	function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt) {
		$emailconfirm.on("keyup", function() {
			if (data != $emailconfirm.val()) { //
				emconfirmchk = false;
				$emailconfirmTxt
						.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
				$("#emconfirmchk").css({
					"color" : "#FA3E3E",
					"font-weight" : "bold",
					"font-size" : "10px"

				})
				//console.log("중복아이디");
			} else { // 아니면 중복아님
				emconfirmchk = true;
				$emailconfirmTxt
						.html("<span id='emconfirmchk'>인증번호 확인 완료</span>")

				$("#emconfirmchk").css({
					"color" : "#0D6EFD",
					"font-weight" : "bold",
					"font-size" : "10px"

				})
			}
		})
	}

	// 주소 찾기 script
	function daumPostcode() {
		$("#maddr").val("");
		$("#maddr2").val("");
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = extraAddr;
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("maddr2").value = extraAddr;

				} else {
					document.getElementById("maddr2").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#maddr").val(addr);
				$("#maddr2").val(extraAddr)

				$("#mmaddr").remove();
				$("#mmaddr2").remove();

				//$("#caddr").val(addr);
				//document.getElementById("caddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("maddr2").focus();
			}
		}).open();
	}

	// formSubmit 함수
	function formSubmit() {
		var maleCheck = $("#male").is(':checked');
		var femaleCheck = $("#female").is(':checked');

		//console.log("idchk : "+idchk)
		//console.log("pwdchk : "+pwdchk)
		//console.log("pwdConfrimchk : "+pwdConfrimchk)		
		//console.log("namechk : "+namechk)

		//console.log("birchk : "+birchk)
		//console.log("emchk : "+emchk)
		//console.log("emconfirmchk : "+emconfirmchk)
		//console.log("phchk : "+phchk)
		//console.log("select : "+$("#select").val())

		if (!idchk) {
			frm.mid.focus();
			return false;
		} else if (!pwdchk) {
			frm.password.focus();
			return false;
		} else if (!pwdConfrimchk) {
			frm.pwdConfrim.focus();
			return false;
		} else if (!namechk) {
			frm.mname.focus();
			return false;
		} else if (!birchk) {
			frm.mbrith.focus();
			return false;
		} else if (!emchk) {
			frm.email.focus();
			return false;
		} else if (!emconfirmchk) {
			frm.emailconfirm.focus();
			return false;
		} else if (!phchk) {
			frm.phoneNumber.focus();
			return false;
		} else if (!$("#chek").is(":checked")) {
			frm.chek.focus();
			return false;
		} else if ($("#select").val() == "none") {
			frm.tno.focus();
			return false;
		} else if ($("#maddr").val() == "") {
			frm.maddr.focus();
			return false;
		} else if (maleCheck == false && femaleCheck == false) {
			frm.mgender.focus();
			return false;
		} else {
			return true;
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

			<div class="content bg-light">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-6 contents bg-white">
							<div class="col-md-8-custom member_register">
								<div class="mb-4">
									<!-- <h3>회원가입</h3> -->
									<img src="#" alt="" />
								</div>
								<form action="/user/registerOkUser" name="frm" method="post" onsubmit="return formSubmit()">
									<!-- <span>이메일 </span> -->
									<div class="form-group last mb-4 email_input">
										<label for="email" id="mailTxt">로그인 시 사용할 이메일을 입력해주세요</label> <input type="text" class="form-control" name="email" id="email">
									</div>
									<!-- <span>이메일 인증번호</span> -->
									<button class="btn btn-outline-primary" type="button" id="checkEmail">인증번호 받기</button>


									<div class="form-group last mb-4 check_input">
										<label for="emailconfirm" id="emailconfirmTxt">인증번호를 입력해주세요</label> <input type="text" class="form-control" id="emailconfirm">
									</div>

									<!-- <span>비밀번호</span> -->
									<div class="form-group last mb-4">
										<label for="password" id="pwdnew">비밀번호를 입력해주세요 (영문&숫자를 포함한 8~20자)</label> <input type="password" class="form-control" name="password" id="password">
									</div>

									<!-- <span>비밀번호 확인</span> -->
									<div class="form-group last mb-4">
										<label for="pwdConfrim" id="pwdText">비밀번호 확인</label> <input type="password" class="form-control" id="pwdConfrim">
									</div>

									<!-- <span>이름</span> -->
									<div class="form-group last mb-4">
										<label for="mname" id="nameTxt">이름을 입력해주세요</label> <input type="text" class="form-control" name="mname" id="mname">
									</div>

									<!-- <span>핸드폰 번호</span> -->
									<div class="form-group last mb-4">
										<label for="phoneNumber" id="phoneTxt">핸드폰번호를 입력해주세요 (번호만 입력)</label> <input type="text" class="form-control" name="phoneNumber" id="phoneNumber">
									</div>

									<!-- <span>주소</span> -->

									<div class="form-group last mb-4 addr_input">
										<label for="maddr" id="mmaddr">주소를 입력해주세요</label> <input type="text" class="form-control" name="maddr" id="maddr">
									</div>
									<input type="button" class="btn btn-outline-primary addr_btn" id="findAddr" onclick="daumPostcode()" value="주소 찾기"><br>

									<!-- <span>상세 주소</span> -->
									<div class="form-group last mb-4 addr_detail">
										<label for="maddr2" id="mmaddr2">상세 주소를 입력해주세요</label> <input type="text" class="form-control" name="maddr2" id="maddr2">
									</div>

									<br>
									<hr class="divider">
									<div>
										<p>
											킨더렌드 약관 동의(필수) <input type="checkbox" class="checkbox" name="chek" id="chek" />
										</p>
										<p>
											개인정보 이용 약관 동의(필수) <input type="checkbox" class="checkbox" name="chek" id="chek" />
										</p>

									</div>
									<hr class="divider">
									<br /> <input type="submit" value="가입하기" class="btn btn-block btn-primary">
								</form>
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
</body>

</html>