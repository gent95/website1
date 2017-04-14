package com.jctl.cloud.manager.navlist;

import com.jctl.cloud.common.persistence.TreeDao;
import com.jctl.cloud.common.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 导航DAO接口
 * @author kay
 * @version 2016-12-13
 */
@MyBatisDao
public interface NavListDao extends TreeDao<NavList> {

    List<NavList> getNavList();

    List getByParentId(String id);

    List<NavList> getAllList();
}