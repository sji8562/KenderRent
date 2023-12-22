<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<style>
@media ( min-width : 990px) {
	#hambuerBtn {
		display: none;
		font-size: 24px;
	}
}

@media ( max-width : 800px) {
	.size {
		display: none;
	}
}

#hamburger_menu {
	overflow-y: scroll;
}
/*  	#hamburger_menu::-webkit-scrollbar{ */
/*  		display: none; */
/*  	} */
</style>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="/js/wow.min.js"></script> -->
<header class="header trans_300">
	<!-- Main Navigation -->
	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="/">Kender<span>Rent</span></a>
					</div>

					<nav class="navbar">
						<ul class="navbar_menu">
							<li class="nav-item dropdown"><a href="/product/categories01"
								class="nav-link dropdown-toggle">빅사이즈 장난감</a>
								<div class="dropdown-menu m-0">
									<a href="price.html" class="dropdown-item">모빌</a> <a
										href="feature.html" class="dropdown-item">유아침대</a> <a
										href="team.html" class="dropdown-item">바운서</a> <a
										href="testimonial.html" class="dropdown-item">쏘서/점프앤런</a> <a
										href="quote.html" class="dropdown-item">베베블럭/러닝홈</a> <a
										href="quote.html" class="dropdown-item">보행기/부스터</a>
								</div></li>
							<li class="nav-item dropdown"><a href="/product/categories01"
								class="nav-link dropdown-toggle">스몰사이즈 장난감</a>
								<div class="dropdown-menu m-0">
									<a href="price.html" class="dropdown-item">3~6개월</a> <a
										href="feature.html" class="dropdown-item">6~12개월</a> <a
										href="team.html" class="dropdown-item">12~24개월</a> <a
										href="testimonial.html" class="dropdown-item">24개월~</a>
								</div></li>
							<li class="nav-item dropdown"><a href="/product/categories02"
								class="nav-link dropdown-toggle">유아가전제품</a>
								<div class="dropdown-menu m-0">
									<a href="price.html" class="dropdown-item">살균기</a> <a
										href="feature.html" class="dropdown-item">기타</a>
								</div></li>
							<li class="nav-item dropdown"><a href="/product/categories02"
								class="nav-link dropdown-toggle">산모용품</a>
								<div class="dropdown-menu m-0">
									<a href="price.html" class="dropdown-item">유축기</a> <a
										href="feature.html" class="dropdown-item">마사지기</a>
								</div></li>
							<li class="nav-item dropdown"><a href="/product/categories01"
								class="nav-link dropdown-toggle">책</a>
								<div class="dropdown-menu m-0">
									<a href="price.html" class="dropdown-item">촉감책</a> <a
										href="feature.html" class="dropdown-item">초점잭</a> <a
										href="feature.html" class="dropdown-item">그림책</a> <a
										href="feature.html" class="dropdown-item">동화책</a>
								</div></li>
							<li class="nav-item dropdown"><a href="/customer/contact"
								class="nav-link dropdown-toggle">고객센터</a>
								<div class="dropdown-menu m-0">
									<a href="/customer/contact?type=1" class="dropdown-item">공지사항</a>
									<a href="/customer/contact?type=2" class="dropdown-item">FAQ</a>
									<a href="/customer/contact?type=3" class="dropdown-item">1:1문의</a>
									<a href="/customer/contact?type=4" class="dropdown-item">상품질문</a>
								</div></li>
						</ul>

						<ul class="navbar_user">

							<!-- 								모달창 -->
							<li><butaton type="button" data-bs-toggle="modal"
									data-bs-target="#exampleModal" data-bs-whatever="@fat"
									style="cursor:pointer"> <i class="fa fa-search"
									aria-hidden="true"></i> </butaton></li>

							<c:choose>
								<c:when test="${sessionScope.principal != null }">
									<!-- 									유저 아이콘 -->
									<li><a href="/mypage/main"><i class="fa fa-user"
											aria-hidden="true"></i></a></li>

									<!-- 										장바구니아이콘 -->
									<li class="checkout "><a href="/cart"> <i
											class="fa fa-shopping-cart" aria-hidden="true"></i> <span
											id="checkout_items" class="checkout_items">${countItemCart}</span>
									</a></li>
									<li><a href="/user/logout">로그아웃</a></li>

								</c:when>

								<c:otherwise>
									<a class="size" href="/user/signIn" style="color: black">로그인</a>&nbsp;&nbsp;
										<a class="size" href="/user/signUp" style="color: black">회원가입</a>

								</c:otherwise>

							</c:choose>
						</ul>
						<div class="hamburger_container" id="hambuerBtn">
							<i class="fa fa-bars fa-lg" style="display: inline"></i>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>

