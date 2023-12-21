<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

	.rate {
		display: inline-block;
		border: 0;
		margin-right: 15px;
	}

	.rate > input {
		display: none;
	}

	.rate > label {
		float: right;
		color: #ddd;
	}

	.rate > label:before {
		display: inline-block;
		font-size: 1rem;
		padding: .3rem .2rem;
		margin: 0;
		font-family: FontAwesome;
		content: "\f005 ";
	}

	.rate .half:before {
		content: "\f089 ";
		position: absolute;
		padding-right: 0;
	}

	/* Styling for selected stars without hover effect */
	.rate input:checked ~ label {
		color: #f73c32 !important;
	}

	.rate input:checked + .rate label,
	.rate input input:checked ~ label,
	.rate input:checked ~ .rate label ~ label,
	.rate label ~ input:checked ~ label {
		color: #f73c32 !important;
	}
</style>

<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-5 align-self-center">
				<h4 class="page-title">리뷰 상세</h4>
			</div>
		</div>
	</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-body">
						<h4 class="card-title">리뷰 번호 ${review.id}번</h4>
							<div class="form-group">
								<label>물품명</label>
								<input type="text" class="form-control" value="${review.name}" disabled>
							</div>
							<div class="form-group">
								<label>물품가격</label>
								<input type="text" class="form-control" value="${review.price}" disabled>
							</div>
							<div class="form-group">
								<label>카테고리</label>
								<div style="display: flex;">
									<span style="margin-right: 10px;">
										<select class="form-select" aria-label="Disabled select example" disabled>
											<option selected>${review.firstCategoryName}</option>
										</select>
									</span>
									<span>
										<select class="form-select" aria-label="Disabled select example" disabled>
											<option selected>${review.secondCategoryName}</option>
										</select>
									</span>
								</div>
							</div>
							<div class="form-group">
								<label>작성자</label>
								<input type="text" class="form-control" value="${review.email}" disabled>
							</div>
							<div class="form-group">
								<label>작성일</label>
								<input type="text" class="form-control" value="${review.formatCreatedAtToString()}" disabled>
							</div>
							<div class="form-group">
								<label>평점</label>
								<div>
									<fieldset class="rate" name="rate" disabled>
										<input type="radio" id="rating5" name="rating" value="5"><label for="rating5" title="5점"></label>
										<input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="4점"></label>
										<input type="radio" id="rating3" name="rating" value="3"><label for="rating3" title="3점"></label>
										<input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="2점"></label>
										<input type="radio" id="rating1" name="rating" value="1"><label for="rating1" title="1점"></label>
									</fieldset>
									<script>
										// JavaScript 코드
										document.addEventListener('DOMContentLoaded', function () {
											var desiredRating = ${review.rate}; // Change to the desired rating value
											var radioInput = document.querySelector('.rate input[value="' + desiredRating + '"]');

											if (radioInput) {
												radioInput.checked = true;
											}
										});
									</script>
								</div>
								<%--<input type="text" class="form-control" value="${review.rate}" disabled />--%>
							</div>
							<div class="form-group">
								<label>제품 후기</label>
								<textarea class="form-control" rows="5" disabled>${review.content}</textarea>
							</div>

					</div>
					<button class="btn btn-primary" onclick="history.back()">뒤로가기</button>
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


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>