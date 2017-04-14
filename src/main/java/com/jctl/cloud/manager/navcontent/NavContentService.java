/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.navcontent;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 新闻Service
 * @author kay
 * @version 2016-12-21
 */
@Service
@Transactional(readOnly = true)
public class NavContentService extends CrudService<NavContentDao, NavContent> {

	@Autowired
	private NavContentDao navCountDao;

	public NavContent get(String id) {
		return super.get(id);
	}
	
	public List<NavContent> findList(NavContent navContent) {
		return super.findList(navContent);
	}
	
	public Page<NavContent> findPage(Page<NavContent> page, NavContent navContent) {
		return super.findPage(page, navContent);
	}
	
	@Transactional(readOnly = false)
	public void save(NavContent navContent) {
		super.save(navContent);
	}
	
	@Transactional(readOnly = false)
	public void delete(NavContent navContent) {
		super.delete(navContent);
	}

	public NavContent getByNavId(String nacId) {

		return  navCountDao.getByNavId(nacId);
	}
}