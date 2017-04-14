/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.service.lightlist;

import java.util.List;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.modules.light.dao.lightlist.LightListDao;
import com.jctl.cloud.modules.light.entity.lightlist.LightList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jctl.cloud.common.service.CrudService;

/**
 * 灯具列表Service
 * @author kay
 * @version 2016-11-11
 */
@Service
@Transactional(readOnly = true)
public class LightListService extends CrudService<LightListDao, LightList> {

	public LightList get(String id) {
		return super.get(id);
	}
	
	public List<LightList> findList(LightList lightList) {
		return super.findList(lightList);
	}
	
	public Page<LightList> findPage(Page<LightList> page, LightList lightList) {
		return super.findPage(page, lightList);
	}
	
	@Transactional(readOnly = false)
	public void save(LightList lightList) {
		super.save(lightList);
	}
	
	@Transactional(readOnly = false)
	public void delete(LightList lightList) {
		super.delete(lightList);
	}
	
}