/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.product;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 产品DAO接口
 * @author msl
 * @version 2016-12-26
 */
@MyBatisDao
public interface ProductDao extends CrudDao<Product> {

    List<Product> findByNavId(Product product);
}