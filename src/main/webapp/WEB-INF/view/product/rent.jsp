<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/single_styles.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/single_responsive.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/main_styles.css">
<script src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function addHeart(id) {
    	let user = '<%=session.getAttribute("principal")%>';
       	if(user == "null"){
			alert("로그인이 필요한 기능입니다.");
      		location.href='${pageContext.request.contextPath}/user/signIn';
        } else {
        	var form={
        		id:id
           	};
        	$.ajax({
           		type : "POST",
           		url : "/mypage/wish-list",
        		cache : false,
          		contentType : 'application/json; charset=utf-8',
            	data : JSON.stringify(form),
            	success : function(result) {
           		alert("찜하기러기 끼룩끼룩~");
           		location.reload(); 
        		},
				error : function(e) {
        			console.log(e);
          	  		alert('찜할 수 없지렁이 꿈틀꿈틀~');
           			location.reload(); 
        		}
        	})
   		}
	}
	</script>
<script type="text/javascript">  
    function removeHeart(id, element) {
    	let user = '<%=session.getAttribute("principal")%>';
       	if(user == "null"){
			alert("로그인이 필요한 기능입니다.");
      		location.href='${pageContext.request.contextPath}/user/signIn';
        } else {
        	var form={
           		id:id
        	};
        	$.ajax({
              	type : "POST",
              	url : "/mypage/wish-list",
           		cache : false,
              	contentType : 'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(result) {
                	alert("찜하기러기 끼룩끼룩~");
                	element.classList.add('active'); 
                },
				error : function(e) {
            		console.log(e);
             		alert('찜할 수 없지렁이 꿈틀꿈틀~');
              		location.reload(); 
            	}
       		})
       	}
	}
    </script>
<script type="text/javascript">
 	function cancelHeart(id) { 
   		let user = '<%=session.getAttribute("principal")%>'; 
		var form = { 
			id : id, 
 		}; 
 		$.ajax({ 
 			type : 'post', 
 			url : "/mypage/wish-list/cancel", 
 			cache : false, 
 			processData : false, 
 			contentType : 'application/json; charset=utf-8', 
			data : JSON.stringify(form), 
 			success : function(result) {
				location.reload();
       		    	alert('해당 상품을 찜 취소 하셨습니다.'); 
 			}, 
 			error : function(e) { 
 				alert('찜 취소 할 수 없습니다.'); 
 				location.reload(); // 실패시 새로고침하기 
 			}
 		});
 	} 
 	</script>
