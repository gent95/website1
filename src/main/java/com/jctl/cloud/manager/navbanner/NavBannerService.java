/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.navbanner;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 导航的轮播Service
 * @author 1
 * @version 2016-12-28
 */
@Service
@Transactional(readOnly = true)
public class NavBannerService extends CrudService<NavBannerDao, NavBanner> {

	@Autowired
	private NavBannerDao navBannerDao;
	public NavBanner get(String id) {
		return super.get(id);
	}
	
	public List<NavBanner> findList(NavBanner navBanner) {
		return super.findList(navBanner);
	}
	
	public Page<NavBanner> findPage(Page<NavBanner> page, NavBanner navBanner) {
		return super.findPage(page, navBanner);
	}
	
	@Transactional(readOnly = false)
	public void save(NavBanner navBanner) {
		super.save(navBanner);
	}
	
	@Transactional(readOnly = false)
	public void delete(NavBanner navBanner) {
		super.delete(navBanner);
	}

	public NavBanner getByNavId(NavBanner banner) {
		return navBannerDao.getByNavId(banner);
	}
}