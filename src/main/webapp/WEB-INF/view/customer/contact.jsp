<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
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
						<h2>고객센터</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked">공지</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"> <a href="/"> FAQ</a></li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center">1:1문의</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center">상품질문</li>
						</ul>
					</div>
				</div>
			</div>
			<br>
			<div class="row align-items-center">
				<div class="col text-center">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${no }"></c:when>
						</c:choose>
							<c:forEach items="${noticeList }" var="noticeList">
								<tr>
									<td>${noticeList.id }</td>
									<td>${noticeList.title }</td>
									<td>관리자</td>
									<td><fmt:formatDate value="${noticeList.create_at }" pattern="yyyy-MM-dd" /></td>
								</tr>	
															
							</c:forEach>
						</tbody>	
					</table>
				</div>
			</div>
		</div>
	<jsp:include page="../layout/header.jsp" />

</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/js/custom.js"></script>
</body>
</html>