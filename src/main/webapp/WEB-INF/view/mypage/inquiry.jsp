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
<link rel="stylesheet" type="text/css" href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/styles/categories_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/categories_responsive.css">
<body>
	<div class="super_container">
	<!-- Header -->
		<jsp:include page="../layout/header.jsp" />
		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">
					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="/">Home</a></li>
							<li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>mypage</li>
							<li class="active"><i class="fa fa-angle-right" aria-hidden="true"></i>문의내역</li>
						</ul>
					</div>
				</div>
			</div>
			
<!-- 					Sidebar -->
			<div class="row">
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h4>마이페이지</h4>
							</div>
							<br>
							<ul class="sidebar_categories">
								<li><h5>주문내역</h5></li>
								<li ><a href="#">전체 주문 내역</a></li>
								<li class="active"><a href="#"><span><i class="fa fa-angle-double-right" aria-hidden="true"></i></span>취소/반품/교환 내역</a></li>
								<li><a href="#">환불/입금 내역</a></li>
								<li><a href="/mypage/inquiry">문의내역</a></li>
								<li><a href="#">회원정보 변경</a></li>
								<li><a href="#">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<c:if test="${param.type == 3 || param.type == null}">
						<div class="product_sorting">
							<h3>1:1문의</h3>
						</div>
					</c:if>
					<c:if test="${param.type == 4 }">
						<div class="product_sorting">
							<h3>상품문의</h3>
						</div>
					</c:if>
					<div class="pages d-flex flex-row align-items-center">
						<ul class="product_sorting">
							<li>
								<span class="type_sorting_text">1:1문의</span>
								<i class="fa fa-angle-down"></i>
								<ul class="sorting_type">
									<li class="type_sorting_btn" onclick="location.href='/mypage/inquiry?type=3'"><span>1:1문의</span></li>
									<li class="type_sorting_btn" onclick="location.href='/mypage/inquiry?type=4'"><span>상품문의</span></li>
								</ul>
							</li>
						</ul>
					</div>
					<br><br><br>
					<div class="row align-items-center">
						<div class="col text-center">
							<table class="table">
								<tbody>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>답변상태</th>
										</tr>
									</thead>
								<tbody>
								<c:forEach items="${userCustomerList }" var="userCustomerList">
									<tr>
										<td>${userCustomerList.id }</td>
											<c:if test="${userCustomerList.secret eq 0 }">
												<td><a href="/customer/detail?id=${userCustomerList.id }">${userCustomerList.title }</a></td>
											</c:if>
											<c:if test="${userCustomerList.secret eq 1 }">
												<td><a href="/customer/detail?id=${userCustomerList.id }">🔒${userCustomerList.title }</a></td>
											</c:if>
										<td>${sessionScope.principal.userName }</td>
										<td><fmt:formatDate value="${userCustomerList.created_at }" pattern="yyyy. MM. dd" /></td>
										<c:if test="${userCustomerList.status != null}">
											<td>답변완료</td>
										</c:if>
										<c:if test="${userCustomerList.status eq null}">
											<td>답변미완료</td>
										</c:if>
										
									</tr>	
								</c:forEach>						
								</tbody>	
							</table>
							
							<c:if test="${param.type == 3 || param.type == null}">
								<button onclick="location.href='/customer/write?type=inquiry'" type="button" class="btn btn-outline-secondary float-right btn-lg"  style='cursor:pointer;'>글쓰기</button>
							</c:if>
							<c:if test="${param.type == 4 }">
								<button onclick="location.href='/customer/write?type=productInquiry'" type="button" class="btn btn-outline-secondary float-right btn-lg"  style='cursor:pointer;'>글쓰기</button>
							</c:if>
						</div>
						
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
<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/js/categories_custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>