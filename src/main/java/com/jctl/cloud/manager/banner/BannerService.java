/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.banner;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 轮播图Service
 * @author kay
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class BannerService extends CrudService<BannerDao, Banner> {

	@Autowired
	private BannerDao bannerDao;
	public Banner get(String id) {
		return super.get(id);
	}
	
	public List<Banner> findList(Banner banner) {
		return super.findList(banner);
	}
	
	public Page<Banner> findPage(Page<Banner> page, Banner banner) {
		return super.findPage(page, banner);
	}
	
	@Transactional(readOnly = false)
	public void save(Banner banner) {
		super.save(banner);
	}
	
	@Transactional(readOnly = false)
	public void delete(Banner banner) {
		super.delete(banner);
	}

	public void changeStatus(Banner banner) {
		bannerDao.changeStatus(banner);
	}

	public List<Banner> getBannerList() {
		return bannerDao.getBannerList();
	}
}