<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Kinder Lend</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/css/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/responsive.css">

</head>
<body>
<div class="super_container">
	<!-- Header -->

	<jsp:include page="../layout/header.jsp" />

	<br><br><br><br><br><br><br>
	
	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>고객님 아이디 찾기가 완료 되었습니다.</h2>
						
					</div>
					
				</div>
			</div>
			<br>
			<hr>
			<div class="row">
				<div class="col text-center" style="border: 1px solid black;">
					<br>
					<h5 >이름 : ${foundUser.user_name }</h5>
					<br>
					<h5>email : ${foundUser.email }</h5> 
					<br>
				</div>
				
			</div>
			<div class="row">
				<div class="col text-center">
					<br><br>
					<button onclick="location.href='/user/signIn'" type="button"  value="로그인" class="btn btn-dark" style="cursor:pointer">로그인</button>
					<button onclick="location.href='/user/findPassword'" type="button"  value="비밀번호 찾기" class="btn btn-dark" style="cursor:pointer">비밀번호찾기</button>
				</div>
			</div>
		</div>	
	<jsp:include page="../layout/footer.jsp" />
	</div>
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>