<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="col-sm-8">
	<h2>회원가입</h2>
	<h5>우리 아이를 위한 에코-소비생활, Kinderlend</h5>
	<div>
		<form action="/user/userSignUp" method="post">
			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" placeholder="이메일을 입력하세요." id="email"
					name="email">
			</div>

			<!-- 이메일 인증 기능 추가 -->

			<div class="form-group">
				<label for="password">비밀번호</label> <input type="password"
					class="form-control" placeholder="비밀번호를 입력하세요." id="password"
					name="password">
			</div>
			(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
			<div class="form-group">
				<label for="passwordCheck">비밀번호 확인</label> <input type="password"
					class="form-control" placeholder="비밀번호를 확인해주세요." id="passwordCheck"
					name="passwordCheck">
			</div>
			<div class="form-group">
				<label for="userNickname">닉네임</label> <input type="text"
					class="form-control" placeholder="닉네임을 입력해주세요." id="userName"
					name="userName">
			</div>
			<div class="form-group">
				<label for="userAddress">주소</label> <input type="text"
					class="inputTypeText" id="postcode" name="postcode">우편번호 <input
					type="text" class="inputTypeText" id="address" name="addr1">기본주소
				<input type="text" class="inputTypeText" id="addressDetail"
					name="addr2">상세주소
				<!-- 카카오 우편번호 서비스 기능 추가 -->

			</div>
			<div class="form-group">
				<label for="phoneNumber">연락처</label> <select id="phNum1"
					name="phNum[]">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> <input id="phNum2" name="phNum[]" placeholder="" value=""
					type="text" /> <input id="phNum3" name="phNum[]" placeholder=""
					value="" type="text" />
			</div>
			<h3>전체 동의</h3>
			<div class="ec-base-box typeThinBg gStrong">
				<p>
					<span class="ec-base-chk"> <input type="checkbox"
						id="agreeAllChecked"> <em class="checkbox"></em>
					</span> <label for="agreeAllChecked"> <strong>이용약관 및
							개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong>
					</label>
				</p>
			</div>

			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 이용약관 동의</h3>
				<div class="text">약관입니다.</div>
				<p class="check">
					<span>이용약관에 동의하십니까?</span> <input id="agreeServiceCheck0"
						name="agreeServiceCheck[]" value="1" type="checkbox"> <label
						for="agreeServiceCheck0">동의함</label>
				</p>
			</div>

			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 개인정보 수집 및 이용 동의</h3>
				<div class="text">약관입니다.</div>
				<p class="check">
					<span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agreePrivacyCheck0"
						name="agreePrivacyCheck[]" value="1" type="checkbox"> <label
						for="agreePrivacyCheck0">동의함</label>
				</p>
			</div>

			<div class="ec-base-box typeThinBg agreeArea displaynone">
				<h3>[선택] 개인정보 제3자 제공 동의</h3>
				<div class="content">
					<div class="text">약관입니다.</div>
				</div>
				<p class="check">
					<span>개인정보 제3자 제공에 동의하십니까?</span> <input
						id="agreeInformationCheck0" name="agreeInformationCheck[]"
						value="1" type="checkbox"> <label
						for="agreeInformationCheck0">동의함</label>
				</p>
			</div>

			<div class="ec-base-box typeThinBg agreeArea displaynone">
				<h3>[선택] 개인정보 처리 위탁 동의</h3>
				<div class="content">약관입니다.</div>
				<p class="check">
					<span>개인정보 처리 위탁에 동의하십니까?</span> <input id="agreeConsignmentCheck0"
						name="agreeConsignmentCheck[]" value="1" type="checkbox">
					<label for="agreeConsignmentCheck0">동의함</label>
				</p>
			</div>

			<button type="submit" class="btn btn-primary">가입하기</button>
		</form>

	</div>

</div>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>