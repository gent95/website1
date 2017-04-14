/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.webapp;

import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.manager.banner.Banner;
import com.jctl.cloud.manager.banner.BannerService;
import com.jctl.cloud.manager.navlist.NavList;
import com.jctl.cloud.manager.navlist.NavListService;
import com.jctl.cloud.manager.newslist.NewsList;
import com.jctl.cloud.manager.newslist.NewsListService;
import com.jctl.cloud.modules.cms.entity.Site;
import com.jctl.cloud.modules.cms.utils.CmsUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 网站Controller
 *
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontController extends BaseController {

    @Autowired
    private BannerService bannerService;
    @Autowired
    private NewsListService newsListService;
    @Autowired
    private NavListService navListService;

    private final static String[] agent = {"Android", "iPhone", "iPod", "iPad", "Windows Phone", "MQQBrowser"};


    /**
     * 网站首页
     */
    @RequestMapping("")
    public String index(Model model, HttpServletRequest request) {
        Site site = CmsUtils.getSite(Site.defaultSiteId());
        site.setTitle("集萃通联");
        //轮播  热点新闻  新闻
        List<NewsList> news = newsListService.getLatelyList();
        List<Banner> banner = bannerService.getBannerList();
        NewsList hotNews = newsListService.getHotNews();
        List<NavList> nav = navListService.getAllChild(navListService.getNavList());

        model.addAttribute("hotNews", hotNews);
        model.addAttribute("news", news);
        model.addAttribute("banner", banner);
        model.addAttribute("site", site);
        model.addAttribute("isIndex", true);
        return "web/home/frontIndex";
    }

    public static boolean checkAgentIsMobile(String ua) {
        boolean flag = false;
        // 排除 苹果桌面系统
        if (!ua.contains("Windows NT") || (ua.contains("Windows NT") && ua.contains("compatible; MSIE 9.0;"))) {
            if (!ua.contains("Windows NT") && !ua.contains("Macintosh")) {
                for (String item : agent) {
                    if (ua.contains(item)) {
                        flag = true;
                        break;
                    }
                }
            }
        }
        return flag;
    }


    public Set<NavList> getSecondLevel(List<NavList> list) {
        Set<NavList> res = new HashSet<NavList>();
        if (list == null) {
            return res;
        }
        for (NavList navList : list) {
            for (NavList nav : navList.getNodes()) {
                if (nav.getNodes().size() == 0) {
                    res.add(navList);
                }
            }
        }
        new HashMap();
        return res;
    }


    public Set<NavList> getThredLevel(List<NavList> list) {
        Set<NavList> res = new HashSet<NavList>();
        if (list == null) {
            return res;
        }
        for (NavList navList : list) {
            for (NavList nav : navList.getNodes()) {
                if (nav.getNodes().size() != 0) {
                    res.add(navList);
                }
            }
        }
        return res;
    }

    public static void main() {

    }

}
