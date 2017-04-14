package com.jctl.cloud.webapp;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.manager.navbanner.NavBanner;
import com.jctl.cloud.manager.navbanner.NavBannerService;
import com.jctl.cloud.manager.navlist.NavList;
import com.jctl.cloud.manager.navlist.NavListService;
import com.jctl.cloud.manager.newscontent.NewsContext;
import com.jctl.cloud.manager.newscontent.NewsContextService;
import com.jctl.cloud.manager.newslist.NewsList;
import com.jctl.cloud.manager.newslist.NewsListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liukai on 2016/12/19 0019.
 */

@Controller()
@RequestMapping("wapNavList")
public class WapNavListController {

    @Autowired
    private NavListService navListService;
    @Autowired
    private NewsListService newsListService;
    @Autowired
    private NavBannerService navBannerService;
    @Autowired
    private NewsContextService newsContextService;

    /**
     * 异步获取导航栏
     *
     * @return
     */

    public List<NavList> list() {
        try {
            List<NavList> navList = navListService.getNavList();
            if (navList == null) {
                return null;
            }
            navList = navData(navList);
            return navList;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }


    /**
     * less to connect the MYSQL
     *@Exception if level more three ，will not support
     * @return map
     */
    @RequestMapping("list")
    @ResponseBody
    public List<NavList> getList( HttpServletRequest request) {
        List<NavList> result = new ArrayList<NavList>();
        List<NavList> navList = navListService.getAllList();
        if (navList == null) {
            return null;
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

    /**
     * 获取当前节点的所有子节点
     *
     * @param navList
     * @return
     */
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


    public String list(Model model) {
        List<NavList> navList = navListService.getNavList();
        List<NavList> secondNavList = null;
        List<NavList> threeNavList = null;
        if (secondNavList.size() != 0) {
            for (NavList n : navList) {
                secondNavList = navListService.getByParentId(n.getParentId());
                if (secondNavList.size() != 0) {
                    for (NavList nv : secondNavList) {
                        threeNavList = navListService.getByParentId(nv.getParentId());
                    }
                }
            }
        }
        model.addAttribute("navParentList", navList);
        model.addAttribute("secondNavList", secondNavList);
        model.addAttribute("threeNavList", threeNavList);

        return "/web/layouts/default";
    }


    /**
     * 获取导航列表值
     *
     * @param navLists
     * @return
     */
    private List<NavList> navData(List<NavList> navLists) {
        if (navLists != null) {
            for (NavList nav : navLists) {
                List<NavList> child = navListService.getByParentId(nav.getId());
                if (child != null) {
                    navData(child);
                    nav.setChild(child);
                } else {
                    nav.setChild(new ArrayList<NavList>());
                }
            }
        }
        return navLists;
    }

    /**
     * 获取新闻列表页
     *
     * @param newsList
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("newsList")
    public String newsList(NewsList newsList, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            if (newsList.getNavId() != null) {
                Page<NewsList> page = newsListService.findPage(new Page<NewsList>(request, response), newsList);
                List<NewsList> newsLists = getResultList(page.getList(), newsList.getNavId());
                List<NewsList> newsListShow = new ArrayList<NewsList>();
                for (NewsList ns : newsLists) {
                    NewsContext newsContext = newsContextService.getByNewsListId(Long.valueOf(ns.getId()));
                    if (newsContext != null) {
                        ns.setContextTitle(newsContext.getContextTitle());
                        newsListShow.add(ns);
                    }
                }
                NavBanner search = new NavBanner();
                search.setNavId(newsList.getNavId());
                NavBanner banner = navBannerService.getByNavId(search);
                NavList navList = navListService.get(newsList.getNavId().toString());
                model.addAttribute("news", newsListShow);
                model.addAttribute("navList", navList);
                model.addAttribute("banner", banner);
                model.addAttribute("page", page);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/web/news/newsList/newsList";
    }

    private List<NewsList> getResultList(List<NewsList> list, Long navId) {
        List<NewsList> result = new ArrayList<NewsList>();
        if (list != null && navId != null) {
            for (NewsList newsList : list) {
                if (newsList.getNavId() != null) {
                    if (newsList.getNavId().toString().equals(navId.toString())) {
                        result.add(newsList);
                    }
                }
            }
        }
        return result;
    }

}
