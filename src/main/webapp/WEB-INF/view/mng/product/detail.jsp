<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- CK editor --%>
<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
<%-- 써머노트 --%>
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	  integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	  integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
		integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
		integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>--%>


<link rel="stylesheet" href="/css/style.css">

<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-5 align-self-center">
				<h4 class="page-title">물품 상세</h4>
			</div>
		</div>
	</div>

	<%--<div class="m--margin">
		물품 상세 페이지

		<div>${product}</div>

		<div>상품번호 ${product.id}</div>
		<div>카테고리 ${product.firstCategoryName} > ${product.secondCategoryName}</div>
		<div>물품명 ${product.name}</div>
		<div>썸네일 ${product.picUrl}</div>
		<div>물품등급 ${product.grade}</div>
		<div>대여/판매여부 ${product.status}</div>
		<div>상품 상세 설명 ${product.content}</div>
	</div>--%>
		<!-- ============================================================== -->
		<!-- End Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Container fluid  -->
		<!-- ============================================================== -->
		<div class="container-fluid">
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-12">
					<div class="card card-body">
						<h4 class="card-title">물품 번호 ${product.id}번</h4>
						<%--<h5 class="card-subtitle"> All bootstrap element classies </h5>--%>
						<form class="form-horizontal mt-4">
							<div class="form-group">
								<label>물품명</label>
								<input type="text" class="form-control" value="${product.name}" disabled>
							</div>
							<div class="form-group">
								<label>물품가격</label>
								<input type="text" class="form-control" value="${product.price}" disabled>
							</div>
							<div class="form-group">
								<label for="example-email">카테고리</label>
								<div style="display: flex;">
									<span style="margin-right: 10px;">
										<select class="form-select" aria-label="Disabled select example" disabled>
											<option selected>${product.firstCategoryName}</option>
										</select>
									</span>
									<span>
										<select class="form-select" aria-label="Disabled select example" disabled>
											<option selected>${product.secondCategoryName}</option>
										</select>
									</span>
								</div>
							</div>
							<div class="form-group">
								<label>썸네일</label>
								<div style="width: 500px;">
									<script>
										console.log("${product.formatImgUrl()}");
									</script>
<%--									<img src="<c:url value="${product.formatImgUrl()}"/>" >--%>
									<img src="${product.formatImgUrl()}" >

								</div>
							</div>
							<div class="form-group">
								<label>물품등급</label>
								<select class="form-select" aria-label="Disabled select example" disabled>
									<option selected>${product.grade}</option>
								</select>
							</div>
							<div class="form-group">
								<label>대여/판매여부</label>
								<select class="form-select" aria-label="Disabled select example" disabled>
									<option value="${product.status}" selected>${product.formatStatusToString()}</option>
								</select>
							</div>
							<div class="form-group">
								<label>제품 상세 설명</label>
								<div id="container">
									<textarea id="editor" name="content">${product.content}</textarea>
										<%--<textarea id="summernote" name="content">${product.content}</textarea>--%>
								</div>
								<%--<textarea class="form-control" rows="5" disabled>${product.content}</textarea>--%>
							</div>
						</form>
					</div>
					<button onclick="history.back()">뒤로가기</button>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End PAge Content -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Right sidebar -->
			<!-- ============================================================== -->
			<!-- .right-sidebar -->
			<!-- ============================================================== -->
			<!-- End Right sidebar -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Container fluid  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<footer class="footer text-center">
			All Rights Reserved by Nice admin. Designed and Developed by
			<a href="https://www.wrappixel.com">WrapPixel</a>.
		</footer>
		<!-- ============================================================== -->
		<!-- End footer -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->
</div>
<script>
	// $('#summernote').summernote({
	// 	placeholder: '내용을 입력해주세요',
	// 	tabsize: 2,
	// 	height: 400,
	// 	lang: 'ko-KR', // default: 'en-US'
	// 	disabled: true,
	// });
	// $('#summernote').summernote('disabled');
	ClassicEditor
			.create( document.querySelector( '#editor' ))
			.then(editor => {
				console.log("------------------------------", editor);
				const toolbarElement = editor.ui.view.toolbar.element;
				toolbarElement.style.display = 'none';
				editor.enableReadOnlyMode( 'editor' );
				console.log('Editor was initialized', editor);
			})
			.catch( error => {
				console.error( error );
			} );
</script>
<style>
	#container {
		width: 100%;
	}
	.ck-editor__editable[role="textbox"] {
		/* editing area */
		min-height: 500px;
	}
</style>

</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>