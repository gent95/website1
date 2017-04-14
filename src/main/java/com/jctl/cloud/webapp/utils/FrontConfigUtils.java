package com.jctl.cloud.webapp.utils;

import com.jctl.cloud.common.utils.SpringContextHolder;
import com.jctl.cloud.manager.navlist.NavList;
import com.jctl.cloud.manager.navlist.NavListService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 刘凯 on 2017/4/13.
 */
public class FrontConfigUtils {



    private static NavListService navListService = SpringContextHolder.getBean(NavListService.class);

    /**
     * 获取前台导航内容
     * @return
     */
    public static List<NavList> getNavList(){
        List<NavList> result = new ArrayList<>();
        List<NavList> navList = navListService.findList(new NavList());
        if (navList == null) {
            return new ArrayList<>();
        }
        //循环出一级节点
        for (NavList nav : navList) {
            if (nav.getParentId().equals("0")) {
                List<NavList> towLevel =getChildList(nav, navList);
                for(NavList navList1:towLevel){
                    List<NavList> threeLevel =getChildList(navList1, navList);
                    navList1.setChild(threeLevel);
                }
                nav.setChild(towLevel);
                result.add(nav);
            }
        }
        return result;
    }


    private static List<NavList> getChildList(NavList navList, List<NavList> lists) {
        List<NavList> result = new ArrayList<NavList>();
        String id = navList.getId();
        for (NavList nav : lists) {
            if (id.equals(nav.getParentId())) {
                result.add(nav);
            }
        }
        return result;
    }

    public static void main(String[] args){
        System.out.print(getNavList());
    }
}
