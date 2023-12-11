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
                    <h4 class="page-title">회사정보</h4>
                </div>
            </div>
        </div>

        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <%-- 여기에 코드 작성 --%>
                            <div class="card-groups" style="display: flex; justify-content: flex-start;">
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">회사 소개</h5>
                                        <a href="/mng/content/register" class="btn btn-primary">수정</a>
                                    </div>
                                </div>
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">이용 수칙</h5>
                                        <a href="/mng/content/rules-of-use" class="btn btn-primary">수정</a>
                                    </div>
                                </div>

                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">소독 과정</h5>
                                        <a href="/mng/content/disinfection-process" class="btn btn-primary">수정</a>
                                    </div>
                                </div>

                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">오시는 길</h5>
                                        <a href="#" class="btn btn-primary">수정</a>
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
    </div>
</body>

</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>