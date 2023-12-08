<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="col-sm-8">
	<h2>로그인</h2>
	<h5>현명한 육아 준비는 Kindlend와 함께</h5>
	<div>
		<form action="/user/sign-in" method="post">
			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" placeholder="전체 주소를 입력해주세요" id="email"
					name="email" value="test@test.com">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" placeholder="비밀번호를 입력하세요." id="pwd"
					name="password" value="123456">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
			<!-- 로그인 부가기능 및 회원가입 페이지 링크 연결 -->
			<div class="">
				<div class="">
					<div class="">
						<a href="/findEmail?url=" onclick="" id="">이메일 찾기</a>
					</div>
					<div class="">
						<a href="/findPassword?url=" onclick="" id="">비밀번호 찾기</a>
					</div>
					<div class="">
						<a href="/signUp?url=" onclick="" id="">회원 가입</a>
					</div>
				</div>
			</div>

			<!-- 소셜 로그인 -->
			<a
				href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9c1f13e7e8b25dc2a7a6985ffce3cabb&redirect_uri=http://localhost:80/user/kakao-callback">
				<img alt="" src="/images/kakao_login_small.png" width="75"
				height="40">
			</a>
		</form>

	</div>

</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>