/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.newscontent;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * newsContentService
 * @author kay
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class NewsContextService extends CrudService<NewsContextDao, NewsContext> {


	@Autowired
	private NewsContextDao newsContentDao;


	public NewsContext get(String id) {
		return super.get(id);
	}
	
	public List<NewsContext> findList(NewsContext newsContext) {
		return super.findList(newsContext);
	}
	
	public Page<NewsContext> findPage(Page<NewsContext> page, NewsContext newsContext) {
		return super.findPage(page, newsContext);
	}
	
	@Transactional(readOnly = false)
	public void save(NewsContext newsContext) {
		super.save(newsContext);
	}
	
	@Transactional(readOnly = false)
	public void delete(NewsContext newsContext) {
		super.delete(newsContext);
	}

	public NewsContext getByNewsListId(Long newListId) {
		return  newsContentDao.getByNewsListId(newListId);
	}

	public void deleteByNewsId(Long newListId) {
		newsContentDao.deleteByNewsId(newListId);
	}



}