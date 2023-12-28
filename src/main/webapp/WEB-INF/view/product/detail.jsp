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
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
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
			location.reload();
      		location.href= '<%= request.getContextPath() %>/user/signIn';
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
	 if (user == null || user === "null") {
		alert("로그인이 필요한 기능입니다.");
  		location.href='${pageContext.request.contextPath}/user/signIn';
  		return false;
    } else {
    	return true;
    }
}
</script>

<script type="text/javascript">
window.addEventListener('pageshow', function(event) {
    if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
        location.reload(true);
    }
});
</script>
	<style>
		/* CKEditor 테두리 없애기 */
		.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
			border: none;
			border-radius: 0; /* 선택적으로 border-radius를 0으로 설정할 수 있습니다. */
		}
	</style>
	

</head>
<body>
	<div class="super_container">

		<!-- Header -->

		<jsp:include page="../layout/header.jsp" />

		<!-- Hamburger Menu -->



		<div class="container single_product_container">
			<div class="row">
				<div class="col">

					<!-- Breadcrumbs -->


				</div>
			</div>

			<div class="row">
				<div class="col-lg-7">
					<div class="single_product_pics">
						<div class="row">

							<div class="col-lg-9 image_col order-lg-2 order-1">
								<div class="single_product_image">
									<%--<div class="single_product_image_background"
										style="background-image: url(${product.picUrl })"></div>--%>
										<div class="single_product_image_background"
											 style="background-image: url(${product.formatImgUrl() })"></div>
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
							<li class="tab" data-active-tab="tab_2"><span>상품문의</span></li>
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



					<!-- 상품문의 -->

					<div id="tab_2" class="tab_container">
						<div class="row">
							<div class="col additional_info_col">
								<div class="tab_title additional_info_title">
									<h4>상품문의</h4>
									<br>
									<div class="gray_button write_button">
										<a href="/customer/write?type=productInquiry&pId=${product.id}">글쓰기</a>
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