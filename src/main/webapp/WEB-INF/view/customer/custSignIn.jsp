<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/layout/header.jsp" %>
	
	<div class="col-sm-8">
      <h2>로그인</h2>
      <h5>우리 아이를 위한 에코-소비생활, Kinderlend</h5>
		<div>
			<form action="/customer/custSignIn" method="post">
			  	<div class="form-group">
    				<label 	for="email">이메일</label>
    				<input 	type="text" class="form-control" 
    						placeholder="이메일을 입력하세요." 
    						id="email" name="email">
  				</div>
  				<div class="form-group">
   					<label 	for="password">비밀번호</label>
    				<input 	type="password" class="form-control" 
    						placeholder="비밀번호를 입력하세요." 
    						id="password" name="password">
  				</div>
			<button type="submit" class="btn btn-primary">로그인</button>
			<a href="">
			<img alt="" src="/images/kakao_login_medium_narrow.png" width="150" height="80"></a>
			<a href="">
			<img alt="" src="/images/naver_login_medium_narrow.png" width="150" height="80"></a>
</form>
		
		</div>  

    </div>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>