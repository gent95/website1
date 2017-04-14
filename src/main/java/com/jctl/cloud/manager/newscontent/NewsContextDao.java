/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.newscontent;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;
import com.jctl.cloud.manager.newslist.NewsList;

import java.util.List;

/**
 * newsContentDAO接口
 * @author kay
 * @version 2016-12-13
 */
@MyBatisDao
public interface NewsContextDao extends CrudDao<NewsContext> {

    NewsContext getByNewsListId(Long newListId);

    void deleteByNewsId(Long newListId);

    List<NewsList> getLatelyList();
}