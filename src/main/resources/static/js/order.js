//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== ''
					&& /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== ''
					&& data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample4_postcode').value = data.zonecode;
				document.getElementById("sample4_roadAddress").value = roadAddr;
				document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				} else {
					document.getElementById("sample4_extraAddress").value = '';
				}

				var guideTextBox = document.getElementById("guide");
				
			}
		}).open();
}

document.addEventListener('DOMContentLoaded', function() {
	var nameInput = document.getElementById('name');
	var nameInfo = document.getElementById('nameInfo');
	
	var phoneInput = document.getElementById('phoneNumber');
	var phoneInfo = document.getElementById('phoneInfo');
	
	var postInput = document.getElementById('sample4_postcode');
	var postInfo = document.getElementById('postInfo');
	
	var addressInput = document.getElementById('sample4_roadAddress');
	var addressInfo = document.getElementById('addressInfo');
	
	var detailInput = document.getElementById('sample4_detailAddress');
	var detailInfo = document.getElementById('detailInfo');
	
	var useCheckbox = document.getElementById('useCheckbox');

	useCheckbox.addEventListener('change', function() {
		if (this.checked) {
			nameInput.value = nameInfo.innerText;
			phoneInput.value = phoneInfo.innerText;
			postInput.value = postInfo.innerText;
			addressInput.value = addressInfo.innerText;
			detailInput.value = detailInfo.innerText;
					
		} else {
			nameInput.value = "";
			phoneInput.value = "";
			postInput.value = "";
			addressInput.value = "";
			detailInput.value = "";
	
		}
	});
});


