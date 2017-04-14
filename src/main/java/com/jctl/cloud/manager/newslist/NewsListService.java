/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.newslist;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import com.jctl.cloud.manager.newscontent.NewsContextDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 新闻列表Service
 * @author kay
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class NewsListService extends CrudService<NewsListDao, NewsList> {

	@Autowired
	private NewsContextDao newsContextDao;


	@Autowired
	private NewsListDao newsListDao;

	public NewsList get(String id) {
		return super.get(id);
	}
	
	public List<NewsList> findList(NewsList newsList) {
		return super.findList(newsList);
	}
	
	public Page<NewsList> findPage(Page<NewsList> page, NewsList newsList) {
		return super.findPage(page, newsList);
	}
	
	@Transactional(readOnly = false)
	public void save(NewsList newsList) {
		super.save(newsList);
	}
	
	@Transactional(readOnly = false)
	public void delete(NewsList newsList) {
		super.delete(newsList);
	}

	public List<NewsList> getLatelyList(){
		return newsListDao.getLatelyList();
	}

	public NewsList getHotNews() {
		return newsListDao.getHotNews();
	}

	@Transactional(readOnly = false)
	public void updateRecommend() {
		newsListDao.updateRecommend();
	}

	public List<NewsList> getByNavId(NewsList newsList) {
	return 	newsListDao.getByNavId(newsList);
	}

	public NewsList getNewsDetail(NewsList news) {
		return newsListDao.getNewsDetail(news);
	}

    public NewsList getById(NewsList newsList) {
		return newsListDao.getById(newsList);
    }
}