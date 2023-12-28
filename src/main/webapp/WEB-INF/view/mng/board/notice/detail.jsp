<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 써머노트 --%>
<style>
    /* CKEditor 테두리 없애기 */
    .ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
        border: none;
        border-radius: 0; /* 선택적으로 border-radius를 0으로 설정할 수 있습니다. */
    }
</style>
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
                <h4 class="page-title">공지사항 상세조회</h4>
            </div>
            <div class="col-7 align-self-center">
                <%--<div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Basic Table</li>
                        </ol>
                    </nav>
                </div>--%>
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
                <div class="card card-body">
                    <c:choose>
                        <c:when test="${notice != null}">
                        <h4 class="card-title">${notice.title}</h4>
                        <%--<h4 class="card-title">${notice.content}</h4>--%>
                        <div class="container" style="white-space: pre-wrap;">
                            <%--<textarea id="editor" name="content">${notice.content}</textarea>--%>
                                <div>${notice.content}</div>
                        </div>


                </div>
                <div>
                    <button type="button" class="btn btn-success" onclick="location.href='/mng/board/${notice.id}/notice-update'">수정</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='/mng/board/${notice.id}/notice-delete'">삭제</button>
                </div>
                        </c:when>
                <c:otherwise>
                    등록된 내용이 없습니다.
                </c:otherwise>
                    </c:choose>

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

<%--
<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#editor'))
        .then(editor => {
            console.log("------------------------------", editor);
            const toolbarElement = editor.ui.view.toolbar.element;
            toolbarElement.style.display = 'none';
            editor.enableReadOnlyMode( 'editor' );
            console.log('Editor was initialized', editor);
        })
        .catch(error => {
            console.error(error);
        });
</script>--%>
<script>
    $('#summernote').summernote('disable');
    $('.note-toolbar').hide();
</script>