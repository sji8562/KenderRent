<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 써머노트 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
      integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
        integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
        integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
<!-- language pack -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
        integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/style.css">
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">물품 수정</h4>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card card-body">
<%--                    <h4 class="card-title">물품 번호 ${product.id}번</h4>--%>
                    <%--<h5 class="card-subtitle"> All bootstrap element classies </h5>--%>
                    <form class="form-horizontal mt-4" action="/mng/product/${product.id}/modify" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>물품명</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="물품명을 입력하세요" value="${product.name}" required>
                        </div>
                        <div class="form-group">
                            <label>물품가격</label>
                            <input type="text" class="form-control" id="price" name="price" placeholder="물품 가격을 입력하세요" value="${product.price}" required>
                        </div>
                        <div class="form-group">
                            <label for="example-email">카테고리</label>
                            <div style="display: flex;">
                                <span style="margin-right: 10px;">
                                    <select class="form-select" aria-label="Disabled select example" name="secondCategoryId">
                                        <c:forEach var="sCategory" items="${sCategory}">
                                            <option value="${sCategory.id}" ${sCategory.id == product.secondCategoryId ? 'selected' : ''}>${sCategory.secondCategoryName}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <%--<span>
                                    <select class="form-select" aria-label="Disabled select example">
                                        <option selected>${product.secondCategoryName}</option>
                                    </select>
                                </span>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>썸네일</label>
                            <div style="width: 500px;">
                                <%--<img id="picUrl"  src="<c:url value="${product.formatImgUrl()}"/>">--%>
                                <input type="file" id="file" name="file" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label>물품등급</label>
                            <select class="form-select" aria-label="Disabled select example" name="grade">
                                <option value="최상" ${product.grade == "최상" ? 'selected' : ''}>최상</option>
                                <option value="상" ${product.grade == "상" ? 'selected' : ''}>상</option>
                                <option value="중" ${product.grade == "중" ? 'selected' : ''}>중</option>
                                <option value="하" ${product.grade == "하" ? 'selected' : ''}">하</option>
                                <option value="최하" ${product.grade == "최하" ? 'selected' : ''}">최하</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>대여/판매여부</label>
                            <select class="form-select" aria-label="Disabled select example" id="status" name="status">
                                <option value="1" ${product.status == 1 ? 'selected' : ''}>재고 있음</option>
                                <option value="2" ${product.status == 2 ? 'selected' : ''}>대여 중</option>
                                <option value="3" ${product.status == 3 ? 'selected' : ''}>소독 중</option>
                                <option value="4" ${product.status == 4 ? 'selected' : ''}>판매 완료</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>제품 상세 설명</label>
                            <div id="container">
                                <%--<textarea id="editor" name="content">${product.content}</textarea>--%>
                                <textarea id="summernote" name="content">${product.content}</textarea>
                            </div>
                        </div>
                        <button class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
                        <button type="submit" class="btn btn-primary">수정하기</button>
                    </form>
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
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->

</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
</div>
<script>
    // ClassicEditor
    //     .create( document.querySelector( '#editor' ) )
    //     .catch( error => {
    //         console.error( error );
    //     } );
    $('#summernote').summernote({
        placeholder: 'Summernote for Bootstrap 5',
        tabsize: 2,
        height: 400,
        lang: 'ko-KR', // default: 'en-US'
    });
</script>
<style>
    /*#container {*/
    /*    width: 100%;*/
    /*}*/
    /*.ck-editor__editable[role="textbox"] {*/
    /*    !* editing area *!*/
    /*    min-height: 500px;*/
    /*}*/
</style>

</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>