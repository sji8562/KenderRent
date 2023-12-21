<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>


<style>

</style>

<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">판매용 카테고리 관리</h4>
            </div>
        </div>
    </div>
    <div class="container-fluid">
    <!-- ============================================================== -->
    <!-- Start Page Content -->
    <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card card-body" style="height: 600px; display: flex; flex-direction: row;">
                    <div class="m--category-section">

                        <select class="form-select" size="3" aria-label="Size 3 select example" style="height: 300px;" onchange="fCategoryChange()" id="firstCategory" name="firstCategory">

                            <option disabled>1차 카테고리</option>
                            <c:forEach var="fCategory" items="${firstCategoryList}">
                                <option value="${fCategory.id}">${fCategory.firstCategoryName}</option>
                            </c:forEach>
                        </select>
                        <div>
                            <input type="text" hidden id="code" name="code" value="2">
                            <input type="text" class="m--category-input" id="addFirstCategory" name="firstCategory">
                            <button onclick="addFirstCategory()" class="btn btn-primary">추가</button>
                            <button class="btn btn-danger" onclick="delFirstCategory()">삭제</button>
                        </div>
                    </div>
                    <div class="m--category-section">
                        <select class="form-select" size="3" aria-label="Size 3 select example" style="height: 300px;" id="secondCategorySelect">
                            <option disabled>2차 카테고리</option>
                        </select>
                        <div>

                            <input type="text" class="m--category-input" id="addSecondCategory" name="secondCategory">

                            <button class="btn btn-primary" onclick="addSecondCategory()">추가</button>
                            <button class="btn btn-danger" onclick="delSecondCategory()">삭제</button>
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

<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>