</header>
<div class="fs_menu_overlay"></div>
<div class="hamburger_menu">
	<div class="hamburger_close">
		<i class="fa fa-times" aria-hidden="true"></i>
	</div>
	<div class="hamburger_menu_content text-right">
		<ul class="menu_top_nav">
			<li class="menu_item"><a href="/">home</a></li>
			<li class="menu_item has-children"><c:choose>
					<c:when test="${sessionScope.principal != null }">
						<a href="#"> ${sessionScope.principal.userName }님 환영합니다 <i
							class="fa fa-angle-down"></i>
						</a>
						<ul class="menu_selection">
							<li><a href="/mypage/main"><i class="fa fa-columns"></i>마이페이지</a></li>
							<li><a href="/user/logout"><i class="fa fa-sign-out"></i>로그아웃</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<a href="#">로그인<i class="fa fa-angle-down"></i>
						</a>
						<ul class="menu_selection">
							<li><a href="#"><i class="fa fa-sign-in"></i>로그인</a></li>
							<li><a href="#"><i class="fa fa-user-plus"></i>회원가입</a></li>
						</ul>
					</c:otherwise>
				</c:choose></li>

			<li class="menu_item has-children"><a href="#"> 빅사이즈 장난감 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">모빌</a></li>
					<li><a href="#">유아침대</a></li>
					<li><a href="#">바운서</a></li>
					<li><a href="#">쏘서/점프앤런</a></li>
					<li><a href="#">베베블럭/러닝홈</a></li>
					<li><a href="#">보행기/부스터</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 스몰사이즈 장난감 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">3~6개월</a></li>
					<li><a href="#">6~12개월</a></li>
					<li><a href="#">12~24개월</a></li>
					<li><a href="#">24개월~</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 유아가전제품 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">살균기</a></li>
					<li><a href="#">기타</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 유모차/카시트/아기띠
					<i class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">유모차</a></li>
					<li><a href="#">카시트</a></li>
					<li><a href="#">아기띠</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 산모용품 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">유축기</a></li>
					<li><a href="#">마사지기</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 책 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="#">촉감책</a></li>
					<li><a href="#">초점책</a></li>
					<li><a href="#">그림책</a></li>
					<li><a href="#">동화책</a></li>
				</ul></li>
			<li class="menu_item has-children"><a href="#"> 고객센터 <i
					class="fa fa-angle-down"></i>
			</a>
				<ul class="menu_selection">
					<li><a href="/customer/contact?type=1">공지사항</a></li>
					<li><a href="/customer/contact?type=2">FAQ</a></li>
					<li><a href="/customer/contact?type=3">1:1문의</a></li>
					<li><a href="/customer/contact?type=4">상품문의</a></li>
				</ul></li>

		</ul>
	</div>
</div>
<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body">
				<form action="/product/search">
					<div class="mb-3">
						<input type="text" class="form-control" name="keyword">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" style="cursor: pointer">닫기</button>
						<button type="submit" class="btn btn-primary"
							style="cursor: pointer">검색하기</button>
					</div>
				</form>
			</div>


		</div>
	</div>

</div>
<!-- 모달창 끝 -->

