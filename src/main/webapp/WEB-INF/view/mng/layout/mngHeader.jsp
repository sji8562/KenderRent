<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>Kender-Rent</title>
<!-- Custom CSS -->
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/assets/images/favicon.png">
<!-- Custom CSS -->
<link href="/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="/dist/css/style.min.css" rel="stylesheet">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		  integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">

	<!-- Summernote CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
		  integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">

	<!-- Your Custom CSS -->
	<link rel="stylesheet" href="/css/style.css">


	<style>
/* 초기에는 숨겨진 상태 */
#applyManagement .collapse {
	display: none;
}

/* 마우스를 올릴 때 나타나게 함 */
#applyManagement.show .collapse {
	display: block;
}

#applyManagement.show .collapse li.sidebar-item {
	margin-left: 10px; /* 서브 메뉴 오른쪽으로 10px 이동 */
	font-size: 12px;
}
#noticeManagement .collapse {
	display: none;
}

/* 마우스를 올릴 때 나타나게 함 */
#noticeManagement.show .collapse {
	display: block;
}

#noticeManagement.show .collapse li.sidebar-item {
	margin-left: 10px; /* 서브 메뉴 오른쪽으로 10px 이동 */
	font-size: 12px;
}


/* Style for the links with class "rentalDetail" */
.applyDetail a {
	color: black;
	text-decoration: none; /* Remove underline */
}

/* Style for visited links with class "rentalDetail" */
.applyDetail a:visited {
	color: black;
}

/* Style for links with class "rentalDetail" on hover */
.applyDetail a:hover {
	color: gray;
	/* Change the color on hover if needed */
	/* You can add additional styles for hover if needed */
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin5">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<div class="navbar-brand">
						<a href="/mng" class="logo"> <!-- Logo icon --> <b
							class="logo-icon"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
								<!-- Dark Logo icon --> <img src="/assets/images/logo-icon.png"
								alt="homepage" class="dark-logo" /> <!-- Light Logo icon --> <img
								src="/assets/images/logo-light-icon.png" alt="homepage"
								class="light-logo" />
						</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
								<!-- dark Logo text --> <img src="/assets/images/logo-text.png"
								alt="homepage" class="dark-logo" /> <!-- Light Logo text --> <img
								src="/assets/images/logo-light-text.png" class="light-logo"
								alt="homepage" />
						</span>
						</a>
					</div>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->

				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin6">
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<%--<ul class="navbar-nav float-start me-auto">
						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)">
								<div class="d-flex align-items-center">
									<i class="mdi mdi-magnify font-20 me-1"></i>
									<div class="ms-1 d-none d-sm-block">
										<span>Search</span>
									</div>
								</div>
						</a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control"
									placeholder="Search &amp; enter"> <a class="srh-btn">
									<i class="ti-close"></i>
								</a>
							</form></li>
					</ul>--%>
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-end">
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
							href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="/assets/images/users/1.jpg" alt="user"
								class="rounded-circle" width="31">
						</a>
							<ul class="dropdown-menu dropdown-menu-end user-dd animated"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="javascript:void(0)"><i
									class="ti-user me-1 ms-1"></i> My Profile</a>
								<a class="dropdown-item" href="javascript:void(0)"><i
									class="ti-wallet me-1 ms-1"></i> My Balance</a>
								<a class="dropdown-item" href="javascript:void(0)"><i
									class="ti-email me-1 ms-1"></i> Inbox</a>
							</ul></li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
					</ul>
				</div>
			</nav>
		</header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng" aria-expanded="false"> <i
								class="mdi mdi-av-timer"></i> <span class="hide-menu">Dashboard</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/pages-profile" aria-expanded="false"> <i
								class="mdi mdi-account-network"></i> <span class="hide-menu">Profile</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/form-basic" aria-expanded="false"> <i
								class="mdi mdi-arrange-bring-forward"></i> <span
								class="hide-menu">Form Basic</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/product/list" aria-expanded="false"> <i
								class="mdi mdi-arrange-bring-forward"></i> <span
								class="hide-menu">물품 관리</span>
						</a></li>
						<li class="sidebar-item"><a
								class="sidebar-link waves-effect waves-dark sidebar-link"
								href="/mng/product/categories" aria-expanded="false"> <i
								class="mdi mdi-arrange-bring-forward"></i> <span
								class="hide-menu">카테고리 관리</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/table" aria-expanded="false"> <i
								class="mdi mdi-border-none"></i> <span class="hide-menu">Table</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/icon-material" aria-expanded="false"> <i
								class="mdi mdi-face"></i> <span class="hide-menu">Icon</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/blank" aria-expanded="false"> <i
								class="mdi mdi-file"></i> <span class="hide-menu">Blank</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/error-404" aria-expanded="false"> <i
								class="mdi mdi-alert-outline"></i> <span class="hide-menu">404</span>
						</a></li>

						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/user/list" aria-expanded="false"> <i
								class="mdi mdi-alert-outline"></i> <span class="hide-menu">유저
									관리</span>
						</a></li>
						<li class="sidebar-item" id="applyManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/apply/list" aria-expanded="false"> <i
								class="mdi mdi-alert-outline"></i> <span class="hide-menu">신청
									관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<!-- 대여신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/rental-list"> <i class="mdi mdi-view-dashboard"></i>
										<span class="hide-menu">대여신청</span>
								</a></li>
								<!-- 판매신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/sale-list"> <i class="mdi mdi-view-dashboard"></i>
										<span class="hide-menu">판매신청</span>
								</a></li>
								<!-- 구매신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/purchase-list"> <i
										class="mdi mdi-view-dashboard"></i> <span class="hide-menu">구매신청</span>
								</a></li>
							</ul></li>


							<%-- 회사 소개 게시판 --%>
							<li class="sidebar-item" id="boardManagement"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/content/info" aria-expanded="false"> <i
									class="mdi mdi-alert-outline"></i> <span class="hide-menu">회사 소개 게시판</span>

							</a>

							</a></li>

<%--						문의--%>
						<li class="sidebar-item" id="noticeManagement"><a
								class="sidebar-link waves-effect waves-dark sidebar-link"
								href="/mng/board/noticeList" aria-expanded="false"> <i
								class="mdi mdi-alert-outline"></i> <span class="hide-menu">게시판 관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<!-- 대여신청 -->
								<li class="sidebar-item"><a
										class="sidebar-link waves-effect waves-dark sidebar-link"
										href="/mng/board/noticeList"> <i class="mdi mdi-view-dashboard"></i>
									<span class="hide-menu">공지사항</span>

								</a></li>
								<!-- 판매신청 -->
								<li class="sidebar-item"><a
										class="sidebar-link waves-effect waves-dark sidebar-link"

										href="/mng/board/faq-list"> <i class="mdi mdi-view-dashboard"></i>

									<span class="hide-menu">자주 묻는 질문</span>
								</a></li>
								<!-- 구매신청 -->
								<li class="sidebar-item"><a
										class="sidebar-link waves-effect waves-dark sidebar-link"

										href="/mng/board/mantomanList"> <i

										class="mdi mdi-view-dashboard"></i> <span class="hide-menu">1:1질문</span>
								</a></li>
								<li class="sidebar-item"><a
										class="sidebar-link waves-effect waves-dark sidebar-link"

										href="/mng/board/productqnaList"> <i
										class="mdi mdi-view-dashboard"></i> <span class="hide-menu">상품질문</span>
								</a></li>
							</ul></li>

					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->