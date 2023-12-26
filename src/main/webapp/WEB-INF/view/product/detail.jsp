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
<!-- Summernote CSS -->
<link rel="stylesheet"
	  href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	  integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg="
	  crossorigin="anonymous">
<script type="text/javascript">
	function addHeart(id) {
    	let user = '<%=session.getAttribute("principal")%>';
       	if(user == "null"){
			alert("로그인이 필요한 기능입니다.");
      		location.href='${pageContext.request.contextPath}/user/sign-in';
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
      		location.href='${pageContext.request.contextPath}/user/sign-in';
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
	 if (user == null || user === "null") {
		alert("로그인이 필요한 기능입니다.");
  		location.href='${pageContext.request.contextPath}/user/sign-in';
  		return false;
    } else {
    	alert("장바구니에 추가되었습니다.");
    	return true;
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
										<li class="active"><img src=${product.picUrl }
											alt="" data-image=${product.picUrl }></li>
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
							<%--<p style="color: gray">${product.content}</p>--%>
							<!--  -->
							<table>
								<tbody>
									<tr>
										<th scope="row">가격</th>
										<td class="price">${product.formatPrice()}</td>
									<tr>
										<th>등급</th>
										<td>${product.grade}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="free_delivery d-flex flex-row align-items-center justify-content-center">
							<span class="ti-truck"></span><span>배송비 주문시 결제 (+3,000원)</span>
						</div>
						<div
							class="quantity d-flex flex-column flex-sm-row align-items-sm-left">
							<c:choose>
								<c:when test="${product.status == 1}">
									<form action="/product/order" method="post">
										<input type="hidden" name="id" value="${product.id }" />
										<button type="submit" class="red_button2 buy_button">구매하기</button>
									</form>
								</c:when>
								<c:otherwise>
									<div class="white_button buy_button"
										style="pointer-events: none;">품절</div>
								</c:otherwise>
							</c:choose>
							<form action="/cart/add?id=${product.id }" method="post"
								onsubmit="return addToCartConfirmation()">
								<button type="submit" class="white_button buy_button">장바구니</button>
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
							<div class="col-lg-12 desc_col">
								<div class="tab_title">
									<h4>상품상세정보</h4>
								</div>

								<%-- ckeditor --%>
								<%--<div class="container">
									<textarea id="editor" name="content">${product.content}</textarea>
								</div>--%>
								<div id="summernote" name="content">${product.content}</div>
							</div>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row">

							<!-- 상품후기 -->

							<div class="reviews_col">
								<div class="tab_title reviews_title">
									<h4>상품후기 (2)</h4>
								</div>

								<!-- User Review -->

								<div
									class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua.</p>
									</div>
								</div>

								
								<div
									class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic"></div>
										<div class="user_rating">
											<ul class="star_rating">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">Brandon William</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua.</p>
									</div>
								</div>
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
									<div class="gray_button write_button">
										<a href="/customer/write">글쓰기</a>
									</div>
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
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>배송 서비스</h6>
							<p>신청만 하세요 집 앞까지 배달해 드립니다</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>저렴한 가격</h6>
							<p>금방 자라는 아이를 위한 맞춤 장난감을 저렴하게 이용해 보세요</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>손쉬운 반납</h6>
							<p>사용 완료 후 집에서 손쉽게 반납하실 수 있어요</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>연중 무휴 고객센터</h6>
							<p>궁금한 점이 있다면 언제든지 문의해주세요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="../layout/footer.jsp" />

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

	<%--<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
	<script>
		ClassicEditor
				.create(document.querySelector('#editor'))
				.then(editor => {
					console.log("------------------------------", editor);
					const toolbarElement = editor.ui.view.toolbar.element;
					toolbarElement.style.display = 'none';
					editor.enableReadOnlyMode( 'editor' );
					console.log('Editor was initialized', editor);
				})
				.catch(error => {
					console.error(error);
				});
	</script>--%>
</body>
<script>
	$('#summernote').summernote('disable');
	$('.note-toolbar').hide();
</script>
</html>