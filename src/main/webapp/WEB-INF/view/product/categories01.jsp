<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<!-- Header -->

		<jsp:include page="../layout/headerSub.jsp" />
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



					<!-- Sidebar -->

					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Sub Category</h5>
							</div>
							<ul class="sidebar_categories">
								<!-- <li><a href="#">모빌/유아침대</a></li> -->
<%--								secondCategoryList--%>

                                <c:choose>
                                    <c:when test="${secondCategoryList != null}">
                                        <c:forEach var="secondCategoryList" items="${secondCategoryList}" >

<%--												<li class="active"><a href="/product/1/categories/${secondCategoryList.id}"> <span><i--%>
<%--														class="fa fa-angle-double-right" aria-hidden="true"></i></span>${secondCategoryList.secondCategoryName}--%>
<%--												</a></li>--%>
                                                <li ><a href="/product/${secondCategoryList.firstCategoryId}/categories/${secondCategoryList.id}"> <span><i
                                                        class="fa fa-angle-double-right" aria-hidden="true"></i></span>${secondCategoryList.secondCategoryName}
                                                </a></li>

										</c:forEach>
									</c:when>
								</c:choose>

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
                                        <c:choose>
                                        <c:when test="${productList2 != null}">
                                        <c:forEach var="productList2" items="${productList2}" >
                                            <div class="product-item">
                                                <a href="/product/rent/${productList2.id}">
                                                    <div class="product discount product_filter">
                                                        <div class="product_image">
                                                            <img src="/images/${productList2.picUrl}" alt="">

                                                        </div>
                                                        <div class="favorite favorite_left"></div>

                                                        <div class="product_info">
                                                            <h6 class="product_name">${productList2.name}
                                                            </h6>
                                                            <div class="product_price">${productList2.price}</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <form action="/cart/${productList2.id}/add" method="get"
                                                      onsubmit="return addToCartConfirmation()">
                                                    <button type="submit" class="red_button add_to_cart_button">장바구니 추가</button>
                                                </form>

                                            </div>
                                        </c:forEach>
                                        </c:when>
                                        </c:choose>



									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../layout/footer.jsp" />

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