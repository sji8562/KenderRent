/**
 * 
 */

function calculateTotalPrice() {
	var checkboxes = document.getElementsByName('selectedProduct');
	var totalPrice = 0;

	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) {
			totalPrice += parseFloat(checkboxes[i].value);
		}
	}

	document.getElementById('totalPrice').innerText = '총 가격: ' + totalPrice;
}

function selectAll() {
	var checkboxes = document.getElementsByName('selectedProduct');
	var selectAllCheckbox = document.getElementById('selectAll');

	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = selectAllCheckbox.checked;
	}

	calculateTotalPrice();
}

var selectAllCheckbox = document.getElementById('selectAll');
selectAllCheckbox.addEventListener('change', function() {
    selectAll();
});