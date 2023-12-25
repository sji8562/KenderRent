package com.tenco.toyproject.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.tenco.toyproject.repository.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.toyproject.repository.interfaces.CustomerRepository;
import com.tenco.toyproject.repository.interfaces.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	public Product findById(Integer id) {
	 
		Product productEntity = productRepository.findById(id);
	
		return productEntity;
	}


	public List<Map<String, Object>> selectCustomer(int code, int start){
		return customerRepository.selectCustomer(code, start);

	}
	
	public List<Product> showCartById(Integer userId){
		List<Product> cartEntity = productRepository.showCartById(userId);
		return cartEntity;
	}
	
	public void addToCartById(int userId, int productId) {
		productRepository.addToCartById(userId, productId);
	}
	
	public int countProductCustomer(int productId) {
        return productRepository.countProductCustomer(productId);
    }
	
	public int deleteCartItem(int userId, int productId) {
		return productRepository.deleteCartItem(userId, productId);		
	}

	public boolean isItemInCart(int userId, int productId) {
		return productRepository.isItemInCart(userId, productId) > 0;
	}
	public int countItemInCart(int userId) {
		return productRepository.countItemInCart(userId);
	}
	
	public void payForProduct(int userId, int productId, String postNumber, String address, String addressDetail) {
		productRepository.payForProduct(userId, productId, postNumber, address, addressDetail);
	}
	public List<Map> showCustomerOrderList(int userId) {
		return productRepository.showCustomerOrderList(userId);
	}
	public void applyForRefund(int productId, int userId, int orderId) {
		PayBack payback = new PayBack();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Product product = findById(productId);
		Sale sale = findTid(orderId);
		int status = 1;
		if (sale.getStatus() < 4) {
			status = 2;
		}
		payback.setProductId(productId);
		payback.setCreateAt(timestamp);
		payback.setUserId(userId);
		payback.setMoney(product.getPrice().intValue());
		payback.setStatus(status);
		productRepository.applyForRefund(payback);
	}
	public Sale findTid(int orderId) {
		return productRepository.findTid(orderId);
	}
	public int deleteRefundFromSale(int orderId) {
		return productRepository.deleteRefundFromSale(orderId);
	}
	public List<Map> showCancelList(int userId) {
		return productRepository.showCancelList(userId);
	}
	public void addToBookmark(int userId, int productId) {
		productRepository.addToBookmark(userId, productId);
	}
	public boolean checkWishList(int userId, int productId) {
		if(productRepository.checkWishList(userId, productId) > 0) {
			return true;
		} else return false;
	}
	public List<Map> showWishList(int id) {
		return productRepository.showWishList(id);
	}
	public int deleteWishList(int userId, int productId) {
		return productRepository.deleteWishList(userId, productId);
	}
	public void updateTid(String tid, int userId, int productId) {
		productRepository.updateTid(tid, userId, productId);
	}
	public void deleteFromSale(int userId, int productId) {
		productRepository.deleteFromSale(userId, productId);
	}
	public int countReview(int productId) {
		return productRepository.countReview(productId);
	}
	public List<Map> showReview(int productId) {
		return productRepository.showReview(productId);
	}
	public List<Map> showRentList(int userId) {
		return productRepository.showRentList(userId);
	}
	public Rent findRentList(int id) {
		return productRepository.findRentList(id);
	}

	// 무한 스크롤 관련
//	public int searchProductCount(String keyword) {
//		return productRepository.searchProductCount(keyword);
//	}
	public List<Map> searchProductInfinite(String keyword, int page, int pageSize){
		int offset = (page - 1) * pageSize;
		System.out.println(offset);
		System.out.println(pageSize);
		System.out.println( productRepository.searchProductInfinite(keyword, offset, pageSize).size());
		return productRepository.searchProductInfinite(keyword, offset, pageSize);
	}
	public List<Map> searchProduct(String keyword){
		return productRepository.searchProduct(keyword);
	}
	public int searchMaxPrice() {
		return productRepository.searchMaxPrice();
	}

	public List<Product> findByCategoryId(Integer id) {
		return productRepository.findByCategoryId(id);
	}
	public List<SecondCategory> findBysCategoryId(Integer id) {
		return productRepository.findBysCategoryId(id);
	}
}
