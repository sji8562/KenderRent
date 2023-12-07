<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    <form class="form-horizontal mt-4">
                        <div class="form-group">
                            <label>물품명</label>
                            <input type="text" class="form-control" id="name" name="name" value="${product.name}" >
                        </div>
                        <div class="form-group">
                            <label>물품가격</label>
                            <input type="text" class="form-control" id="price" name="price" value="${product.price}">
                        </div>
                        <div class="form-group">
                            <label for="example-email">카테고리</label>
                            <div style="display: flex;">
									<span style="margin-right: 10px;">

										<select class="form-select" aria-label="Disabled select example">

                                            <%--<c:forEach var="item" items="category">--%>
                                                <option value="1">${product.firstCategoryName}</option>
                                            <%--</c:forEach>--%>
										</select>
									</span>
                                <span>
										<select class="form-select" aria-label="Disabled select example">
											<option selected>${product.secondCategoryName}</option>
										</select>
									</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>썸네일</label>
                            <div style="width: 500px;">
                                <%--									<c:choose>--%>
                                <%--										<c:when test="${product.picUrl != null}">--%>
                                <%--											<img src="${product.picUrl}" alt="No Image">--%>
                                <%--										</c:when>--%>
                                <%--										<c:otherwise>--%>
                                <%--											<img src="/assets/images/empty_img.jpg" alt="No Alter Image">--%>
                                <%--										</c:otherwise>--%>
                                <%--									</c:choose>--%>
                                <img src="${product.formatImgUrl()}" />

                            </div>
                        </div>
                        <div class="form-group">
                            <label>물품등급</label>
                            <select class="form-select" aria-label="Disabled select example" name="grade">
                                <option value="최상">최상</option>
                                <option value="상">상</option>
                                <option value="중">중</option>
                                <option value="최하">최하</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>대여/판매여부</label>
                            <select class="form-select" aria-label="Disabled select example" id="status" name="status">
                                <option value="1">재고 있음</option>
                                <option value="2">대여 중</option>
                                <option value="3">소독 중</option>
                                <option value="4">판매 완료</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>제품 상세 설명</label>
                            <%-- TODO text editor --%>
                            <textarea class="form-control" rows="5">${product.content}</textarea>
                        </div>
                    </form>
                </div>
                <button onclick="history.back()">뒤로가기</button>
                <button onclick="#">수정하기</button>
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
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../../assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="../../assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="../../dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../../dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../../dist/js/custom.min.js"></script>

</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>