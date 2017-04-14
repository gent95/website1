/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.serve;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 服务DAO接口
 * @author msl
 * @version 2016-12-26
 */
@MyBatisDao
public interface ServeDao extends CrudDao<Serve> {

    Serve findByNavId(Serve serve);
}