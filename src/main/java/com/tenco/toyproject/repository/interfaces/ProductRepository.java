package com.tenco.toyproject.repository.interfaces;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.toyproject.repository.entity.Cart;
import com.tenco.toyproject.repository.entity.Product;

@Mapper
public interface ProductRepository {
	public Product findById(Integer id); 
	public List<Product> showCartById(Integer userId);
	public void addToCartById(@Param("userId") int userId, @Param("productId") int productId);
	public int countProductCustomer(int productId);
	public int deleteCartItem(@Param("userId") int userId, @Param("productId") int productId);
	public int isItemInCart(@Param("userId") int userId, @Param("productId") int productId);
	public int countItemInCart(@Param("userId") int userId);
	public void payForCart(@Param("userId") int userId, Cart cart);
	public void payForProduct(@Param("userId") int userId, @Param("productId") int productId);
}
