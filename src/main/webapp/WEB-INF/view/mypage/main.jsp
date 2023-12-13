<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
	.mypage_order_info_cont{margin:0 0 30px 0; padding:35px 0 35px 0; font-size:0; border:1px solid #e3e3e3; border-top:1px solid #999999; text-align:center;}
.mypage_order_info_cont ol{display:inline-block; width:80%; font-size:0; border-right:1px solid #e3e3e3; vertical-align:middle;}
.mypage_order_info_cont ol li{display:inline-block; width:10%; min-width:66px; padding:0 10px 0 30px; font-size:13px; background:url('../../img/mypage/mypgae_ing_next_bg.png') no-repeat left 50px; text-align:center;}
.mypage_order_info_cont ol li:first-child{padding-left:10px; background:none 0;}
.mypage_order_info_cont ol li b{display:block; padding:0 0 15px 0;}
.mypage_order_info_cont ol li strong{display:inline-block; width:52px; height:52px; padding:10px 0 0 0; color:#ffffff; font-size:18px; background:url('../../img/mypage/mypgae_ing_list_bg.png') no-repeat 0 0; text-align:center;vertical-align:middle;}
.mypage_order_info_cont .active strong{background:url('../../img/mypage/mypgae_ing_deliver_bg.png') no-repeat 0 0;}

.mypage_order_info_cont .order_case_list{display:inline-block; width:19%; font-size:0; text-align:center; vertical-align:middle;}
.mypage_order_info_cont .order_case_list ul{display:inline-block; width:70%; font-size:0;}
.mypage_order_info_cont .order_case_list ul li{padding:8px 5px 10px 5px; font-size:12px; border-top:1px dotted #bfbfbf; text-align:left;}
.mypage_order_info_cont .order_case_list ul li:first-child{border-top:none 0;}
.mypage_order_info_cont .order_case_list ul li span{float:right;}
.mypage_order_info_cont .order_case_list ul li span > em,
.mypage_order_info_cont .order_case_list ul li span > strong{padding:0 3px 0 0; font-size:15px; color:#8FC400;}
</style>

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
							<li><a href="#">전체 주문 내역</a></li>
							<li class="active"><a href="#"><span><i class="fa fa-angle-double-right" aria-hidden="true"></i></span>취소/반품/교환 내역</a></li>
							<li><a href="#">환불/입금 내역</a></li>
							<li><a href="#">문의내역</a></li>
							<li><a href="#">회원정보 변경</a></li>
							<li><a href="#">배송지 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
<!-- 					오른쪽 -->
			<div class="col-lg-9">	
				<h3>진행 중인 주문</h3>
					<div class="mypage_order_info_cont">
		                <ol>
		                    <li class="">
		                        <b>입금대기</b>
		                        <strong>0</strong>
		                    </li>
		                    <li class="">
		                        <b>결제완료</b>
		                        <strong>0</strong>
		                    </li>
		                    <li class="">
		                        <b>상품준비중</b>
		                        <strong>0</strong>
		                    </li>
		                    <li class="">
		                        <b>배송중</b>
		                        <strong>0</strong>
		                    </li>
		                    <li class="">
		                        <b>배송완료</b>
		                        <strong>0</strong>
		                    </li>
		                    <li class="">
		                        <b>구매확정</b>
		                        <strong>0</strong>
		                    </li>
		                </ol>
	                <div class="order_case_list">
	                    <ul>
	                        <li>
	                            <b>• 취소</b>
	                            <span>0건</span>
	                        </li>
	                        <li>
	                            <b>• 교환</b>
	                            <span>0건</span>
	                        </li>
	                        <li>
	                            <b>• 반품</b>
	                            <span>0건</span>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            
	            
				최근 주문 정보 (최근 30일 내에 주문하신 내역입니다)
				최근 본 상품 (userName께서 본 최근 상품입니다)
				
			</div>
		</div>
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