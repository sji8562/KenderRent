<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



	<!-- Header -->

	<jsp:include page="../layout/headerSub.jsp" />

	<br><br><br><br><br><br><br>
	
	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>고객님 아이디 찾기가 완료 되었습니다.</h2>
						
					</div>
					
				</div>
			</div>
			<br>
			<hr>
			<div class="row">
				<div class="col text-center" style="border: 1px solid black;">
					<br>
					<h5 >이름 : ${foundUser.user_name }</h5>
					<br>
					<h5>email : ${foundUser.email }</h5> 
					<br>
				</div>
				
			</div>
			<div class="row">
				<div class="col text-center">
					<br><br>
					<button onclick="location.href='/user/signIn'" type="button"  value="로그인" class="btn btn-dark" style="cursor:pointer">로그인</button>
					<button onclick="location.href='/user/findPassword'" type="button"  value="비밀번호 찾기" class="btn btn-dark" style="cursor:pointer">비밀번호찾기</button>
				</div>
			</div>
		</div>	
	<jsp:include page="../layout/footer.jsp" />
	</div>
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/dropdown.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>