<script type="text/javascript">
function addToCartConfirmation() {
	let user = '<%=session.getAttribute("principal")%>'; 
	var selectedValue = document.getElementById("selectedMonth").value;
	if (selectedValue === "") {
    	alert("구매할 기간을 선택해주세요.");
    } else {
		if (user == null || user === "null") {
			alert("로그인이 필요한 기능입니다.");
  			location.href='${pageContext.request.contextPath}/user/signIn';
    	} else {
    		alert("장바구니에 추가되었습니다.");
    		document.getElementById("cartForm").submit();
    	}
    }
}
</script>
</head>
<body>
	<div class="super_container">

		<!-- Header -->

		<jsp:include page="../layout/header.jsp" />

		<!-- Hamburger Menu -->

		<div class="hamburger_menu">
			<div class="hamburger_close">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
			<div class="hamburger_menu_content text-right">
				<ul class="menu_top_nav">
					<li class="menu_item has-children"><a href="#"> usd <i
							class="fa fa-angle-down"></i>
					</a>
						<ul class="menu_selection">
							<li><a href="#">cad</a></li>
							<li><a href="#">aud</a></li>
							<li><a href="#">eur</a></li>
							<li><a href="#">gbp</a></li>
						</ul></li>
					<li class="menu_item has-children"><a href="#"> English <i
							class="fa fa-angle-down"></i>
					</a>
						<ul class="menu_selection">
							<li><a href="#">French</a></li>
							<li><a href="#">Italian</a></li>
							<li><a href="#">German</a></li>
							<li><a href="#">Spanish</a></li>
						</ul></li>
					<li class="menu_item has-children"><a href="#"> My Account
							<i class="fa fa-angle-down"></i>
					</a>
						<ul class="menu_selection">
							<li><a href="#"><i class="fa fa-sign-in"
									aria-hidden="true"></i>Sign In</a></li>
							<li><a href="#"><i class="fa fa-user-plus"
									aria-hidden="true"></i>Register</a></li>
						</ul></li>
					<li class="menu_item"><a href="#">home</a></li>
					<li class="menu_item"><a href="#">shop</a></li>
					<li class="menu_item"><a href="#">promotion</a></li>
					<li class="menu_item"><a href="#">pages</a></li>
					<li class="menu_item"><a href="#">blog</a></li>
					<li class="menu_item"><a href="#">contact</a></li>
				</ul>
			</div>
		</div>

		<div class="container single_product_container">
			<div class="row">
				<div class="col">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<!-- 카테고리 분류 -->
							<li><a href="index.html">Home</a></li>
							<li><a href="categories.html"><i
									class="fa fa-angle-right" aria-hidden="true"></i>${product.firstCategoryId}</a></li>
							<li class="active"><a href="#"><i
									class="fa fa-angle-right" aria-hidden="true"></i>${product.secondCategoryId}</a></li>
						</ul>
					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-7">
					<div class="single_product_pics">
						<div class="row">
							<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
								<div class="single_product_thumbnails">
									<ul>
										<li><img src="/images/single_1_thumb.jpg" alt=""
											data-image="/images/single_1.jpg"></li>
										<li class="active"><img src=${product.picUrl } alt=""
											data-image=${product.picUrl }></li>
										<li><img src="/images/single_3_thumb.jpg" alt=""
											data-image="/images/single_3.jpg"></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-9 image_col order-lg-2 order-1">
								<div class="single_product_image">
									<div class="single_product_image_background"
										style="background-image: url(${product.picUrl })"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="product_details">
						<div class="product_details_title">
							<h3>${product.name}</h3>
							<!-- 상세 정보 표시 -->
							<p style="color: gray">${product.content}</p>
							<!--  -->
							<table>
								<tbody>
									<tr>
										<th scope="row">가격</th>
										<td class="price" id="price">${product.formatPrice()}</td>
									</tr>
									<tr>
										<th>등급</th>
										<td>${product.grade}</td>
									</tr>
									<tr>
										<th>기간</th>
										<td><select id="selectedMonth" name="selectedMonth"
											onchange="displayText()">
												<option value="none">선택</option>
												<option value="1">1개월 (+ 0원)</option>
												<option value="2">2개월 (+ 5,000원)</option>
												<option value="3">3개월 (+ 10,000원)</option>
										</select></td>
									</tr>
									<tr>
										<th>추가금액</th>
										<td>
											<p id="outputText" style="padding-top: 3px;">기간을 선택해주세요.</p>
										</td>
									</tr>
								</tbody>
							</table>
							<div
								style="font-weight: bold; font-size: 20px; line-height: 50px; height: 50px;">
								총 가격 <span id="totalPriceDisplay"
									style="color: brown; font-weight: bold; font-size: 20px; float: right; padding-right: 35px">
									${product.formatPrice()}</span>
							</div>
						</div>
						<div
							class="free_delivery d-flex flex-row align-items-center justify-content-center"
							style="margin: 15px; margin-left: 18px">
							<span class="ti-truck"></span><span>배송비 주문시 결제 (+3,000원)</span>
						</div>
						<div
							class="quantity d-flex flex-column flex-sm-row align-items-sm-left">
							<c:choose>
								<c:when test="${product.status == 1}">
									<form id="purchaseForm" action="/product/order" method="post">
										<input type="hidden" name="id" value="${product.id }" />
										<button type="button" class="red_button2 buy_button"
											onclick="optionCheck()">구매하기</button>
									</form>
								</c:when>
								<c:otherwise>
									<div class="white_button buy_button"
										style="pointer-events: none;">품절</div>
								</c:otherwise>
							</c:choose>
							<form id="cartForm" action="/cart/add?id=${product.id }"
								method="post">
								<input type="hidden" name="id" value="${product.id }" />
								<button type="button" class="white_button buy_button"
									onclick="addToCartConfirmation()">장바구니</button>
							</form>
							<c:choose>
								<c:when test="${isWished}">
									<div onclick="cancelHeart(${product.id })"
										class="product_favorite active d-flex flex-column align-items-center 
										justify-content-center"></div>
								</c:when>
								<c:otherwise>
									<div onclick="addHeart(${product.id })"
										class="product_favorite d-flex flex-column align-items-center 
										justify-content-center"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabs_container">
						<ul
							class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>상품상세정보</span></li>
							<li class="tab" data-active-tab="tab_2"><span>상품후기</span></li>
							<li class="tab" data-active-tab="tab_3"><span>상품문의</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">

					<!-- 상품상세정보 -->

					<div id="tab_1" class="tab_container active">
						<div class="row">
							<div class="col-lg-5 desc_col">
								<div class="tab_title">
									<h4>상품상세정보</h4>
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla
										deumantos solicitud felis. Pellentesque diam dolor, elementum
										etos lobortis des mollis ut...</p>
								</div>
								<div class="tab_image">
									<img src="/images/desc_1.jpg" alt="">
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla
										deumantos solicitud felis. Pellentesque diam dolor, elementum
										etos lobortis des mollis ut...</p>
								</div>
							</div>
							<div class="col-lg-5 offset-lg-2 desc_col">
								<div class="tab_image">
									<img src="/images/desc_2.jpg" alt="">
								</div>
								<div class="tab_text_block">
									<h2>Pocket cotton sweatshirt</h2>
									<p>Nam tempus turpis at metus scelerisque placerat nulla
										deumantos solicitud felis. Pellentesque diam dolor, elementum
										etos lobortis des mollis ut...</p>
								</div>
								<div class="tab_image desc_last">
									<img src="/images/desc_3.jpg" alt="">
								</div>
							</div>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row">

							<!-- 사용후기 -->
							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title">
									<h4>Reviews (${countReview })</h4>
								</div>

								<!-- User Review -->
								<table>
									<tbody>
										<c:forEach var="review" items="${review}">
											<tr>
												<td>${review.user_name}
												<c:set var="rateValue" value="${review.rate}" />
													<ul class="star_rating">
														<li><i
															class="fa fa-star${(rateValue >= 1) ? '' : '-o'}"
															aria-hidden="true"></i></li>
														<li><i
															class="fa fa-star${(rateValue >= 2) ? '' : '-o'}"
															aria-hidden="true"></i></li>
														<li><i
															class="fa fa-star${(rateValue >= 3) ? '' : '-o'}"
															aria-hidden="true"></i></li>
														<li><i
															class="fa fa-star${(rateValue >= 4) ? '' : '-o'}"
															aria-hidden="true"></i></li>
														<li><i
															class="fa fa-star${(rateValue == 5) ? '' : '-o'}"
															aria-hidden="true"></i></li>
													</ul>
												</td>
											</tr>
											<tr>
												<td>${review.created_at}</td>
											</tr>
											<tr>
												<td>${review.content}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>

					<!-- 상품문의 -->

					<div id="tab_3" class="tab_container">
						<div class="row">
							<div class="col additional_info_col">
								<div class="tab_title additional_info_title">
									<h4>상품문의</h4>
									<br>
									<button type="button" class="gray_button"
										onclick="location.href='/customer/write?type=productInquiry'">글쓰기</button>
								</div>

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
													<c:when test="${param.type == 1 or param.type == 2}">
														<c:forEach items="${customerList }" var="customerList">
															<tr>
																<td>${customerList.id }</td>
																<td>${customerList.title }</td>
																<td>관리자</td>
																<td><fmt:formatDate
																		value="${customerList.create_at }"
																		pattern="yyyy-MM-dd" /></td>
															</tr>

														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach items="${customerList }" var="customerList">
															<tr>
																<td>${customerList.id }</td>
																<td>${customerList.title }</td>
																<td>${customerList.username }</td>
																<td><fmt:formatDate
																		value="${customerList.create_at }"
																		pattern="yyyy. MM. dd" /></td>
															</tr>

														</c:forEach>
													</c:otherwise>
												</c:choose>

											</tbody>
										</table>

									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-truck" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-money" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-undo" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-clock-o" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div
						class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first
							purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<form action="post">
						<div
							class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
							<input id="newsletter_email" type="email"
								placeholder="Your email" required="required"
								data-error="Valid email is required.">
							<button id="newsletter_submit" type="submit"
								class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div
						class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="#">FAQs</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div
						class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-skype"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"
									aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_nav_container">
						<div class="cr">
							©2018 All Rights Reserverd. This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#">Colorlib</a>
							&amp; distributed by <a href="https://themewagon.com">ThemeWagon</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	</div>


	<script src="/css/styles/bootstrap4/popper.js"></script>
	<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/plugins/easing/easing.js"></script>
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="/js/single_custom.js"></script>
	<script src="/js/cart.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function submitForm() {
			document.getElementById('addToCartForm').submit();
		}
		
	</script>
	<script>
    function displayText() {
        var selectedValue = document.getElementById("selectedMonth").value;
        var basePrice = document.getElementById("price").value;

        var extraTextElement = document.getElementById("outputText");
        var totalTextElement = document.getElementById("totalPriceDisplay");
        var totalPrice = ${product.price};
        
	   
        
        switch (selectedValue) {
            case "1":
            	extraTextElement.textContent = "0원";
                break;
            case "2":
            	extraTextElement.textContent = "5,000원";
                break;
            case "3":
            	extraTextElement.textContent = "10,000원";
                break;
            default:
            	extraTextElement.textContent = "기간을 선택해주세요.";
                break;
        }
        if (selectedValue != 'none') {
            totalPrice = ${product.price} + (parseInt(selectedValue) - 1) * 5000 + 3000;
            document.getElementById("totalPriceDisplay").textContent = totalPrice.toLocaleString('ko-KR') + '원';
        } else {
        	document.getElementById("totalPriceDisplay").textContent = totalPrice.toLocaleString('ko-KR') + '원';
        }
    }
</script>
	<script type="text/javascript">
function optionCheck() {
	let user = '<%=session.getAttribute("principal")%>';
    var selectedValue = document.getElementById("selectedMonth").value;
   	if (selectedValue === "") {
    	alert("기간을 선택해주세요.");
    } else {
    	if(user == "null"){
    		alert("로그인이 필요한 기능입니다.");
      		location.href='${pageContext.request.contextPath}/user/signIn';
        } else {
    		document.getElementById("purchaseForm").submit();
   		} 
	}
}
</script>


</body>
</html>