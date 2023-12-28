<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Kinder Lend</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/styles/bootstrap4/bootstrap.min.css">
	<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/css/styles/contact_responsive.css">
	<link rel="stylesheet" type="text/css" href="/css/styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="/css/styles/responsive.css">
	<style>
		.signup{
			display: flex;
			flex-wrap: wrap;
			margin-right: -15px;
			margin-left: -15px;
			--bs-gutter-x: 0;
			--bs-gutter-y: 0;
			margin-top: 0;
		}
	</style>
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