package com.jctl.cloud.webapp;

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

import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * 首页内跳转控制
 * Created by Administrator on 2016/12/19 0019.
 */
@Controller
@RequestMapping("wapIndex")
public class WapIndexController {

    @Autowired
    private BannerService bannerService;

    @Autowired
    private NewsListService newsListService;

    @Autowired
    private NavListService navListService;


    /**
     * 手机端网站首页
     */
    @RequestMapping("")
    public String index() {
        return "web/home/index";
    }

    /**
     * 法律声明
     *
     * @return
     */
    @RequestMapping("/privacy")
    public String privacy() {
        return "web/privacy/privacy_protection";
    }

    /**
     * 隐私保护
     *
     * @return
     */
    @RequestMapping("/legal")
    private String leagl() {
        return "web/legal/legal";
    }


    @RequestMapping("test")
    public String test(Model model) {

        Site site = CmsUtils.getSite(Site.defaultSiteId());
        site.setTitle("集萃通联");
        //轮播  热点新闻  新闻
        List<NewsList> news = newsListService.getLatelyList();
        List<Banner> banner = bannerService.getBannerList();
        NewsList hotNews = newsListService.getHotNews();
        List<NavList> nav = navListService.getAllChild(navListService.getNavList());
        model.addAttribute("nav", nav);
        model.addAttribute("secNav", getSecondLevel(nav));
        model.addAttribute("thrNav", getThirdLevel(nav));
        model.addAttribute("hotNews", hotNews);
        model.addAttribute("news", news);
        model.addAttribute("banner", banner);
        model.addAttribute("site", site);
        model.addAttribute("isIndex", true);
        return "web/test/index";
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
        return res;
    }


    public Set<NavList> getThirdLevel(List<NavList> list) {
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

}
