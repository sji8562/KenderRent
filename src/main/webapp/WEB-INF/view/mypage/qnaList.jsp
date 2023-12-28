<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Kinder Lend</title>
<link rel="stylesheet" type="text/css"
      href="/css/styles/bootstrap4/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
      rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
      href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
      href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
      href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
      href="/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
      href="/css/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
      href="/css/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css" href="/css/myPage.css">
<link rel="stylesheet" type="text/css" href="/css/order.css">
<body>
<div class="super_container">
    <!-- Header -->
    <jsp:include page="../layout/header.jsp" />
    <div class="container product_section_container">
        <div class="row">
            <div class="col product_section clearfix">
                <div class="breadcrumbs d-flex flex-row align-items-center">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li class="active"><i class="fa fa-angle-right"
                                              aria-hidden="true"></i> <a href="/mypage/main"
                                                                         style="color: black">마이페이지</a></li>
                        <li class="active"><i class="fa fa-angle-right"
                                              aria-hidden="true"></i>대여 내역</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar">
                    <div class="sidebar_section">
                        <div class="sidebar_title">
                            <h4>마이페이지</h4>
                        </div>
                        <br>
                        <ul class="sidebar_categories">
                            <li><a href="/mypage/main">MY 홈</a></li>
                            <li><a href="/mypage/order-list">주문 내역</a></li>
                            <li><a href="/mypage/cancel-list">취소 내역</a></li>
                            <li><a href="/mypage/rent-list">대여 내역</a></li>
                            <li><a href="/mypage/wish-list">위시리스트</a></li>
                            <li class="active"><a href="/mypage/qna"><i
                                    class="fa fa-angle-double-right" aria-hidden="true"></i><span>
									</span>문의 내역</a></li>
                            <li><a href="/mypage/user-update">회원정보 변경</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="mypage_lately_info_cont">
                    <div class="box_title"
                         style="margin-bottom: 10px; border-bottom: none; padding-left: 40px">
                        대여 내역</div>

                    <!-- 주문상품 리스트 -->
                    <div id="container"
                         style="margin-left: -30px; display: flex; justify-content: center;">
                        <div id="content"
                             style="display: relative; justify-content: center;">
                            <c:choose>
                                <c:when test="${empty boardList}">
                                    <div style="text-align: center;">
                                        <p style="font-size: 18px">문의 내용이 없습니다.</p>
                                        <a href="/customer/contact?type=3">
                                            <button class="continue_button" style="align-items: center;">문의하러 가기</button>
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <table>
                                        <tbody>
                                        <c:forEach var="boardList" items="${boardList}">
                                            <tr>
                                                <td class="vertical-center">
                                                    <div class="box_content">
                                                        <div class="box_title" style="margin-bottom: 10px">
                                                            <c:choose>
                                                                <c:when test="${boardList.replyId != null}">
                                                                    답변완료
                                                                </c:when>
                                                                <c:otherwise>
                                                                    답변 미완료
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>

                                                        <div class="box_goods">
                                                            <p>${boardList.title}</p>

                                                        </div>
                                                        <div class="add_review">
                                                                <div>
                                                                    <h1 style="font-weight: bold; float: left">답변</h1>
                                                                    <br>
                                                                    <c:choose>
                                                                        <c:when test=" ${boardList.replyId != null}">
                                                                            ${boardList.replyContent}
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            답변이 오지 않았습니다
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                </div>
            </div>
            <br> <br>
        </div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/styles/bootstrap4/popper.js"></script>
<script src="/css/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="/js/categories_custom.js"></script>
<script src="/js/dropdown.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function setRating(clickedIndex) {
        var starElements = document.querySelectorAll('.user_star_rating i');

        for (var i = 0; i < starElements.length; i++) {
            if (i < clickedIndex) {
                starElements[i].classList.remove('fa-star-o');
                starElements[i].classList.add('fa-star');
            } else {
                starElements[i].classList.remove('fa-star');
                starElements[i].classList.add('fa-star-o');
            }
        }
    }
</script>
</body>
</html>