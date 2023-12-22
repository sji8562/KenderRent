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
                        <h4 class="page-title">대여 후기 관리</h4>
                    </div>
<%--                    <div class="col-7 align-self-center">--%>
<%--                        <div class="d-flex align-items-center justify-content-end">--%>
<%--                            <nav aria-label="breadcrumb">--%>
<%--                                <ol class="breadcrumb">--%>
<%--                                    <li class="breadcrumb-item active" aria-current="page">--%>
<%--                                    	<a href="/mng/product/register" style="text-decoration: none"><button class="btn btn-primary">상품 등록</button></a>--%>
<%--                                    </li>--%>
<%--                                </ol>--%>
<%--                            </nav>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="col-12">
							<div class="card">
								<form class="row g-3" action="/mng/product/review" method="get">
									<div class="card-body m--search-inline">
										<h4 class="card-title">대여 상품 후기 조회</h4>
											<div class="m--search-inline">
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
											<c:when test="${ reviewList == null }">
												<p>등록된 상품 후기가 없습니다</p>
											</c:when>
											<c:otherwise>
												<table class="table">
													<thead class="table-light">
														<tr>
															<th scope="col">고유번호</th>
															<th scope="col">카테고리</th>
															<th scope="col">물품명</th>
															<th scope="col">후기내용</th>
															<th scope="col">별점</th>
															<th scope="col">작성자</th>
															<th scope="col">작성일</th>
															<th scope="col">기능</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="review" items="${ reviewList }">
															<tr>
																<td scope="row">${review.id}</td>
																<td>${review.firstCategoryName} > ${review.secondCategoryName}</td>
																<td><a href="/mng/product/review/${review.id}/detail" style="text-decoration: none; color: black;">${review.name}</a></td>
																<td>${review.content}</td>
																<td>${review.rate}</td>
																<td>${review.email}</td>
																<td>${review.formatCreatedAtToString()}</td>
																<td><a href="/mng/product/review/${review.id}/detail"><button class="btn btn-success" type="button">조회</button></a>
																	<a onclick="reviewConfirmOpen('del', ${review.id})"><button class="btn btn-danger" type="button">삭제</button></a>
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
											<a href="/mng/review/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&lt;</a>
										</c:if>
										<c:forEach begin="${paging.startPage }"
												   end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>${p }</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a href="/mng/review/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">${p }</a>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.endPage != paging.lastPage}">
											<a href="/mng/review/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}"></a>
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