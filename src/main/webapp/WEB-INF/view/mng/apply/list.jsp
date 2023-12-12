<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-5 align-self-center">
				<h4 class="page-title">전체 신청 관리</h4>
			</div>
			<div class="col-7 align-self-center">
				<div class="d-flex align-items-center justify-content-end">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Basic
								Table</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
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
				<div class="container-fluid">
					<div class="row">
						<!-- First Card -->
						<div class="col-4">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">대여 신청 조회</h4>
								</div>
								<div class="table-responsive">
									<table class="table">
										<thead class="table-light">
										<tr>
											<th scope="col">#</th>
											<th scope="col">이름</th>
											<th scope="col">제품 이름</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${rentList != null }">

											<c:forEach var="rentList" items="${rentList}">
												<tr>
													<th class="applyDetail" scope="row"><a href="/mng/apply/${rentList.id}/rental-detail">${rentList.id}</a></th>
													<td class="applyDetail"><a href="/mng/apply/${rentList.id}/rental-detail">${rentList.username}</a></td>
													<td class="applyDetail"><a href="/mng/apply/${rentList.id}/rental-detail">${rentList.productName}</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<p>아직 생성된 계정이 없습니다.
											</c:otherwise>
											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>

						<!-- Second Card -->
						<div class="col-4">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">판매 신청 조회</h4>
								</div>
								<div class="table-responsive">
									<table class="table">
										<thead class="table-light">
										<tr>
											<th scope="col">#</th>
											<th scope="col">이름</th>
											<th scope="col">제품 이름</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${saleList != null }">

											<c:forEach var="saleList" items="${saleList}">
												<tr>
													<th class="applyDetail" scope="row"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.id}</a></th>
													<td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.username}</a></td>
													<td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.productName}</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<p>아직 생성된 계정이 없습니다.
											</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- Third Card -->
						<div class="col-4">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">구매 신청 조회</h4>
								</div>
								<div class="table-responsive">
									<table class="table">
										<thead class="table-light">
										<tr>
											<th scope="col">#</th>
											<th scope="col">이름</th>
											<th scope="col">제품 이름</th>
										</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${purchaseList != null }">

											<c:forEach var="purchaseList" items="${purchaseList}">
												<tr>
													<th class="applyDetail" scope="row"><a
															href="/mng/apply/${purchaseList.id}/purchase-detail">${purchaseList.id}</a>
													</th>
													<td class="applyDetail"><a
															href="/mng/apply/${purchaseList.id}/purchase-detail">${purchaseList.username}</a>
													</td>

													<td class="applyDetail"><a
															href="/mng/apply/${purchaseList.id}/purchase-detail">${purchaseList.productName}</a>

												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<p>아직 생성된 계정이 없습니다.
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
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp"%>