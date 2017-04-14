/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.navcontent;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 新闻DAO接口
 * @author kay
 * @version 2016-12-21
 */
@MyBatisDao
public interface NavContentDao extends CrudDao<NavContent> {

    NavContent getByNavId(String nacId);

}