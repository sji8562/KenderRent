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


// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${dto.address}", function (result, status) {

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
// JavaScript 코드
