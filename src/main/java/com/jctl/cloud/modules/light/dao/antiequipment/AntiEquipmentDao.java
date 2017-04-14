/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.dao.antiequipment;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;
import com.jctl.cloud.modules.light.entity.antiequipment.AntiEquipment;

/**
 * 防盗设备DAO接口
 * @author kay
 * @version 2016-11-11
 */
@MyBatisDao
public interface AntiEquipmentDao extends CrudDao<AntiEquipment> {
	
}