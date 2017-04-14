/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.navbanner;

import com.jctl.cloud.common.persistence.CrudDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

/**
 * 导航的轮播DAO接口
 * @author 1
 * @version 2016-12-28
 */
@MyBatisDao
public interface NavBannerDao extends CrudDao<NavBanner> {

    NavBanner getByNavId(NavBanner banner);
}