<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					${review}
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
<%--							<div class="form-group">--%>
<%--								<label>썸네일</label>--%>
<%--								<div style="width: 500px;">--%>
<%--									<script>--%>
<%--										console.log("${review.formatImgUrl()}");--%>
<%--									</script>--%>
<%--						&lt;%&ndash;			<img src="<c:url value="${review.imgPic()}"/>" >&ndash;%&gt;--%>
<%--									<img src="${product.formatImgUrl()}" >--%>

<%--								</div>--%>
<%--							</div>--%>
							<div class="form-group">
								<label>평점</label>
								<input type="text" class="form-control" value="${review.rate}" disabled />
							</div>
							<%--<div class="form-group">
								<label>대여/판매여부</label>
								<select class="form-select" aria-label="Disabled select example" disabled>
									<option value="${product.status}" selected>${product.formatStatusToString()}</option>
								</select>
							</div>--%>
							<div class="form-group">
								<label>제품 후기</label>
								<textarea class="form-control" rows="5" disabled>${review.content}</textarea>
							</div>

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


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>