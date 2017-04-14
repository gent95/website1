/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.banner;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

import java.util.List;


/**
 * 轮播图DAO接口
 *
 * @author kay
 * @version 2016-12-13
 */
@MyBatisDao
public interface BannerDao extends CrudDao<Banner> {

    void changeStatus(Banner banner);

    List<Banner> getBannerList();
}