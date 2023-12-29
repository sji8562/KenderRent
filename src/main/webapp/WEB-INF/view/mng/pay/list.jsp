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
                                    <c:choose>
                                        <c:when test="${payList != null}">
                                            <table class="table">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th scope="col">타입</th>
                                                        <th scope="col">유저</th>
                                                        <%--<th scope="col">제품번호</th>--%>
                                                        <%--<th scope="col">제품이름</th>--%>
                                                        <th scope="col">금액</th>
                                                        <th scope="col">날짜</th>
                                                        <th scope="col">기능</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="pay" items="${payList}">
                                                        <tr>
                                                            <th>${pay.transactionType}</th>
                                                            <td>${pay.userName}</td>
                                                            <%--<td>1</td>--%>
                                                            <%--<td>${pay.}</td>--%>

                                                            <td><fmt:formatNumber value="${pay.price}" pattern="###,###"/></td>
                                                            <%--<td>${pay.price}</td>--%>

                                                            <td><fmt:formatDate value="${pay.createdAt}" pattern="yyyy. MM. dd" /></td>
                                                            <%--<td>${pay.createdAt}</td>--%>
                                                            <td>
                                                                <div>
                                                                    <button id="cancelBtn" name="cancelBtn" class="btn-danger btn" type="button" onclick="openConfirm(event)">
                                                                        결제 취소
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:when>
                                        <c:otherwise>
                                            <p>결제 내역이 없습니다</p>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div style="display: block; text-align: center;">
                                    <c:if test="${paging.startPage != 1 }">
                                        <a
                                                href="/mng/pay/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                                    </c:if>
                                    <c:forEach begin="${paging.startPage }"
                                               end="${paging.endPage }" var="p">
                                        <c:choose>
                                            <c:when test="${p == paging.nowPage }">
                                                <b>${p }</b>
                                            </c:when>
                                            <c:when test="${p != paging.nowPage }">
                                                <a href="/mng/pay/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${paging.endPage != paging.lastPage}">
                                        <a
                                                href="/mng/pay/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
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

    <script>
        function openConfirm(event) {
            var clickButton = event.target;
            if(confirm('결제를 취소하겠습니까?')) {
                alert('취소되었습니다');

                clickButton.innerText = '환불완료';
                clickButton.style.backgroundColor = 'grey';
                clickButton.style.cursor = 'default';
            }
        }
    </script>

<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp"%>
