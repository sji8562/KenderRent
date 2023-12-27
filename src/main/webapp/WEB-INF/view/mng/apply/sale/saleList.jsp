<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <h4 class="page-title">판매 관리</h4>
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
                <div class="card">
                    <div class="card-body">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body m--search-inline">
                                    <h4 class="card-title">판매 신청 조회</h4>
                                    <%-- TODO 검색기능 구현 --%>
                                    <%--<form class="row g-3">
                                        <div class="col-auto">
                                            <input type="text" class="form-control" id="keyword" placeholder="제품명을 입력해주세요">
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-primary mb-3">검색</button>
                                        </div>
                                    </form>--%>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="table-light">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">이름</th>
                                            <th scope="col">제품번호</th>
                                            <th scope="col">제품이름</th>
                                            <th scope="col">생성날짜</th>
                                            <th scope="col">신청관리</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                        <c:when test="${saleList != null }">

                                            <c:forEach var="saleList" items="${saleList}">
                                                <tr>
                                                    <th class="applyDetail" scope="row"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.id}</a></th>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.username}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.productId}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.productName}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail"><fmt:formatDate value="${saleList.createdAt }" pattern="yyyy. MM. dd" /></a></td>


                                                    <c:choose>
                                                        <c:when test="${saleList.status == 2}">
                                                            <td>
                                                                <div>
                                                                    <button class="btn btn-success"
                                                                            style="border: 1px solid black"
                                                                            onclick="location.href='/mng/apply/${saleList.id}/sale-update'">신청 확인</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn-danger btn"
                                                                            onclick="location.href='/mng/apply/${saleList.id}/sale-delete'">신청 취소</button>
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 3}">
                                                            <td>
                                                                <div>
                                                                    배송중
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 4}">
                                                            <td>
                                                                <div>
                                                                    배송 완료
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 5}">
                                                            <td>
                                                                <div>
                                                                    판매 완료
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 12}">
                                                            <td>
                                                                <div>
                                                                    결제 취소
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                    </c:choose>
<%----%>
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
                                <div style="display: block; text-align: center;">
                                    <c:if test="${paging.startPage != 1 }">
                                        <a
                                                href="user?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                                    </c:if>
                                    <c:forEach begin="${paging.startPage }"
                                               end="${paging.endPage }" var="p">
                                        <c:choose>
                                            <c:when test="${p == paging.nowPage }">
                                                <b>${p }</b>
                                            </c:when>
                                            <c:when test="${p != paging.nowPage }">
                                                <a href="user?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${paging.endPage != paging.lastPage}">
                                        <a
                                                href="user?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
                                    </c:if>
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