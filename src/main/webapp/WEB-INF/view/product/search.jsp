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
<link rel="stylesheet" type="text/css" href="/css/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/responsive.css">



</head>

<body>
	<div class="super_container">
		<jsp:include page="../layout/header.jsp" />
		<br><br><br>
			<div class="new_arrivals">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<div class="section_title new_arrivals_title">
							
								<h4>"${param.keyword}"에대한 검색결과</h4>
								
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-lg-12 text-center">
						
							<div class="new_arrivals_sorting">
								<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
									<li>
										<form action="/product/search">
											<div  class="d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center" style="height: 90px;">
												<input id="newsletter_email" type="text" value="${param.keyword }" name="keyword" style="border: 1px solid #fe4c50;">
												<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">검색</button>
											</div>
											<div style="margin-bottom: 20px;">
												<span>판매가격대</span>&nbsp;&nbsp;

												<input id="input_price1" class="form-control-sm input_ph " type="text" name="price1" placeholder="0" style="text-align: right; border: 1px solid darkgray;" > ~ 
												<input id="input_price2" class="form-control-sm input_ph" type="text" name="price2" placeholder="${MaxPrice }" style="text-align: right; border: 1px solid darkgray;">

											</div>
										</form>
									</li>
									
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">낮은가격순</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">높은가격순</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">상품평순</li>
									<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">등록일순</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
						
							<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
								<c:if test="${productList == null }">
									조회하신 상품이 없습니다
								</c:if>

								<!-- Product -->
								<c:if test="${productList != null }">
								<c:forEach items="${productList }" var="productList">
		
								<div class="product-item">

									<div class="product discount product_filter">
										<div class="product_image">
											<img src=${productList.pic_url } alt="">
										</div>
										<div class="favorite favorite_left"></div>
										<div class="product_info">
											<h6 class="product_name"><a href="/product/detail/${productList.id }">${productList.name }</a></h6>
											<div class="product_price">${productList.price }</div>
										</div>
									</div>
									<div class="red_button add_to_cart_button"><a href="/cart/add?id=${productList.id }">장바구니 담기</a></div>
								</div>

								
								</c:forEach>
								
								</c:if>
								

							</div>
						</div>
					</div>
					
					<div class="row" id="dataList">
<!-- 						무한스크롤 카드 들어가는 자리 -->
					</div>
				</div>
			</div>
		<jsp:include page="../layout/footer.jsp" />
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
<script>
    let page = 2; // 초기 페이지
    const pageSize = 5; // 한 페이지에 표시될 항목 수

    // 스크롤 이벤트 리스너
    $(window).scroll(function() {
      if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
        // 스크롤이 맨 아래로 내려갔을 때
        loadMoreData();
      }
    });

    function loadMoreData() {
      // 새로운 페이지 데이터 요청
      $.ajax({
        url: '/product/getData?keyword=${param.keyword}', // 서버에서 데이터를 가져올 엔드포인트
        type: 'GET',
        data: { page: page, pageSize: pageSize }, // 페이지 및 페이지 크기 전달
        success: function(response) {
          // 받은 데이터를 처리하여 화면에 추가
          // 예시: 받은 데이터를 리스트에 추가하는 코드
          for (let i = 0; i < response.length; i++) {
//             $('#dataList').append('<li>' + response[i].name + '</li>');
            $('#dataList').append("<div  class='product-item'>" + 
										"<div class='product discount'>" +
										"<div class='product_image'>"+
											"<img src=" + response[i].pic_url + "alt=''>" +
										"</div>" +
										"<div class='favorite favorite_left'></div>" +
										"<div class='product_info'>" +
											"<h6 class='product_name'>" + "<a href='/product/detail/" +response[i].id +"'>" + response[i].name + "</a></h6>" +
											"<div class='product_price'>" + response[i].price + "</div>" +
										"</div>" +
									"</div>" +
									"<div class='red_button add_to_cart_button'><a href='/cart/add?id=" + response[i].id + "'>장바구니 담기</a></div>" +
								"</div>"
								);
          }
          page++; // 다음 페이지로 이동
        },
        error: function(xhr) {
          console.log("Error:", xhr);
        }
      });
    }
  </script>
</body>
</html>