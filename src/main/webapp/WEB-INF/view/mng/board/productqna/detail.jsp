<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-wrapper">

    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row"> 
            <div class="col-5 align-self-center">
                <h4 class="page-title">Basic Table</h4>
            </div>
            <div class="col-7 align-self-center">
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
                    <h4 class="card-title">공지사항 수정</h4>
                    <%--<h5 class="card-subtitle"> All bootstrap element classies </h5>--%>
                    <form class="form-horizontal mt-4">
                        <div class="form-group">
                            <%--<label>Default Text <span class="help"> 제목</span></label>--%>
								 <span class="help"> 제목</span>
                            <input type="text" class="form-control" name="title" value="타이틀">
                        </div>
                        <div id="container">
                            <textarea id="summernote" name="content">내용</textarea>
                        </div>
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


	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card card-body">
					<form class="form-horizontal mt-4"
						action="/mng/board/${board.id}/productqna-answer" method="post">
						<div class="form-group">
							<label for="title">제품문의 작성자</label>
							<div class="form-floating">
								<input type="text" class="form-control" maxlength="250"
									id="user" disabled value="${board.email}" />
							</div>
						</div>
						<div class="form-group">
							<label for="title">제품문의 제목</label>
							<div class="form-floating">
								<input type="text" class="form-control" maxlength="250"
									id="title" disabled value="${board.title}" />
							</div>
						</div>
						<div class="form-group">
							<label for="title">제품문의 내용</label>
							<div class="form-floating">
								<textarea class="form-control" placeholder="제품에 대한 문의 사항을 입력하세요"
									maxlength="250" id="content" style="height: 100px" disabled>${board.content}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="replyContent">답변 내용</label>
							<c:choose>
								<c:when test="${board.replyId == null}">
									<%-- 답변을 안했으면 --%>
									<div class="form-floating">
										<textarea class="form-control" placeholder="답변 내용을 입력하세요"
											maxlength="250" id="replyContent" name="replyContent"
											style="height: 100px">${board.replyContent}</textarea>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-floating">
										<textarea class="form-control" placeholder="답변 내용을 입력하세요"
											maxlength="250" style="height: 100px" disabled>${board.replyContent}</textarea>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<a href="/mng/board/productqna-list"><button class="btn btn-secondary"
								type="button">목록으로</button></a>

						<c:choose>
							<c:when test="${board.replyId == null}">
								<button type="submit" class="btn btn-primary">등록하기</button>
							</c:when>
						</c:choose>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>

</div>


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp"%>