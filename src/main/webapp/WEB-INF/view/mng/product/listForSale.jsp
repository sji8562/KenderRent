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
                        <h4 class="page-title">물품 관리</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item active" aria-current="page">
                                    	<a href="/mng/product/registerForSale" style="text-decoration: none"><button class="btn btn-primary">상품 등록</button></a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="col-12">
							<div class="card">
								<form class="row g-3" action="/mng/product/listForSale" method="get">
									<div class="card-body m--search-inline">
										<h4 class="card-title">판매용 물품 관리</h4>
											<div class="m--search-inline">
												<input type="text" id="code" name="code" value="2" hidden />
												<div class="col-auto">
													<input type="text" class="form-control" id="keyword" name="keyword" placeholder="상품명을 입력해주세요" value="${keyword}">
												</div>
												<div class="col-auto">
													<button type="submit" class="btn btn-primary mb-3">검색</button>
												</div>
											</div>
									</div>
									<div class="table-responsive">
										<c:choose>
											<c:when test="${ productList == null }">
												<p>등록된 물품이 없습니다</p>
											</c:when>
											<c:otherwise>
												<table class="table">
													<thead class="table-light">
														<tr>
															<th scope="col">고유번호</th>
															<th scope="col">카테고리</th>
															<th scope="col">물품명</th>
															<th scope="col">물품 등급</th>
															<th scope="col">상태</th>
															<th scope="col">기능</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="product" items="${ productList }">
															<tr>
																<td scope="row">${product.id}</td>
																<td>${product.firstCategoryName} > ${product.secondCategoryName}</td>
																<td><a href="/mng/product/${product.id}/detailForSale" style="text-decoration: none; color: black;">${product.name}</a></td>
																<td>${product.grade}</td>
																<td>${product.formatStatusToString()}</td>
																<td>
																	<a href="/mng/product/modifyForSale/${product.id}"><button class="btn btn-success" type="button">수정</button></a>
																	<a onclick="confirmOpen('del', ${product.id})"><button class="btn btn-danger" type="button">삭제</button></a>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</c:otherwise>
										</c:choose>
									</div>
									<%-- 페이징 --%>
									<div style="display: block; text-align: center;">
										<c:if test="${paging.startPage != 1 }">
											<a href="/mng/product/listForSale?code=2&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&lt;</a>
										</c:if>
										<c:forEach begin="${paging.startPage }"
												   end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>${p }</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a href="/mng/product/listForSale?code=2&nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">${p }</a>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.endPage != paging.lastPage}">
											<a href="/mng/product/listForSale?code=2&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&gt;</a>
										</c:if>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>