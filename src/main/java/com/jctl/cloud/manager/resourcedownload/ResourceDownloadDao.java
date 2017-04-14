/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.resourcedownload;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 资源下载DAO接口
 * @author mjt
 * @version 2016-12-26
 */
@MyBatisDao
public interface ResourceDownloadDao extends CrudDao<ResourceDownload> {
	
}