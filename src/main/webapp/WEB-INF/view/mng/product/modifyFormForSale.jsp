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
                <h4 class="page-title">판매 물품 수정</h4>
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
                    <form class="form-horizontal mt-4" action="/mng/product/${product.id}/modifyForSale" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label>물품명</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="물품명을 입력하세요" value="${product.name}" required>
                        </div>
                        <div class="form-group">
                            <label>물품가격</label>
                            <input type="text" class="form-control" id="price" name="price" placeholder="물품 가격을 입력하세요" value="${product.price}" required>
                        </div>
                        <div class="form-group">
                            <label>카테고리</label>
                            <div style="display: flex;">
                                <span style="margin-right: 10px;">
                                    <select class="form-select" aria-label="Disabled select example" id="firstCategory" name="firstCategoryId" onchange="fCategoryChange()" required>
                                        <option value="0">1차 카테고리</option>
                                        <c:forEach var="fCategory" items="${fCategory}">
                                            <option value="${fCategory.id}" ${fCategory.id == product.firstCategoryId ? 'selected' : ''}>${fCategory.firstCategoryName}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <span style="margin-right: 10px;">
                                    <select class="form-select" aria-label="Disabled select example" id="secondCategorySelect" name="secondCategoryId">
                                        <option value="0">2차 카테고리</option>
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
                        <%--<button class="btn btn-secondary" onclick="history.back()">뒤로가기</button>--%>
                        <a href="/mng/product/list?code=2&keyword="><button class="btn btn-secondary" type="button">목록으로</button></a>
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

<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>