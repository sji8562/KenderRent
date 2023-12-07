<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body class="body__signIn">
	<!-- signIn_wrap -->
	<div id="wrap" class="signIn_wrap">
		<!-- container -->
		<div id="container" class="container content__login">
			<!-- signIn_form -->
			<form class="signIn_form" action="/user/userSignIn"
				id="user-signIn-signInForm" method="post"
				data-gtm-form-interact-email="0">
				<!--  
				<input type="hidden" id="user-signIn-redirectUrl" name="redirectUrl" value="https://?src=">
				<input type="hidden" id="user-signIn-dm" name="dm" value>
				  -->
				<!-- Status 선택 탭: 로그인 상태 유지, 유저/관리자 선택 -->
				<div class="select_area">
					<span class="check_w"> <input type="checkbox"
						name="autoSignIn" id="user-signIn-autoSignIn" value="true">
						<label for="user-signIn-autoSignIn" class="ico"> 로그인 상태 유지
					</label>
					</span>
					<!-- 유저/관리자 선택 기능 필요한지? -->
					<!-- 
				<ul class="radio_list">
					<li id="user-signIn-signInType-general-check" class="check">
					<input type="radio" id="user-signIn-signInType-general" 
					name="signInUserType" value="general" 
					data-gtm-form-interact-field-id="1" checked="checked"> 
					<label for="user-signIn-signInType-general"> 
					<i class="ico i_radio"></i>
					일반회원
					</label>
					<li id="user-signIn-signInType-manager-check" class="check">
					<input type="radio" id="user-signIn-signInType-manager"
					name="signInUserType" value="manager" 
					data-gtm-form-interact-field-id="0" checked="checked"> 
					<label for="user-signIn-signInType-manager"> 
					<i class="ico i_radio"></i>
					관리자
					</label>
				</ul>
				-->
				</div>
				<div class="email_area">
					<div class="input_wrap" id="user-signIn-signInInputArea">
						<span class="input_box"> <label
							for="user-signIn-input-email" class="lb" style="display: block;">이메일</label>
							<!-- input 입력시 display:none; --> <input type="text"
							class="user-signIn-input-email" maxlength="40" name="email"
							class="int" placeholder="이메일을 입력해주세요" value style="z-index: 8;">
							<button type="button" id="user-signIn-input-email-del"
								class="btn_del">
								<span class="ico i_del"></span>
							</button> <!-- 입력시 on 클래스 추가 -->
						</span>
						<button type="button" class="btn_pwniew btn_emailsave on"
							id="user-signIn-saveEmail">"저장"</button>
						<input type="hidden" name="isSaveEmail"
							id="user-signIn-input-saveEmail" value="true">
					</div>
				</div>
				<div class="pwd_area">
					<div class="input_wrap" id="user-signIn-signInPwdInputArea">
						<span class="input_box"> <label for="user-signIn-input-pwd"
							class="lb" style="display: block;"> 비밀번호 </label> <!-- input 입력시 display:none; -->
							<input type="password" maxlength="20" id="user-signIn-input-pwd"
							name="password" class="int" placeholder="비밀번호를 입력해주세요"> <!-- 표시 버튼 체크하면 input type="text" 로 변경 -->
							<button type="button" id="user-signIn-input-pwd-del"
								class="btn_del">
								<span class="ico i_del"></span>
							</button> <!-- 입력시 on 클래스 추가 -->
						</span>
					</div>
				</div>
				<button class="btn_signIn" id="user-signIn-signInButton"
					onclick="return false;">로그인</button>
				<!-- 아이디 찾기, 비밀번호 찾기, 회원가입 기능 -->
				<div class="menu_area clear">
					<div class="signIn_info">
						<div class="help_w">
							<a href="/searchEmail?url=http"
								onclick="setGtagEven('로그인_이메일찾기');"
								id="user-signIn-helpMenu-searchEmail"> 이메일 찾기 </a>
						</div>
						<div class="help_w">
							<a href="/searchPwd?url=http"
								onclick="setGtagEven('로그인_비밀번호찾기');"
								id="user-signIn-helpMenu-searchPwd"> 비밀번호 찾기 </a>
						</div>
						<div class="help_w">
							<a href="/signUp?url=http" onclick="setGtagEven('로그인_회원가입');"
								id="user-signIn-helpMenu-signUp"> 회원가입 </a>
						</div>
					</div>
				</div>
				<div class="social_area content__social"
					id="user-signIn-signInSocialArea">
					<div class="box__social">
						<a href="javascript:;"
							class="link_social_btn link__social link__social--naver"
							id="user-signIn-socialButton-naver"
							onclick="setGtagEvent('로그인_네이버로그인');">
							<div class="thumb__social"></div> <span class="title__social">네이버
								로그인</span>
						</a>
						<!-- 마지막에 사용한 로그인 툴팁 표시 기능 -->
						<div class="box__tooltip " id="box__tooltip-naver">
							<span class="text__history">마지막 로그인</span>
							<button type="button" class="button__close"
								onclick="closeTooltip();">
								<span class="blind">닫기</span>
							</button>
						</div>
					</div>
					<div class="box__social">
						<a href="javascript:;"
							class="link_social_btn link__social link__social--kakao"
							id="user-signIn-socialButton-kakao"
							onclick="setGtagEvent('로그인_카카오로그인');">
							<div class="thumb__social"></div> <span class="title__social">카카오
								로그인</span>
						</a>
						<div class="box__tooltip " id="box__tooltip-kakao">
							<span class="text__history">마지막 로그인</span>
							<button type="button" class="button__close"
								onclick="closeTooltip();">
								<span class="blind">닫기</span>
							</button>
						</div>
					</div>
				</div>
			</form>
			<!-- //signIn_form -->
		</div>
		<!-- //container -->
	</div>
	<!-- //signIn_wrap -->
</body>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>