<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="/css/styles/categories_responsive.css">
<style>
.post-slider .post-wrapper {
	width: 100%;
	padding-top: 101px;
}

.post-slider .post-wrapper .post {
	width: 100%;
	height: 170px;
	display: inline-block;
	background: gray;
}

.product-grid {
	display: flex;
	flex-wrap: wrap;
}

.product-item {
	box-sizing: border-box;
	padding: 10px;
	width: 33%;
}
</style>
</head>
<body>

	<div class="super_container">
		<!-- view/layout/header 에서 보낸 카테고리 request를 하나의 jsp 파일로 response하는 방법이 있나? -->
		<!-- header에서 각 카테고리별를 ONCLICK할때 발생하는 변수값을 REQUEST값으로 보내고, 그걸 JSP에서 받아 출력할..수있나?-->
		<!-- ${categories}? 빅사이즈 인형 버튼을 클릭시 변수값 toyB 이 categories.jsp에서 그에 따른 페이지를 구성 및 출력  -->
		<!-- ${first_category.fcid} 가 1인 경우  -->
		<!--  -->
		<!--  -->
		<!--  -->


		<!-- Header -->

		<jsp:include page="../../layout/header.jsp" />
		<%--	<div class="fs_menu_overlay"></div>--%>
		<div class="post-slider ">
			<div class="post-wrapper ">
				<div class="post"
					style="background-image: url(/images/subvisual.png)"></div>
			</div>
		</div>

		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="/">Category</a></li>
							<li class="active"><a href="mobile"><i
									class="fa fa-angle-right" aria-hidden="true"></i>Big-sized Toys</a></li>
						</ul>
					</div>

					<!-- Sidebar -->

					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Sub Category</h5>
							</div>
							<ul class="sidebar_categories">
								<li><a href="mobile">모빌/유아침대</a></li>
								<!-- <li class="active"><a href="mobile"> <span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>모빌/유아침대
								</a></li> -->
								<li><a href="bouncer">바운서</a></li>
								<!-- <li class="active"><a href="bouncer"> <span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>바운서
								</a></li> -->
								<li><a href="saucer">쏘서/점프앤런</a></li>
								<!-- <li class="active"><a href="saucer"> <span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>쏘서/점프앤런
								</a></li> -->
								<li><a href="learningHome">베베블럭/러닝홈</a></li>
								<!-- <li class="active"><a href="learningHome"> <span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>베베블럭/러닝홈
								</a></li> -->
								<!-- <li><a href="walker">보행기/부스터</a></li> -->
								<li class="active"><a href="walker"> <span><i
											class="fa fa-angle-double-right" aria-hidden="true"></i></span>보행기/부스터
								</a></li>
							</ul>
						</div>
					</div>

					<!-- Main Content -->

					<div class="main_content">

						<!-- Products -->

						<div class="products_iso">
							<div class="row">
								<div class="col">

									<!-- Product Grid -->

									<div class="product-grid">

										<!-- Product 1 -->

										<div class="product-item">
											<div class="product discount product_filter">
												<div class="product_image">
													<img src="/images/walker01.png" alt="">
												</div>
												<div class="favorite favorite_left"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 브이텍 걸음마보조기 대여 [걸음마학습기]</a>
													</h6>
													<div class="product_price">$13,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 2 -->

										<div class="product-item women">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker02.png" alt="">
												</div>
												<div class="favorite"></div>
												<div
													class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center">
													<span>new</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 치코 123 워커 보행기대여 그린색[장난감대여]</a>
													</h6>
													<div class="product_price">25,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 3 -->

										<div class="product-item women">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker03.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 치코 123 워커 보행기대여 오렌지색 [장난감대여]</a>
													</h6>
													<div class="product_price">25,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 4 -->

										<div class="product-item accessories">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker04.png" alt="">
												</div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>sale</span>
												</div>
												<div class="favorite favorite_left"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 쭈쭈 3in1 멀티보행기 블루색상 [보행기대여]</a>
													</h6>
													<div class="product_price">
														22,000원<span>25,000원</span>
													</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 5 -->

										<div class="product-item women men">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker05.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 오토바이보행기 대여 [유아용품,왕복택배비무료,세척제품]</a>
													</h6>
													<div class="product_price">25,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 6 -->

										<div class="product-item accessories">
											<div class="product discount product_filter">
												<div class="product_image">
													<img src="/images/walker06.png" alt="">
												</div>
												<div class="favorite favorite_left"></div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>-$20</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 베이비베이스 레드 [부스터대여,의자,범보]</a>
													</h6>
													<div class="product_price">15,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 7 -->

										<div class="product-item women">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker07.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 오리벨 코쿤 유아 식탁의자-오렌지</a>
													</h6>
													<div class="product_price">25,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 8 -->

										<div class="product-item accessories">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker08.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 콤비보행기 대여 [중고제품,왕복배송무료]</a>
													</h6>
													<div class="product_price">25,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 9 -->

										<div class="product-item accessories">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker09.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 콤보보행기 대여 [신형,새제품,왕복배송무료]</a>
													</h6>
													<div class="product_price">40,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
										</div>

										<!-- Product 10 -->

										<div class="product-item accessories">
											<div class="product product_filter">
												<div class="product_image">
													<img src="/images/walker10.png" alt="">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">[대여] 라이언스텝퍼 3in1 [걸음마보조기]</a>
													</h6>
													<div class="product_price">10,000원</div>
												</div>
											</div>
											<div class="red_button add_to_cart_button">
												<a href="#">add to cart</a>
											</div>
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
		<%--<div class="newsletter">
>>>>>>> af37d96339b5cce88e3773f914bb5724bad1deea
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
						<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
						<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
					</div>
				</div>
			</div>
		</div>
	</div>--%>

		<!-- Footer -->

		<jsp:include page="../layout/header.jsp" />

	</div>

	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="css/styles/bootstrap4/popper.js"></script>
	<script src="css/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/plugins/easing/easing.js"></script>
	<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="/js/categories_custom.js"></script>
	<script src="/js/dropdown.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>