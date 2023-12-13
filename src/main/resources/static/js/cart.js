/**
 * 
 */

function calculateTotalPrice() {
	var checkboxes = document.getElementsByName('selectedProduct');
	var selectedProductPrice = 0;
	var deliveryFee = 0; // 배송비

	// 계산 선택된 상품의 가격
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) {
			selectedProductPrice += parseFloat(checkboxes[i].value);
			var deliveryFee = 3000;
		}
	}


	var totalPrice = selectedProductPrice + deliveryFee;

	// 천 단위로 쉼표 추가
	var formattedSelectedProductPrice = selectedProductPrice.toLocaleString();
	var formattedTotalPrice = totalPrice.toLocaleString();

	document.getElementById('selectedProductPrice').innerText = '선택 상품금액:   ' + formattedSelectedProductPrice + '원';
	document.getElementById('deliveryFee').innerText = '배송비: ' + deliveryFee.toLocaleString() + '원';
	document.getElementById('totalPrice').innerText = formattedTotalPrice + "원";
}

function selectAll() {
	var checkboxes = document.getElementsByName('selectedProduct');
	var selectAllCheckbox = document.getElementById('selectAll');

	// 전체 선택 버튼을 누르면 모두 선택
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = selectAllCheckbox.checked;
	}

	calculateTotalPrice();
}

function toggleCheckbox(productId) {
	var checkbox = document.getElementById(productId);

	// 품절된 상품의 경우 체크박스를 비활성화
	if (checkbox.nextElementSibling.classList.contains('sold-out')) {
		checkbox.disabled = true;
	} else {
		checkbox.disabled = false;
	}
}

var selectAllCheckbox = document.getElementById('selectAll');
selectAllCheckbox.addEventListener('change', function() {
	selectAll();
});