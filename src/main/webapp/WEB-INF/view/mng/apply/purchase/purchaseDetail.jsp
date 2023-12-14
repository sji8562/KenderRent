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
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Profile</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Profile</li>
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
        <!-- Row -->
        <div class="row">
            <!-- Column -->
            <c:choose>
                <c:when test="${dto != null }">
                    <div class="col-lg-4 col-xlg-3">
                        <div class="card">


                            <div class="card-body">
                                <center class="mt-4"><img src="${dto.productPicUrl}"
                                                          width="150"/>
                                    <h4 class="card-title mt-2">${dto.productId}번 상품</h4>
                                    <h6 class="card-subtitle">${dto.productName}</h6>
                                </center>
                            </div>
                            <div class="card-body">
                                <small class="text-muted pt-4 db">가격</small>
                                <h6>${dto.productPrice}</h6>
                            </div>
                            <div class="card-body">
                                <small class="text-muted pt-4 db">신청 주소</small>
                                <h6>${dto.address} ${dto.addressDetail} ${dto.postNumber}</h6>
                                <div id="mngKakaoMap" style="width:100%;height:300px;"></div>

                                <small class="text-muted pt-4 db">Social Profile</small>
                                <br/>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal form-material mx-2" method="post"
                                      action="/mng/apply/purchase-update">

                                    <div class="form-group">
                                        <label class="col-md-12">신청자 이름</label>
                                        <div class="col-md-12">
                                            <input type="hidden" name="id" id="id" value="${dto.id}">
                                            <input type="text"
                                                   class="form-control form-control-line" id="username" name="username"
                                                   value="${dto.username}" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input type="email"
                                                   class="form-control form-control-line" name="email"
                                                   id="email" value="${dto.email}" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">전화번호</label>
                                        <div class="col-md-12">
                                            <input type="text"
                                                   class="form-control form-control-line" name="phoneNumber"
                                                   id="phoneNumber" value="${dto.phoneNumber}" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">상태</label>
                                        <div class="col-sm-12">
                                            <select class="form-select shadow-none form-control-line status" id="status"
                                                    name="status">
                                                <option value="1" ${dto.status == "1" ? 'selected' : ''}>재고있음</option>
                                                <option value="2" ${dto.status == "2" ? 'selected' : ''}>대여중</option>
                                                <option value="3" ${dto.status == "3" ? 'selected' : ''}>소독중</option>
                                                <option value="4" ${dto.status == "4" ? 'selected' : ''}>판매완료</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">주소</label>
                                        <div class="col-sm-12">
                                            <input type="text" id="postNumber" name="postNumber" placeholder="우편번호"
                                                   value=${dto.postNumber} readonly>
                                            <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                                            <input type="text" id="address" name="address" placeholder="주소"
                                                   value=${dto.address} readonly><br>
                                            <input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소"
                                                   value=${dto.addressDetail}>
                                            <input type="hidden" id="extraAddress" name="extraAddress">

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-success text-white">신청 상태 변경</button>
                                            <button type="button" class="btn-danger btn" onclick="location.href='/mng/apply/${dto.id}/purchase-delete'">신청 삭제</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </c:when>
                <c:otherwise>
                    잘못된 신청입니다.
                </c:otherwise>
            </c:choose>
        </div>
        <!-- Row -->
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
    <!-- footer -->
    <!-- ============================================================== -->


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>