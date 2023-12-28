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


						<%--<!-- Product 1 -->

						<div class="product-item women">
							<div class="product discount product_filter">
								<a href="/product/detail/90">
									<div class="product_image">
										<img src="/images/product_15.jpg" alt="">
									</div>
									&lt;%&ndash;<div class="favorite favorite_left"></div>&ndash;%&gt;
									&lt;%&ndash;<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-500원</span></div>&ndash;%&gt;
									<div class="product_info">
										<h6 class="product_name">와이크라이 미니 아기울음분석기</h6>
										<div class="product_price">5000원
											&lt;%&ndash;<span>5,500원</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 2 -->

						&lt;%&ndash; 대여 물품 &ndash;%&gt;
						<div class="product-item women men">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_111.png" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								&lt;%&ndash;<div class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center"><span>new</span></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">엑서쏘서 트리플펀 플러스 월드</a></h6>
									<div class="product_price">35,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 3 -->

						<div class="product-item women men">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_222.png" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">사파리 쏘서</a></h6>
									<div class="product_price">18,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 4 -->

						<div class="product-item accessories">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_11.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>&ndash;%&gt;
								&lt;%&ndash;<div class="favorite favorite_left"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">릴레이베이비 오가닉침받이</a></h6>
									<div class="product_price">15,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 5 -->

						<div class="product-item women men">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_333.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">뉴나리프바운서(신생아바운서)</a></h6>
									<div class="product_price">20,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 6 -->

						<div class="product-item accessories">
							<div class="product discount product_filter">
								<div class="product_image">
									<img src="/images/product_22.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="favorite favorite_left"></div>&ndash;%&gt;
								&lt;%&ndash;<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
									<span>-$20</span>
								</div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="#single.html">아벤트 숙면젖병 어드밴스 PES젖병 260ml 중간속도</a></h6>
									<div class="product_price">16,000원
										&lt;%&ndash;<span>20,000원</span>&ndash;%&gt;
									</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 7 -->

						<div class="product-item women men">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_444.png" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">컴포트 스윙(자동바운서)</a></h6>
									<div class="product_price">13,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 8 -->

						<div class="product-item accessories">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_33.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">비앤비 구강청결 멸균티슈 30매</a></h6>
									<div class="product_price">4,200원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 9 -->

						<div class="product-item women">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_16.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>&ndash;%&gt;
								&lt;%&ndash;<div class="favorite favorite_left"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">유팡 자외선 살균소독기 - 밀키그린</a></h6>
									<div class="product_price">45,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>

						<!-- Product 10 -->

						<div class="product-item women">
							<div class="product product_filter">
								<div class="product_image">
									<img src="/images/product_17.jpg" alt="">
								</div>
								&lt;%&ndash;<div class="favorite"></div>&ndash;%&gt;
								<div class="product_info">
									<h6 class="product_name"><a href="single.html">타프토이즈 촉감책</a></h6>
									<div class="product_price">5,000원</div>
								</div>
							</div>
							&lt;%&ndash;<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>&ndash;%&gt;
						</div>
					</div>--%>
				</div>
			</div>
		</div>
	</div>

	<%--<!-- Deal of the week -->

	<div class="deal_ofthe_week">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="deal_ofthe_week_img">
						<img src="/images/deal_ofthe_week.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 text-right deal_ofthe_week_col">
					<div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
						<div class="section_title">
							<h2>Deal Of The Week</h2>
						</div>
						<ul class="timer">
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="day" class="timer_num">03</div>
								<div class="timer_unit">Day</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="hour" class="timer_num">15</div>
								<div class="timer_unit">Hours</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="minute" class="timer_num">45</div>
								<div class="timer_unit">Mins</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="second" class="timer_num">23</div>
								<div class="timer_unit">Sec</div>
							</li>
						</ul>
						<div class="red_button deal_ofthe_week_button"><a href="#">shop now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>

	<!-- Best Sellers -->

	<%--<div class="best_sellers">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>Best Sellers</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product_slider_container">
						<div class="owl-carousel owl-theme product_slider">

							<!-- Slide 1 -->

							<div class="owl-item product_slider_item">
								<div class="product-item">
									<div class="product discount">
										<div class="product_image">
											<img src="/images/product_1.png" alt="">
										</div>
										<div class="favorite favorite_left"></div>
										<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
											<div class="product_price">$520.00<span>$590.00</span></div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 2 -->

							<div class="owl-item product_slider_item">
								<div class="product-item women">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_2.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center"><span>new</span></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
											<div class="product_price">$610.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 3 -->

							<div class="owl-item product_slider_item">
								<div class="product-item women">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_3.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
											<div class="product_price">$120.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 4 -->

							<div class="owl-item product_slider_item">
								<div class="product-item accessories">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_4.png" alt="">
										</div>
										<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>
										<div class="favorite favorite_left"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
											<div class="product_price">$410.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 5 -->

							<div class="owl-item product_slider_item">
								<div class="product-item women men">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_5.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
											<div class="product_price">$180.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 6 -->

							<div class="owl-item product_slider_item">
								<div class="product-item accessories">
									<div class="product discount">
										<div class="product_image">
											<img src="/images/product_6.png" alt="">
										</div>
										<div class="favorite favorite_left"></div>
										<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Fujifilm X100T 16 MP Digital Camera (Silver)</a></h6>
											<div class="product_price">$520.00<span>$590.00</span></div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 7 -->

							<div class="owl-item product_slider_item">
								<div class="product-item women">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_7.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Samsung CF591 Series Curved 27-Inch FHD Monitor</a></h6>
											<div class="product_price">$610.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 8 -->

							<div class="owl-item product_slider_item">
								<div class="product-item accessories">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_8.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Blue Yeti USB Microphone Blackout Edition</a></h6>
											<div class="product_price">$120.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 9 -->

							<div class="owl-item product_slider_item">
								<div class="product-item men">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_9.png" alt="">
										</div>
										<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>
										<div class="favorite favorite_left"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">DYMO LabelWriter 450 Turbo Thermal Label Printer</a></h6>
											<div class="product_price">$410.00</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slide 10 -->

							<div class="owl-item product_slider_item">
								<div class="product-item men">
									<div class="product">
										<div class="product_image">
											<img src="/images/product_10.png" alt="">
										</div>
										<div class="favorite"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="single.html">Pryma Headphones, Rose Gold & Grey</a></h6>
											<div class="product_price">$180.00</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Slider Navigation -->

						<div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
						</div>
						<div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
							<i class="fa fa-chevron-right" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>

	<!-- Benefit -->



	<!-- Blogs -->

	<%--<div class="blogs">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title">
						<h2>Latest Blogs</h2>
					</div>
				</div>
			</div>
			<div class="row blogs_container">
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background-image:url(/images/blog_1.jpg)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background-image:url(/images/blog_2.jpg)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background-image:url(/images/blog_3.jpg)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
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
					<div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<form action="post">
						<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
							<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
							<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>--%>

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