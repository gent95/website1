/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.webdict;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 字典Service
 * @author kay
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class WebSiteDictService extends CrudService<WebSiteDictDao, WebSiteDict> {

	public WebSiteDict get(String id) {
		return super.get(id);
	}
	
	public List<WebSiteDict> findList(WebSiteDict webSiteDict) {
		return super.findList(webSiteDict);
	}
	
	public Page<WebSiteDict> findPage(Page<WebSiteDict> page, WebSiteDict webSiteDict) {
		return super.findPage(page, webSiteDict);
	}
	
	@Transactional(readOnly = false)
	public void save(WebSiteDict webSiteDict) {
		super.save(webSiteDict);
	}
	
	@Transactional(readOnly = false)
	public void delete(WebSiteDict webSiteDict) {
		super.delete(webSiteDict);
	}
	
}