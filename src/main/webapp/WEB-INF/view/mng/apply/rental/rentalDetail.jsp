<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper -->
<!-- ============================================================== -->
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Profile</h4>
            </div>
            <div class="col-7 align-self-center">
                <div class="d-flex align-items-center justify-content-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Profile</li>
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
        <!-- Row -->
        <div class="row">
            <!-- Column -->
            <c:choose>
                <c:when test="${dto != null }">
            <div class="col-lg-4 col-xlg-3">
                <div class="card">


                    <div class="card-body">
                        <center class="mt-4"><img src="${dto.productPicUrl}"
                                                   width="150"/>
                            <h4 class="card-title mt-2">${dto.productId}번 상품</h4>
                            <h6 class="card-subtitle">${dto.productName}</h6>
                        </center>
                    </div>
                    <div>
                        <hr>
                    </div>
                    <div class="card-body"><small class="text-muted">대여 시작날짜 </small>
                        <h6>${dto.startDay}</h6>
                        <small class="text-muted pt-4 db">대여 종료날짜</small>
                        <h6>${dto.endDay}</h6>
                        <small class="text-muted pt-4 db">신청 주소</small>
                        <h6>${dto.address} ${dto.addressDetail} ${dto.postNumber}</h6>
                        <div id="mngKakaoMap" style="width:100%;height:150px;"></div>

                        <small class="text-muted pt-4 db">Social Profile</small>
                        <br/>
                    </div>
                </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-lg-8 col-xlg-9">
                <div class="card">
                    <div class="card-body">
                        <form class="form-horizontal form-material mx-2" method="post" action="/mng/apply/rent-update">
                            <input type="hidden" name="rentId" id="rentId" value="${dto.id}">
                            <div class="form-group">
                                <label class="col-md-12">신청자 이름</label>
                                <div class="col-md-12">
                                    <input type="text"
                                           class="form-control form-control-line" id="username" name="username" value="${dto.username}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-md-12">Email</label>
                                <div class="col-md-12">
                                    <input type="email"
                                           class="form-control form-control-line" name="email"
                                           id="email" value="${dto.email}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">전화번호</label>
                                <div class="col-md-12">
                                    <input type="text"
                                           class="form-control form-control-line" name="phoneNumber" id="phoneNumber" value="${dto.phoneNumber}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">상태</label>
                                <div class="col-sm-12">
                                    <select class="form-select shadow-none form-control-line status" id="status" name="status">
                                        <option value="1">재고있음</option>
                                        <option value="2">대여중</option>
                                        <option value="3">소독중</option>
                                        <option value="4">판매완료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">대여 날짜</label>
                                <div class="col-sm-12">
                                    <input type="date" name="startDay" id="startDay" value=${dto.startDay}>
                                    <input type="date" name="endDay" id="endDay" value=${dto.endDay}>
                                </div>
                            </div>
                            <div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button class="btn btn-success text-white">상태 변경</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Column -->
                </c:when>
                <c:otherwise>
                    잘못된 신청입니다.
                </c:otherwise>
            </c:choose>
        </div>
        <!-- Row -->
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
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85a9fbeacd6dee03b7157c7360812509&libraries=services"></script>
    <script>


        var mapContainer = document.getElementById('mngKakaoMap'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.35883233527734, 127.10797856487766), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };


        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch("${dto.address}", function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">위치를 확인해주세요</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
                relayout();
                var position = map.getCenter();
                console.log(position);
            }
        });
        function relayout() {

            // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
            // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
            // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
            map.relayout();
        }
    </script>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>