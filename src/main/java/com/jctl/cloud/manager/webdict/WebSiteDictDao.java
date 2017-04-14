/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.webdict;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 字典DAO接口
 * @author kay
 * @version 2016-12-13
 */
@MyBatisDao
public interface WebSiteDictDao extends CrudDao<WebSiteDict> {
	
}