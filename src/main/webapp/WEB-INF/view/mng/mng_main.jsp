<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
--------------------------------
<div style="display: flex; justify-content: center">
    <div style="width: 2400px; text-align: center">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card border-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">현재 매출 집계</div>
                        <div class="card-body text-success">
                            <h5 class="card-title">총 매출 : 1034000원</h5>
                            <p class="card-title">총 주문 건수 : 70건</p>
                            <p class="card-title">최고 매출 메뉴 : 제주 비자림 콜드 브루 / 340000원</p>
                            <p class="card-title">최다 판매 메뉴 : 아이스 카페 아메리카노 / 297000원</p>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card border-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">주간 매출 집계</div>
                        <div class="card-body text-success">
                            <h5 class="card-title">주간 총 매출 : 258500원</h5>
                            <p class="card-text">총 주문 건수 : 40건</p>
                            <p class="card-text">최고 매출 메뉴 : 자바칩 푸라푸치노 / 148900원 </p>
                            <p class="card-text">최다 판매 메뉴 : 아이스 카페 아메리카노 / 110800원 </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card border-primary mb-3" style="max-width: 18rem;">
                        <div class="card-header">10월 31일 결산</div>
                        <div class="card-body text-primary">
                            <h5 class="card-title">총 매출액 : 64100원</h5>
                            <p class="card-text">총 주문 건수 : 8건</p>
                            <p class="card-text">최고 매출 메뉴 : 치킨 클래식 샌드위치 / 33000원 </p>
                            <p class="card-text">최다 판매 메뉴 : 바닐라 라떼 / 15400원 </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">
            <div class="container-fluid mt-3" style="display: flex; justify-content: center">
                <h3>10월 4주차 매출 통계</h3>
            </div>
            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="inactive"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
        <div class="container mt-3">
            <h5>10월 31일 (화) 일일 주문내역</h5>
            <table class="table table-hover">
                <thead class="table-success">
                <tr>
                    <th>No.</th>
                    <th>결제일</th>
                    <th>결제시간</th>
                    <th>고객ID</th>
                    <th>고객명</th>
                    <th>품목</th>
                    <th>누적주문횟수</th>
                    <th>금액</th>
                    <th>결제수단</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>23.10.31</td>
                    <td>08:30:22</td>
                    <td>john</td>
                    <td>최제인</td>
                    <td>아이스 카페 아메리카노</td>
                    <td>10회</td>
                    <td>4500원</td>
                    <td>카드</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>23.10.31</td>
                    <td>08:32:47</td>
                    <td>ssar</td>
                    <td>김쌀</td>
                    <td>블랙 갈릭 에그 샌드위치</td>
                    <td>15회</td>
                    <td>6400원</td>
                    <td>카드</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>23.10.31</td>
                    <td>09:54:01</td>
                    <td>cos</td>
                    <td>코스</td>
                    <td>바닐라 라떼</td>
                    <td>5회</td>
                    <td>4800원</td>
                    <td>카드</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>23.10.31</td>
                    <td>11:00:38</td>
                    <td>john</td>
                    <td>러브</td>
                    <td>치킨 클래식 샌드위치</td>
                    <td>7회</td>
                    <td>6200원</td>
                    <td>카드</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>23.10.31</td>
                    <td>15:34:14</td>
                    <td>ssar</td>
                    <td>김쌀</td>
                    <td>자바칩 프라푸치노</td>
                    <td>16회</td>
                    <td>6200원</td>
                    <td>카드</td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['10월 23일', '10월 24일', '10월 25일', '10월 26일', '10월 27일', '10월 28일', '10월 29일'],
            datasets: [{
                label: '10월 4번째 주 주간 매출액',
                data: [120000, 190000, 300000, 500000, 200000, 300000, 100000],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(1, 1, 1, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(1, 1, 1, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    


    

    <%@ include file="/WEB-INF/view/layout/footer.jsp" %>