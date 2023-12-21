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
                <h4 class="page-title">자주 묻는 질문 등록</h4>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card card-body">
                    <form class="form-horizontal mt-4" action="/mng/board/faq-submit" method="post">
                        <div class="form-group">
                            <label for="title">질문 내용</label>
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="질문 내용을 입력하세요" id="title" name="title" maxlength="250" style="height: 100px"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content">답변 내용</label>
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="답변 내용을 입력하세요" id="content" name="content" maxlength="250" style="height: 100px"></textarea>
                            </div>
                        </div>
                        <button class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
                        <button type="submit" class="btn btn-primary">등록하기</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

</div>

<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>