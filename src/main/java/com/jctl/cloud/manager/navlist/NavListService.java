package com.jctl.cloud.manager.navlist;

import com.jctl.cloud.common.service.TreeService;
import com.jctl.cloud.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 导航Service
 *
 * @author kay
 * @version 2016-12-13
 */

@Service
@Transactional(readOnly = true)
public class NavListService extends TreeService<NavListDao, NavList> {

    @Autowired
    private NavListDao navListDao;

    public NavList get(String id) {
        return super.get(id);
    }

    public List<NavList> findList(NavList navList) {
        if (StringUtils.isNotBlank(navList.getParentIds())) {
            navList.setParentIds("," + navList.getParentIds() + ",");
        }
        return super.findList(navList);
    }

    @Transactional(readOnly = false)
    public void save(NavList navList) {
        super.save(navList);
    }

    @Transactional(readOnly = false)
    public void delete(NavList navList) {
        super.delete(navList);
    }

    public List<NavList> getNavList() {
        return navListDao.getNavList();
    }

    public List getByParentId(String id) {
        return navListDao.getByParentId(id);
    }

    public List<NavList> getAllChild(List<NavList> result) {
        for (NavList nav : result) {
            List<NavList> child = getByParentId(nav.getId());
            if (child != null) {
                nav.setNodes(child);
                getAllChild(child);
            }
        }

        if(result == null){
            throw new NullPointerException("结果集为空");
         }
        return result;
    }

    public List<NavList> getAllList() {
        return navListDao.getAllList();
    }
}