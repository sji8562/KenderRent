<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper -->
<!-- ============================================================== -->
<style>
    /*.ellipsis {*/
    /*    overflow: hidden;*/
    /*    text-overflow: ellipsis;*/
    /*    display: -webkit-box;*/
    /*    -webkit-line-clamp: 1;*/
    /*    -webkit-box-orient: vertical;*/
    /*}*/
</style>

<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">1:1 문의</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">

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
                                <form class="row g-3" action="/mng/board/qna" method="get">
                                    <div class="card-body m--search-inline">
                                        <h4 class="card-title">1:1 문의 조회</h4>
                                            <div class="m--search-inline">
                                                <div class="col-auto">
                                                    <input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="제목을 입력해주세요">
                                                </div>
                                                <div class="col-auto">
                                                    <button type="submit" class="btn btn-primary mb-3">검색</button>
                                                </div>
                                            </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${boardList != null }">
                                            <div class="table-responsive">
                                                <table class="table" style="width: 100%;">
                                                    <thead class="table-light">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">제목</th>
                                                            <%--<th scope="col">내용</th>--%>
                                                        <th scope="col">작성자</th>
                                                        <th scope="col">문의일시</th>
                                                        <th scope="col">답변여부</th>
                                                        <th scope="col">답변일시</th>
                                                        <th scope="col">관리</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="boardList" items="${boardList}">
                                                        <tr>
                                                            <th class="applyDetail" scope="row">
                                                                <a href="/mng/board/${boardList.id}/notice-detail">${boardList.id}</a>
                                                            </th>
                                                                <%--<td class="ellipsis" style="width: 60%; white-space: nowrap; overflow:hidden; text-overflow:ellipsis;">${noticeList.title}</td>--%>
                                                            <td class="ellipsis">${boardList.title}</td>
                                                                <%--<td>${noticeList.content}</td>--%>
                                                            <td>${boardList.email}</td>
                                                            <td>${boardList.formatCreatedAtToString()}</td>
                                                            <%-- 답변 여부 --%>
                                                            <c:choose>
                                                                <c:when test="${boardList.reply == 1}">
                                                                    <td style="color: green">답변완료</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td style="color: red">미답변</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td>${boardList.formatReplyCreatedAtToString()}</td>
                                                            <td>
                                                                <div>
                                                                    <button class="btn btn-success"
                                                                            type="button"
                                                                            style="border: 1px solid black"
                                                                            onclick="location.href='/mng/board/${boardList.id}/qna-detail'">
                                                                        조회
                                                                    </button>
                                                                &nbsp;&nbsp;<c:choose>
                                                                    <c:when test="${boardList.reply == 0}">
                                                                        <button class="btn-danger btn"
                                                                                type="button"
                                                                                onclick="location.href='/mng/board/${boardList.id}/qna-delete'">
                                                                            삭제
                                                                        </button>
                                                                    </c:when>
                                                                </c:choose>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div style="display: block; text-align: center;">
                                                <c:if test="${paging.startPage != 1 }">
                                                    <a
                                                            href="qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&lt;</a>
                                                </c:if>
                                                <c:forEach begin="${paging.startPage }"
                                                           end="${paging.endPage }" var="p">
                                                    <c:choose>
                                                        <c:when test="${p == paging.nowPage }">
                                                            <b>${p }</b>
                                                        </c:when>
                                                        <c:when test="${p != paging.nowPage }">
                                                            <a href="qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">${p }</a>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${paging.endPage != paging.lastPage}">
                                                    <a
                                                            href="qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${keyword}">&gt;</a>
                                                </c:if>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>등록된 게시글이 없습니다</p>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
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

    </script>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>