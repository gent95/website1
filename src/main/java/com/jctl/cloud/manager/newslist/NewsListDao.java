/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.newslist;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 新闻列表DAO接口
 * @author kay
 * @version 2016-12-13
 */
@MyBatisDao
public interface NewsListDao extends CrudDao<NewsList> {

    List<NewsList> getLatelyList();

    NewsList getHotNews();

    void updateRecommend();

    List<NewsList> getByNavId(NewsList newsList);

    NewsList getNewsDetail(NewsList news);

    NewsList getById(NewsList newsList);
}