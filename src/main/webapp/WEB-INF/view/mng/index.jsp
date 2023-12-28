<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-VmPD6ZrvqO2PVz95Rt9q7HdN3g0uevY7+MhNwFmn9CJ4idfgfOWgqmCC7z5etM0I3tLpZ+S1yZ5XyTtGldNkaQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Dashboard</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
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
        <!-- Email campaign chart -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">월별 실적</h4>
                        <div class=""></div>
                        <div class="sales ct-charts mt-3"></div>
                        <input type="hidden" id="dtos" value="${dtos}">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-1">월별 건수</h5>
                        <h3 class="font-light">총 ${payOff} 원</h3>
                        <div class="mt-3 text-center">
                            <div id="earnings"></div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-0">미해결 신청현황</h4>
                        <h2 class="font-light">${countDTO.totalCount}건</h2>
                        <div class="mt-4">
                            <div class="row text-center">
                                <div class="col-4 border-right">
                                    <h4 class="mb-0">${countDTO.rentCount}</h4>
                                    <span class="font-14 text-muted">대여 신청</span>
                                </div>
                                <div class="col-4 border-right">
                                    <h4 class="mb-0">${countDTO.saleCount}</h4>
                                    <span class="font-14 text-muted">구매 신청</span>
                                </div>
                                <div class="col-4">
                                    <h4 class="mb-0">${countDTO.purchaseCount}</h4>
                                    <span class="font-14 text-muted">판매 신청</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Email campaign chart -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Ravenue - page-view-bounce rate -->
        <!-- ============================================================== -->
        <div class="row">
            <!-- column -->
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">결제내역</h4>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="border-top-0">NAME</th>
                                <th class="border-top-0">STATUS</th>
                                <th class="border-top-0">DATE</th>
                                <th class="border-top-0">PRICE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${statusDTO != null }">
                                    <c:forEach var="statusDTO" items="${statusDTO}">
                                        <tr>
                                            <td class="txt-oflo">${statusDTO.userName}</td>
                                            <c:choose>
                                                <c:when test="${statusDTO.transactionType == 'Rent' }">
                                                    <c:choose>
                                                        <c:when test="${statusDTO.status == 2 }">
                                                            <td><span
                                                                    class="label label-success label-rounded">${statusDTO.transactionType}</span>
                                                            </td>

                                                            <td class="txt-oflo"><fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <td><span class="font-medium"><fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span
                                                                    class="label label-danger label-rounded">${statusDTO.transactionType}</span>
                                                            </td>

                                                            <td class="txt-oflo"><fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <td><span class="font-medium">-<fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${statusDTO.transactionType == 'Sale' }">
                                                    <c:choose>
                                                        <c:when test="${statusDTO.status == 2 }">
                                                            <td><span
                                                                    class="label label-info label-rounded">${statusDTO.transactionType}</span>
                                                            </td>
                                                            <td class="txt-oflo">$<fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <td><span class="font-medium"><fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span
                                                                    class="label label-danger label-rounded">${statusDTO.transactionType}</span>
                                                            </td>
                                                            <td class="txt-oflo"><fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <td><span class="font-medium">-<fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${statusDTO.transactionType == 'Purchase' }">
                                                    <c:choose>
                                                        <c:when test="${statusDTO.status == 2 }">
                                                            <td><span
                                                                    class="label label-purple label-rounded">${statusDTO.transactionType}</span>
                                                            </td>
                                                            <td class="txt-oflo"><fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" />}</td>

                                                            <td><span class="font-medium"><fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span
                                                                    class="label label-danger label-rounded">${statusDTO.transactionType}</span>
                                                            </td>
                                                            <td class="txt-oflo"><fmt:formatDate value="${statusDTO.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <td><span class="font-medium">-<fmt:formatNumber value="${statusDTO.price}" pattern="###,###"/></span>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    그런 종류는 없습니다.
                                                </c:otherwise>
                                            </c:choose>


                                        </tr>

                                    </c:forEach>

                                </c:when>
                                <c:otherwise>
                                    내역이 없습니다.
                                </c:otherwise>
                            </c:choose>

                            </tbody>
                        </table>
                        <div style="display: block; text-align: center;">
                            <c:if test="${paging.startPage != 1 }">
                                <a
                                        href="index?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&lt;</a>
                            </c:if>
                            <c:forEach begin="${paging.startPage }"
                                       end="${paging.endPage }" var="p">
                                <c:choose>
                                    <c:when test="${p == paging.nowPage }">
                                        <b>${p }</b>
                                    </c:when>
                                    <c:when test="${p != paging.nowPage }">
                                        <a href="index?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">${p }</a>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${paging.endPage != paging.lastPage}">
                                <a
                                        href="index?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&gt;</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ============================================================== -->
        <!-- Ravenue - page-view-bounce rate -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Recent comment and chats -->
        <!-- ============================================================== -->
        <div class="row">
            <!-- column -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">제품 후기</h4>
                    </div>
                    <div class="comment-widgets" style="height:430px;">
                        <!-- Comment Row -->


                            <c:choose>
                                <c:when test="${reviewList != null }">
                                    <c:forEach var="reviewList" items="${reviewList}">
                                        <div class="d-flex flex-row comment-row mt-0">

                                            <div class="comment-text w-100">
                                                <div class="d-flex justify-content-between">
                                                    <b class="font-medium">${reviewList.userName}</b>
                                                    <b class="fas fa-star">
                                                    <c:forEach var="i" begin="1" end="${reviewList.rate}">
                                                        ⭐️
                                                    </c:forEach>
                                                    </b>
                                                </div>
                                                <span class="mb-3 d-block">${reviewList.content}</span>
                                                <div class="comment-footer">
                                                    <span class="text-muted float-end">${reviewList.createdAt}</span>
                                                    <span class="text-muted">${reviewList.productName}</span>
                                                    <span class="action-icons">
                                                <a href="javascript:void(0)">
                                                    <i class="ti-pencil-alt"></i>
                                                </a>

                                            </span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    그런거 없습니다.
                                </c:otherwise>
                            </c:choose>
                    </div>
                </div>
            </div>
            <!-- column -->

        </div>
        <!-- ============================================================== -->
        <!-- Recent comment and chats -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>