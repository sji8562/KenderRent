<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="col-sm-8">
	<h2>이메일로 가입하기</h2>
	<h5></h5>
	<div>
		<form action="/user/sign-up" method="post"
			enctype="multipart/form-data">
			<!-- 이메일 인증 기능 추가 -->
			<!-- 이메일 아이 -->
			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" placeholder="이메일을 입력해주세요." id="email"
					name="email">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" placeholder="숫자,영문 포함 최소 8자 이상" id="pwd"
					name="password">
			</div>
			<div class="form-group">
				<label for="pwdChk">비밀번호 확인</label> <input type="password"
					class="form-control" placeholder="비밀번호 한 번 더 입력" id="pwdChk"
					name="passwordCheck">
			</div>
			<div class="form-group">
				<label for="username">이름</label> <input type="text"
					class="form-control" placeholder="이름을 입력하세요." id="username"
					name="username">
			</div>
			<!-- 약관 동의 체크박스 -->
			<div class="약관맨이야"></div>


			<button type="submit" class="btn btn-primary">이메일로 회원가입</button>
		</form>

	</div>

</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>