<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mng/layout/mngHeader.jsp" %>


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

                        <select class="form-select" size="3" aria-label="Size 3 select example" style="height: 300px;" onchange="fCategoryChange()" id="firstCategory" name="firstCategory">

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

                            <input type="text" class="m--category-input" id="addSecondCategory" name="secondCategory">

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

    function displayFirstCategoryData(data) {
        // fetch('/mng/product/first-category-all')
        //     .then(response => response.json())
        //     .then(data => {
        //         console.log("뭔데 이거?" + data);

                var firstCategorySelect = document.getElementById("firstCategory");
                firstCategorySelect.innerHTML = '<option disabled>1차 카테고리</option>';

                data.forEach((firstCategory) => {
                    var option = document.createElement('option');
                    option.value = firstCategory.id;
                    option.text = firstCategory.firstCategoryName;

                    firstCategorySelect.add(option);
                });
            // })
            // .catch(error => {
            //     console.error('Error fetching data:', error);
            // })
    }

    function displaySecondCategoryData(data) {
        console.log("DATA 감사해요", data)

        var secondCategorySelect = document.getElementById("secondCategorySelect");
        secondCategorySelect.innerHTML = '<option disabled>2차 카테고리</option>';

        data.forEach((secondCategory) => {


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

        if(addFirstCategory.toString().trim() == '') {

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

                if(data.length > 0) {
                    displayFirstCategoryData(data);
                    document.querySelector('input[id="addFirstCategory"]').value = '';
                }


            })
            .catch(error => {
                console.error("POST 요청 실패", error);
            })
    }

    function delFirstCategory() {
        var selectedValue = document.querySelector('select[name="firstCategory"]').value;
        console.log('선택된 first category 값', selectedValue);
        if(!selectedValue) {

            return alert('삭제할 카테고리를 선택해주세요');
        }

        fetch('/mng/product/delete-first-category-by-id/' + selectedValue)
            .then(response => {
                console.log(response.json());

                history.go(0);
                return response.json();
            })
            .then(data => {

                console.log("이건 뭐죠~~?", data);

                if (data && data.message) {
                    alert(data.message);
                }
                // if(data && data.message) {
                //     return alert(data.message);
                // }
                // history.go(0);
                // displaySecondCategoryData(data);
            })
            .catch(error => {
                // alert(error.message);

                console.error('Error fetching data:', error);
            })
    }

    function addSecondCategory() {


        console.log("선택된 1차 카테고리값 확인");
        var selectedFirstCategory = document.querySelector('select[id="firstCategory"]').value;
        console.log('SELECTED FIRST CATEGORY', selectedFirstCategory);
        if(!selectedFirstCategory) {
            return alert('1차 카테고리를 선택해주세요');
        }

        var addSecondCategory = document.querySelector('input[id="addSecondCategory"]').value;
        if(addSecondCategory.trim() == "") {
            return alert('카테고리명을 입력해주세요');
        }

        addSecondCategoryApi(selectedFirstCategory, addSecondCategory);
    }

    function addSecondCategoryApi(selectedFirstCategory, categoryName) {
        var url = '/mng/product/addSecondCategory';

        fetch(url, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ "selectedFirstCategory": selectedFirstCategory, "categoryName": categoryName }),
        })
            .then(response => response.json())
            .then(data => {
                displaySecondCategoryData(data);
                document.querySelector('input[id="addSecondCategory"]').value = '';
                console.log("POST 요청 성공", data);

            })
            .catch(error => {
                console.error("POST 요청 실패", error);
            })
    }

    function delSecondCategory() {


        var selectedValue = document.querySelector('select[id="secondCategorySelect"]').value;

        console.log('선택된 second category 값', selectedValue);
        if(!selectedValue) {
            return alert('삭제할 2차 카테고리를 선택해주세요');
        }

        fetch('/mng/product/delete-second-category-by-id/' + selectedValue)
            .then(response => response.json())
            .then(data => {

                fCategoryChange();
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            })

    }


<%@ include file="/WEB-INF/view/mng/layout/mngFooter.jsp" %>