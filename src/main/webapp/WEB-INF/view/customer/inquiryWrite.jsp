<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Header -->

	<jsp:include page="../layout/headerSub.jsp" />

	<div class="fs_menu_overlay"></div>

	

	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Contact</a></li>
					</ul>
				</div>

			</div>
		</div>
		<!-- Contact Us -->

		<div class="row">
			<div class="col-lg-12 get_in_touch_col">
				<div class="get_in_touch_contents">
					<c:if test="${param.type=='inquiry' }">
						<h1>1:1 문의하기</h1>
					</c:if>
					<c:if test="${param.type=='productInquiry' }">
						<h1>상품문의</h1>
					</c:if>
					<br><br>
					<form action="/customer/write?type=${param.type}&pId=${param.pId}" method="post">
						<div>
						<div class="row">
							<div class = "col-lg-8 ">
								<input id="title" class="form_input input_website input_ph" type="text" name="title" placeholder="제목" required="required" data-error="Name is required.">
							</div>
							<div class="col-lg-1"></div>
							<div class="col-lg-3" >
								<div class="form-check" >
								  
								  <input name="isSecret" class="form-check-input " type="checkbox" value="1" id="flexCheckDefault" style="zoom:2.0;">
								  <label class="form-check-label" for="flexCheckDefault" style="font-size: 1.2rem; padding-top:10px;">
								    비밀글
								  </label>
								</div>
							</div>
						</div>
<!-- 							<input id="title" class="form_input input_website input_ph" type="text" name="title" placeholder="제목" required="required" data-error="Name is required."> -->
<!-- 							<div class="form-check"> -->
<!-- 							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> -->
<!-- 							  <label class="form-check-label" for="flexCheckDefault"> -->
<!-- 							    Default checkbox -->
<!-- 							  </label> -->
<!-- 							</div> -->
							<textarea id="content" class="input_ph input_message" name="content"  placeholder="내용" rows="10" required data-error="Please, write us a message."></textarea>
						</div>
						<div>
							<button type="submit" class="red_button message_submit_btn trans_300" value="Submit">문의하기</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- Newsletter -->

	
	<!-- Footer -->

	<jsp:include page="../layout/footer.jsp" />

</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/js/contact_custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>