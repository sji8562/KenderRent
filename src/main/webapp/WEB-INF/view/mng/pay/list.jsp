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
                <h4 class="page-title">결제 관리</h4>
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
                                    <h4 class="card-title">결제 내역 조회</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="table-light">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">아이디</th>
                                            <th scope="col">제품번호</th>
                                            <th scope="col">제품이름</th>
                                            <th scope="col">금액</th>
                                            <th scope="col">날짜</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>3</th>
                                                <td>spring@gmail.com</td>
                                                <td>1</td>
                                                <td>보행기</td>
                                                <td>36,000</td>
                                                <td>2023.12.21 20:48</td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td>happy@gmail.com</td>
                                                <td>4</td>
                                                <td>유축기</td>
                                                <td>20,000</td>
                                                <td>2023.12.19 07:15</td>
                                            </tr>
                                            <tr>
                                                <th>1</th>
                                                <td>winter@gmail.com</td>
                                                <td>13</td>
                                                <td>젖병 소독기</td>
                                                <td>30,000</td>
                                                <td>2023.12.19 06:00</td>
                                            </tr>
                                       <%-- <c:choose>
                                        <c:when test="${saleList != null }">

                                            <c:forEach var="saleList" items="${saleList}">--%>
                                                <%--<tr>
                                                    <th class="applyDetail" scope="row"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.id}</a></th>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.username}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.productId}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.productName}</a></td>
                                                    <td class="applyDetail"><a href="/mng/apply/${saleList.id}/sale-detail">${saleList.createdAt}</a></td>
                                                    <c:choose>
                                                        <c:when test="${saleList.status == 1}">
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
                                                        <c:when test="${saleList.status == 2}">
                                                            <td>
                                                                <div>
                                                                    거래진행중
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 3}">
                                                            <td>
                                                                <div>
                                                                    세척중
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                        <c:when test="${saleList.status == 4}">
                                                            <td>
                                                                <div>
                                                                    홈페이지 등록
                                                                </div>
                                                            </td>
                                                        </c:when>
                                                    </c:choose>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                        <p>아직 생성된 계정이 없습니다.
                                            </c:otherwise>
                                            </c:choose>--%>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="display: block; text-align: center;">
                                    <c:if test="${paging.startPage != 1 }">
                                        <a
                                                href="../user?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                                    </c:if>
                                    <c:forEach begin="${paging.startPage }"
                                               end="${paging.endPage }" var="p">
                                        <c:choose>
                                            <c:when test="${p == paging.nowPage }">
                                                <b>${p }</b>
                                            </c:when>
                                            <c:when test="${p != paging.nowPage }">
                                                <a href="../user?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${paging.endPage != paging.lastPage}">
                                        <a
                                                href="../user?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
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