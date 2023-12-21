
function confirmOpen(type, id) {
    console.log(type);
    console.log(id);

    if(type == 'del') {
        if(confirm('삭제하시겠습니까?')) {
            fetch('/mng/product/' + id + '/delete')
                .then((response) => {
                    history.go(0);
                    console.log("response", response)
                }) //성공했을때
                .catch((error) => console.log("error:", error)) //실패했을때
        }
    }
}

function reviewConfirmOpen(type, id) {
    console.log(type);
    console.log(id);

    if(type == 'del') {
        if(confirm('후기를 삭제하시겠습니까?')) {
            fetch('/mng/product/review/' + id + '/delete')
                .then((response) => {
                    history.go(0);
                    console.log("response", response)
                }) //성공했을때
                .catch((error) => console.log("error:", error)) //실패했을때
        }
    }
}

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
    var selectedValue = document.querySelector('select[id="firstCategory"]').value;

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
    var code = document.querySelector('input[id="code"]').value;

    if(addFirstCategory.toString().trim() == '') {
        return alert('카테고리명을 입력해주세요');
    }

    addFirstCategoryApi(addFirstCategory, code);
}

function addFirstCategoryApi(categoryName, code) {
    var url = '/mng/product/addFirstCategory';

    fetch(url, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ "categoryName": categoryName, "code": code }),
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

$('#summernote').summernote({
    placeholder: '내용을 입력해주세요.',
    tabsize: 2,
    height: 400,
    lang: 'ko-KR', // default: 'en-US'
});
ClassicEditor
    .create( document.querySelector( '#editor' ))
    .then(editor => {
        console.log("------------------------------", editor);
        const toolbarElement = editor.ui.view.toolbar.element;
        toolbarElement.style.display = 'none';
        editor.enableReadOnlyMode( 'editor' );
        console.log('Editor was initialized', editor);
    })
    .catch( error => {
        console.error( error );
    } );
document.getElementById('applyManagement').addEventListener('mouseenter', function() {
    // 마우스가 올라갈 때 이벤트 발생
    document.getElementById('applyManagement').classList.add('show');
});

document.getElementById('applyManagement').addEventListener('mouseleave', function() {
    // 마우스가 벗어날 때 이벤트 발생
    document.getElementById('applyManagement').classList.remove('show');
});
document.getElementById('noticeManagement').addEventListener('mouseenter', function() {
    // 마우스가 올라갈 때 이벤트 발생
    document.getElementById('noticeManagement').classList.add('show');
});

document.getElementById('noticeManagement').addEventListener('mouseleave', function() {
    // 마우스가 벗어날 때 이벤트 발생
    document.getElementById('noticeManagement').classList.remove('show');
});

document.getElementById('productManagement').addEventListener('mouseenter', function() {
    // 마우스가 올라갈 때 이벤트 발생
    document.getElementById('productManagement').classList.add('show');
});

document.getElementById('productManagement').addEventListener('mouseleave', function() {
    // 마우스가 벗어날 때 이벤트 발생
    document.getElementById('productManagement').classList.remove('show');
});
document.getElementById('categoryManagement').addEventListener('mouseenter', function() {
    // 마우스가 올라갈 때 이벤트 발생
    document.getElementById('categoryManagement').classList.add('show');
});

document.getElementById('categoryManagement').addEventListener('mouseleave', function() {
    // 마우스가 벗어날 때 이벤트 발생
    document.getElementById('categoryManagement').classList.remove('show');
});

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;

            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 주문번호/ 환불신청시간 / 환불상태(신청/처리/완료) / 환불완료 시간 / 환불금액 이정도 생각하고있는데

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postNumber').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();
}

var mapContainer = document.getElementById('mngKakaoMap'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.35883233527734, 127.10797856487766), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var dtoAddress = document.getElementById("address");


// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


// 주소로 좌표를 검색합니다
geocoder.addressSearch(dtoAddress.value, function (result, status) {


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

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        relayout();

    }
});

function relayout() {

    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}
