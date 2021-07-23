package com.ictsaeil.sample.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictsaeil.sample.mapper.ProductMapper;

@Service
public class ProductService {
	@Autowired
	ProductMapper productMapper;
	
	public List<Map<String, Object>> searchByName(String name){
		List<Map<String, Object>> products = productMapper.selectByName(name);
		
		for(Map<String, Object> product : products) {
			int stock = (int)product.get("STOCK");
			
			String status = "";
			if(stock > 0 && stock <= 100) {
				status = "품절임박";
			}
			else if(stock == 0) {
				status = "품절";
			}
			
			product.put("STATUS", status);
		}
		
		return products;
	}
}
