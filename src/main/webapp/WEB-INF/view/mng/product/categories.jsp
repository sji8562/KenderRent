<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>
<link rel="stylesheet" href="/css/style.css">

<style>
    .m--category-section {
        width: 100%;
        margin: 5px;
    }
    .form-select {
        /*margin-bottom: 10px;*/
    }
    .m--category-input {
        height: 35px;
        margin-top: 10px;
    }
</style>

<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">카테고리 관리</h4>
            </div>
        </div>
    </div>
    <div class="container-fluid">
    <!-- ============================================================== -->
    <!-- Start Page Content -->
    <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card card-body" style="height: 600px; display: flex; flex-direction: row;">
                    <div class="m--category-section">
                        <select class="form-select" size="3" aria-label="Size 3 select example" style="height: 300px;" onchange="fCategoryChange()" name="firstCategory">
                            <option disabled>1차 카테고리</option>
                            <c:forEach var="fCategory" items="${firstCategoryList}">
                                <option value="${fCategory.id}">${fCategory.firstCategoryName}</option>
                            </c:forEach>
                        </select>
                        <div>
                            <input type="text" class="m--category-input" id="addFirstCategory" name="firstCategory">
                            <button onclick="addFirstCategory()" class="btn btn-primary">추가</button>
                            <button class="btn btn-danger" onclick="delFirstCategory()">삭제</button>
                        </div>
                    </div>
                    <div class="m--category-section">
                        <select class="form-select" size="3" aria-label="Size 3 select example" style="height: 300px;" id="secondCategorySelect">
                            <option disabled>2차 카테고리</option>
                        </select>
                        <div>
                            <input type="text" class="m--category-input" id="secondCategory" name="secondCategory">
                            <button class="btn btn-primary" onclick="addSecondCategory()">추가</button>
                            <button class="btn btn-danger" onclick="delSecondCategory()">삭제</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
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
    <footer class="footer text-center">
        All Rights Reserved by Nice admin. Designed and Developed by
        <a href="https://www.wrappixel.com">WrapPixel</a>.
    </footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
</div>
<script>
    function displaySecondCategoryData(data) {
        console.log("DATA 감사해요", data)

        var secondCategorySelect = document.getElementById("secondCategorySelect");
        secondCategorySelect.innerHTML = '<option disabled>2차 카테고리</option>';

        data.forEach((secondCategory) => {
            console.log("FOR문 돌아보자 ==>" + secondCategory);
            var option = document.createElement('option');
            option.value = secondCategory.id;
            option.text = secondCategory.secondCategoryName;

            secondCategorySelect.add(option);
        });
    }

    function fCategoryChange() {
        // 선택된 값 가져오기
        var selectedValue = document.querySelector('select[name="firstCategory"]').value;

        fetch('/mng/product/second-category-find-by-first-category/' + selectedValue)
            .then(response => response.json())
            .then(data => {
                console.log("잘 들고 왔어요!", data);
                displaySecondCategoryData(data);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            })

        // 선택된 값을 콘솔에 출력
        console.log("Selected Value:", selectedValue);
    }

    function addFirstCategory() {
        var addFirstCategory = document.querySelector('input[id="addFirstCategory"]').value;
        if(addFirstCategory == '') {
            return alert('카테고리명을 입력해주세요');
        }

        addFirstCategoryApi(addFirstCategory);
    }

    function addFirstCategoryApi(categoryName) {
        var url = '/mng/product/addFirstCategory';

        fetch(url, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ "categoryName": categoryName }),
        })
            .then(response => response.json())
            .then(data => {
                console.log("POST 요청 성공", data);
                history.go(0);
            })
            .catch(error => {
                console.error("POST 요청 실패", error);
            })
    }

    function delFirstCategory() {
        var selectedValue = document.querySelector('select[name="firstCategory"]').value;
        console.log('선택된 first category 값', selectedValue);
        if(!selectedValue) {
            alert('삭제할 카테고리를 선택해주세요');
        }

        fetch('/mng/product/delete-first-category-by-id/' + selectedValue)
            .then(response => response.json())
            .then(data => {
                console.log("잘 들고 왔어요!", data);
                history.go(0);
                // displaySecondCategoryData(data);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            })
    }

    function addSecondCategory() {
        console.log('2nd 카테고리 등록. 아직 아무 기능이 없어요.')
    }

    function delSecondCategory() {
        console.log('2nd 카테고리 삭제. 아직 아무 기능이 없어요.')
    }

</script>
<style>

</style>

</body>
</html>
<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>