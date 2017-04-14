/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.service.antiequipment;

import java.util.List;

import com.jctl.cloud.common.persistence.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jctl.cloud.common.service.CrudService;
import com.jctl.cloud.modules.light.entity.antiequipment.AntiEquipment;
import com.jctl.cloud.modules.light.dao.antiequipment.AntiEquipmentDao;

/**
 * 防盗设备Service
 * @author kay
 * @version 2016-11-11
 */
@Service
@Transactional(readOnly = true)
public class AntiEquipmentService extends CrudService<AntiEquipmentDao, AntiEquipment> {

	public AntiEquipment get(String id) {
		return super.get(id);
	}
	
	public List<AntiEquipment> findList(AntiEquipment antiEquipment) {
		return super.findList(antiEquipment);
	}
	
	public Page<AntiEquipment> findPage(Page<AntiEquipment> page, AntiEquipment antiEquipment) {
		return super.findPage(page, antiEquipment);
	}
	
	@Transactional(readOnly = false)
	public void save(AntiEquipment antiEquipment) {
		super.save(antiEquipment);
	}
	
	@Transactional(readOnly = false)
	public void delete(AntiEquipment antiEquipment) {
		super.delete(antiEquipment);
	}
	
}