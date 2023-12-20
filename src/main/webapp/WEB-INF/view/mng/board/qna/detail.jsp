<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">1:1 문의 상세</h4>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card card-body">
                    <form class="form-horizontal mt-4" action="/mng/board/${board.id}/qna-answer" method="post">
                        <div class="form-group">
                            <label for="title">질문 작성자</label>
                            <div class="form-floating">
                                <input type="text" class="form-control" maxlength="250" id="user" disabled value="${board.email}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title">질문 제목</label>
                            <div class="form-floating">
                                <input type="text" class="form-control" maxlength="250" id="title" disabled value="${board.title}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title">질문 내용</label>
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="질문 내용을 입력하세요" maxlength="250" id="content" style="height: 100px" disabled>${board.content}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="replyContent">답변 내용</label>
                            <c:choose>
                                <c:when test="${board.replyId == null}">
                                    <%-- 답변을 안했으면 --%>
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="답변 내용을 입력하세요" maxlength="250" id="replyContent" name="replyContent" style="height: 100px">${board.replyContent}</textarea>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="답변 내용을 입력하세요" maxlength="250" style="height: 100px" disabled>${board.replyContent}</textarea>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <a href="/mng/board/qna"><button class="btn btn-secondary" type="button">목록으로</button></a>

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


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>