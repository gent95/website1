/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.joinus;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 招聘职位表DAO接口
 * @author ll
 * @version 2017-01-24
 */
@MyBatisDao
public interface JoinUsDao extends CrudDao<JoinUs> {
	
}