<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<!-- Header -->

	<jsp:include page="../layout/headerSub.jsp" />

	<div class="container contact_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<%--<ul>--%>
					<h4>이용 안내</h4>
					<%--<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Contact</a></li>--%>
					<%--</ul>--%>
				</div>
				<c:choose>
					<%--<div class="container">
						<textarea id="editor" name="content">${content}</textarea>
					</div>--%>
					<div id="container">
						<div id="summernote">${content}</div>
					</div>
				</c:choose>
			</div>
		</div>

	</div>

	<!-- Newsletter -->



	<jsp:include page="../layout/footer.jsp" />
	</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/js/contact_custom.js"></script>
	<%--<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>--%>
	<script>
		$(document).ready(function() {
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
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>