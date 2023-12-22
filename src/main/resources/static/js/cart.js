/**
 * 
 */
var selectedProducts = [];

// 선택된 상품의 번호 배열 저장
function selectedProductId() {
    var checkboxes = document.getElementsByName('selectedProduct');

    for (var i = 0; i < checkboxes.length; i++) {
        var currentProductId = checkboxes[i].value;
        if (checkboxes[i].checked) {
            if (!selectedProducts.includes(currentProductId)) {
                selectedProducts.push(currentProductId);
            } 
        } else {
            var index = selectedProducts.indexOf(currentProductId);
            if (index !== -1) {
                selectedProducts.splice(index, 1);
            }
        }
    }

    document.getElementById('selectedProductsInput').value = selectedProducts.join(",");
    
}

function calculateTotalPrice() {
	var checkboxes = document.getElementsByName('selectedProduct');
	var selectedProductPrice = 0;
	var deliveryFee = 0; // 배송비

	// 계산 선택된 상품의 가격
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) {
			selectedProductPrice += parseFloat(checkboxes[i].getAttribute('data-price'));
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
	selectedProductId();
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

function validateOrder() {

	var totalPrice = parseInt(document.getElementById('totalPrice').innerText.replace('원', ''), 10);

	if (totalPrice === 0) {
        alert("장바구니에서 물건을 선택해주세요.");
        return false;
     }
     return true;
 }
