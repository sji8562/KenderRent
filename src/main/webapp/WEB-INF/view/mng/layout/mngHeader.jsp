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
<title>Kinder-Lend</title>
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
<link href="/dist/css/mng.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg="
	crossorigin="anonymous">


	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Summernote CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg="
	crossorigin="anonymous">
	<!-- Include Summernote -->
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" integrity="sha384-GLhlTQ8iZS+9Ld5LKa7a5z3kzEpTluc6s/v5Z8DxN9JK6U7IE5MW5VsDUZt4Qvq" crossorigin="anonymous">--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js" integrity="sha384-SvYEXq8aS02lWqZoCc8y9vtqz6dUQDLIH9/2ScNvEbrCwfoUdMw8jC+U3+I2eE1T" crossorigin="anonymous"></script>--%>

<!-- Your Custom CSS -->
<link rel="stylesheet" href="/css/style.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<style>
/* 추가된 스타일 */
.scroll-sidebar {
	position: fixed;
	height: 100%;
	overflow-y: auto;
	background-color: #233242;
}

/*.navbar {*/
/*	z-index: 1001; !* 로고 위에 나타나도록 설정 *!*/
/*}*/
</style>
</head>

<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light"
				style="background-color: #233242;">
				<div class="navbar-header" data-logobg="skin5">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<div class="navbar-brand">


						<a href="/mng/" class="logo"> <!-- Logo icon --> <b
							class="logo-icon"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
								<img src="/assets/images/logo-icon.png" alt="homepage"
								class="dark-logo" /> <!-- Light Logo icon --> <img
								src="/images/Logo.png" style="width: 40px;" alt="homepage"
								class="light-logo" />
						</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
								<!-- dark Logo text --> <!-- Light Logo text --> <span
								style="color: white">Kinder Lend Admin</span>
						</span>


						</a>
					</div>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->



					<%--<div class="navbar-collapse collapse" id="navbarSupportedContent"

					data-navbarbg="skin6" style="justify-content: space-between;">
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->

					<!-- ============================================================== -->

					<ul class="navbar-nav float-end">
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a href="/mng/"
							id="navbarDropdown" aria-expanded="false"> <img src="/images/Logo.png" alt="user" width="31"></a> 

        


					</li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->


					</ul>

					<a href="/mng/logout"><button type="button" class="btn">로그아웃</button></a>
				</div>--%>
				</div>
			</nav>
		</header>

		<aside class="left-sidebar" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<%-- 대시보드 --%>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/" aria-expanded="false"> <i
								class="mdi mdi-view-dashboard"></i> <span class="hide-menu">Dashboard</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/pay/list" aria-expanded="false"> <i
								class="mdi mdi-cash-multiple"></i> <span class="hide-menu">결제
									관리</span>
						</a></li>
						<%-- 물품관리 --%>
						<li class="sidebar-item" id="productManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="#" aria-expanded="false" disabled=""> <i
								class="mdi mdi-dropbox"></i> <span class="hide-menu">물품
									관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<!-- 물품관리 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/product/list?code=1&keyword="> <i
										class="mdi mdi-archive"></i> <span class="hide-menu">대여용
											물품 관리</span>
								</a></li>
								<!-- 물품관리 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/product/listForSale?code=2&keyword="> <i
										class="mdi mdi-archive"></i> <span class="hide-menu">판매용
											물품 관리</span>
								</a></li>
								<!-- 구매신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/product/review?keyword="> <i
										class="mdi mdi-thumb-up"></i> <span class="hide-menu">대여
											후기 관리</span>

								</a></li>
							</ul></li>
						<li class="sidebar-item" id="categoryManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="#" aria-expanded="false" style="cursor: default"> <i
								class="mdi mdi-format-list-bulleted-type"></i> <span
								class="hide-menu">카테고리 관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<%--									code = 1--%>
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/product/categories"> <i
										class="mdi mdi-format-list-bulleted"></i> <span
										class="hide-menu">대여용 카테고리 관리</span>
								</a></li>
								<%--									code = 2--%>
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/product/categoriesForSale"> <i
										class="mdi mdi-format-list-numbers"></i> <span
										class="hide-menu">판매용 카테고리 관리</span>
								</a></li>
							</ul> <%-- 유저 관리 --%>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/user/list" aria-expanded="false"> <i
								class="mdi mdi-account"></i> <span class="hide-menu">유저
									관리</span>
						</a></li>
						<%-- 신청 관리 --%>
						<li class="sidebar-item" id="applyManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/apply/list" aria-expanded="false"> <i
								class="mdi mdi-tooltip-text"></i> <span class="hide-menu">신청
									관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<!-- 대여신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/rental-list"> <i class="mdi mdi-timer"></i>
										<span class="hide-menu">대여신청</span>
								</a></li>
								<!-- 판매신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/sale-list"> <i
										class="mdi mdi-cash-multiple"></i> <span class="hide-menu">판매신청</span>
								</a></li>
								<!-- 구매신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/apply/purchase-list"> <i
										class="mdi mdi-barcode-scan"></i> <span class="hide-menu">구매신청</span>
								</a></li>
							</ul></li>


						<%-- 회사 소개 게시판 --%>
						<li class="sidebar-item" id="boardManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/content/info" aria-expanded="false"> <i
								class="mdi mdi-information-variant"></i> <span class="hide-menu">회사
									소개 관리</span>
						</a></li>


						<%-- 게시판 관리 --%>
						<li class="sidebar-item" id="noticeManagement"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/board/noticeList" aria-expanded="false"> <i
								class="mdi mdi-file-document-box"></i> <span class="hide-menu">게시판
									관리</span>
						</a>
							<ul aria-expanded="false" class="collapse first-level">
								<!-- 대여신청 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/board/noticeList"> <i
										class="mdi mdi-information-outline"></i> <span
										class="hide-menu">공지사항</span>
								</a></li>
								<!-- 자주 묻는 질문 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/board/faq-list?keyword="> <i
										class="mdi mdi-comment-question-outline"></i> <span
										class="hide-menu">자주 묻는 질문</span>
								</a></li>
								<!-- 1:1 문의 -->
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/board/qna?keyword="> <i class="mdi mdi-forum"></i>
										<span class="hide-menu">1:1 문의</span>
								</a></li>
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="/mng/board/productqna?keyword="> <i
										class="mdi mdi-note-text"></i> <span class="hide-menu">상품질문</span>
								</a></li>
							</ul></li>
					</ul>
					<ul style="position: fixed; bottom: 0px;">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="/mng/logout"> <i class="mdi mdi-power"></i> <span
								class="hide-menu">로그아웃</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>