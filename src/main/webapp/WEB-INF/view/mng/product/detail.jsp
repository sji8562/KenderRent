<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<link rel="stylesheet" href="/css/style.css">

	<div class="m--margin">
		물품 상세 페이지
		
		<div>${product}</div>
		
		<div>상품번호 ${product.id}</div>
		<div>카테고리 ${product.firstCategoryName} > ${product.secondCategoryName}</div>
		<div>물품명 ${product.name}</div>
		<div>썸네일 ${product.picUrl}</div>
		<div>물품등급 ${product.grade}</div>
		<div>대여/판매여부 ${product.status}</div>
		<div>상품 상세 설명 ${product.content}</div>
	</div>
	
</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>