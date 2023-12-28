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

				<%--<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Contact</a></li>
					</ul>
				</div>--%>

			</div>
		</div>
		<!-- Contact Us -->
		
		<div class="row">
			<div class="col-lg-12 get_in_touch_col">
				<div class="get_in_touch_contents">
				<c:choose>
					<c:when test="${inquiryDetail.code eq 1 }">
						<h1>공지사항</h1>
					</c:when>
					<c:when test="${inquiryDetail.code eq 2 }">
						<h1>FAQ</h1>
					</c:when>
					<c:when test="${inquiryDetail.code eq 3 }">
						<h1>1:1문의</h1>
					</c:when>
					<c:when test="${inquiryDetail.code eq 4 }">
						<h1>상품문의</h1>
					</c:when>
				</c:choose>
					<hr><br>
						<div>
							<h4>${inquiryDetail.title }</h4>
							<br>
							<p >${inquiryDetail.content }</p>
							<div class="container">
<%--								<textarea id="summernote" name="content">${inquiryDetail.content}</textarea>--%>
								<%--<div id="summernote">${inquiryDetail.content}</div>--%>
							</div>
						</div>
						<div>
						</div>
				</div>
			</div>
		</div>
		<hr>
		<c:if test="${inquiryDetail.code eq 3 or inquiryDetail.code eq 4 }">
			<h3>답변내용</h3>
			<p>${replyContent.content }</p>
		</c:if>
	</div>

	<!-- Newsletter -->

	
	<!-- Footer -->
	<jsp:include page="../layout/footer.jsp" />

</div>

<%--<script src="/js/jquery-3.2.1.min.js"></script>--%>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<%--<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>--%>
<script src="/js/contact_custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<%--<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>--%>
	<%--<script>
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
	<script>
		jQuery.noConflict();
		jQuery(document).ready(function($) {
			// Initialize Summernote
			$('#summernote').summernote({
				height: 300, // Set the height of the editor as needed
				readOnly: true // Set Summernote to readonly
			});
			$('#summernote').summernote('disable');

			// Hide the toolbar
			$('.note-toolbar').hide();
		});
	</script>
</body>
</html>