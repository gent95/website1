/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.product;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 产品Service
 * @author msl
 * @version 2016-12-26
 */
@Service
@Transactional(readOnly = true)
public class ProductService extends CrudService<ProductDao, Product> {

	@Autowired
	private ProductDao productDao;

	public Product get(String id) {
		return super.get(id);
	}
	
	public List<Product> findList(Product product) {
		return super.findList(product);
	}
	
	public Page<Product> findPage(Page<Product> page, Product product) {
		return super.findPage(page, product);
	}
	
	@Transactional(readOnly = false)
	public void save(Product product) {
		super.save(product);
	}
	
	@Transactional(readOnly = false)
	public void delete(Product product) {
		super.delete(product);
	}

    public List<Product> findByNavId(Product product) {
		return productDao.findByNavId(product);
    }

}