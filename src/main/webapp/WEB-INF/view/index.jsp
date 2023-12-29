<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

	<style>

		.post-slider .post-wrapper{
			width:100%;
			height:470px;
			margin-top: 101px;

		}
		.post-slider .post-wrapper .post{
			width:300px;
			height:470px;
			display:inline-block;
			background:gray;
		}
	</style>

</head>
<body>

<div class="super_container">

	<!-- Header -->

	<jsp:include page="layout/header.jsp" />

	<!-- Slider -->
	<div class="fs_menu_overlay"></div>
	<div class="post-slider ">
		<div class="post-wrapper " id="slider-div">
			<div class="post" style="background-image:url(../../../../../images/mvisual01.jpg)"></div>
			<div class="post" style="background-image:url(../../../../../images/mvisual02.jpg)"></div>
			<div class="post" style="background-image:url(../../../../../images/mvisual03.jpg)"></div>
		</div>
	</div>



		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>신규 장난감</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">전체</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">대여물품</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">판매물품</li>
							<%--<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">인기상품</li>--%>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
						<c:forEach var="product" items="${productList}">
							<a href="/product/detail/${product.id}">
								<div class="product-item ${product.code == 1 ? 'women' : 'accessories'}">
									<div class="product discount product_filter">
											<div class="product_image">
												<img src="/images/${product.picUrl}" alt="">
											</div>
												<%--<div class="favorite favorite_left"></div>--%>
												<%--<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-500원</span></div>--%>
											<div class="product_info">
												<h6 class="product_name">${product.name}</h6>
												<div class="product_price">${product.formatDecimal()}원
														<%--<span>5,500원</span>--%>
												</div>
											</div>

									</div>
								</div>
							</a>
						</c:forEach>



				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->

	<jsp:include page="layout/footer.jsp" />

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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
	$(function(){
		$('#slider-div').slick({
			slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li
			infinite : true, 	//무한 반복 옵션
			slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
			dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
			autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 3000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			// prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
			// nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
			dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : false, 	//드래그 가능 여부

			responsive: [ // 반응형 웹 구현 옵션
				{
					breakpoint: 960, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:1
					}
				},
				{
					breakpoint: 768, //화면 사이즈 768px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2
					}
				}
			]

		});
	})
</script>
</body>
</html>