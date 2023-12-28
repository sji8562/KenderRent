<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 써머노트 --%>


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
                <h4 class="page-title">공지사항</h4>
            </div>
            <%--<div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Basic Table</li>
                        </ol>
                    </nav>
                </div>
            </div>--%>
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
                <div class="card card-body">
                    <h4 class="card-title">공지사항 수정</h4>

                        <c:choose>
                            <c:when test="${notice != null}">
                    <form class="form-horizontal mt-4" method="post" action="/mng/board/notice-update-proc">
                        <input type="hidden" id="id" name="id" value="${notice.id}">
                                <div class="form-group">
                                    <label><span class="help"> 제목</span></label>
                                    <input type="text" class="form-control" name="title" value="${notice.title}">
                                </div>
                                <div id="container">
                                    <textarea id="content" name="content" style="width: 100%; min-height: 300px;">${notice.content}</textarea>
                                </div>

                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <button class="btn btn-secondary" onclick="location.href='/mng/board/${notice.id}/notice-delete'" type="button">삭제하기</button>
                    </form>
                            </c:when>
                            <c:otherwise>
                                잘못 찾아오셨네요
                            </c:otherwise>
                        </c:choose>


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

<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>