/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.newslist;

import com.jctl.cloud.common.config.Global;
import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.manager.navlist.NavList;
import com.jctl.cloud.manager.navlist.NavListService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 新闻列表Controller
 *
 * @author kay
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/website/newslist/newsList")
public class NewsListController extends BaseController {

    @Autowired
    private NewsListService newsListService;

    @Autowired
    private NavListService navListService;


    @ModelAttribute
    public NewsList get(@RequestParam(required = false) String id) {
        NewsList entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = newsListService.get(id);
        }
        if (entity == null) {
            entity = new NewsList();
        }
        return entity;
    }

    @RequiresPermissions("website:newslist:newsList:view")
    @RequestMapping(value = {"list", ""})
    public String list(NewsList newsList, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<NewsList> page = newsListService.findPage(new Page<NewsList>(request, response), newsList);
            List<NewsList> list = page.getList();
            for (NewsList news : list) {
                news.setNavName(navListService.get(news.getNavId().toString()).getName());
            }
            page.setList(list);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/newslist/newsListList";
    }

    @RequiresPermissions("website:newslist:newsList:view")
    @RequestMapping(value = "form")
    public String form(NewsList newsList, Model model) {
        try {
            NavList navList = navListService.get(newsList.getNavId().toString());
            newsList.setNavName(navList.getName());
            model.addAttribute("newsList", newsList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "manager/newslist/newsListForm";
    }

    @RequiresPermissions("website:newslist:newsList:edit")
    @RequestMapping(value = "save")
    public String save(NewsList newsList, Model model, RedirectAttributes redirectAttributes) {
        try {
            if (!beanValidator(model, newsList)) {
                return form(newsList, model);
            }
            if (newsList.getIsNewRecord()) {
                newsList.setAddTime(new Date());
            } else {
                newsList.setUpdateTime(new Date());
            }
            newsListService.save(newsList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        addMessage(redirectAttributes, "保存列表成功");
        return "redirect:" + Global.getAdminPath() + "/website/newslist/newsList/?repage";
    }

    @RequiresPermissions("website:newslist:newsList:edit")
    @RequestMapping(value = "delete")
    public String delete(NewsList newsList, RedirectAttributes redirectAttributes) {
        newsListService.delete(newsList);
        addMessage(redirectAttributes, "删除列表成功");
        return "redirect:" + Global.getAdminPath() + "/website/newslist/newsList/?repage";
    }

    @RequiresPermissions("website:newslist:newsList:edit")
    @RequestMapping(value = "recommend")
    public String recommend(NewsList newsList, RedirectAttributes redirectAttributes) {
        try {
            newsList = newsListService.get(newsList.getId());
            if (newsList.getRecommend().equals("0")) {
                newsList.setRecommend("1");
            } else {
                newsList.setRecommend("0");
            }
            newsListService.updateRecommend();
            newsListService.save(newsList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        addMessage(redirectAttributes, "修改成功");
        return "redirect:" + Global.getAdminPath() + "/website/newslist/newsList/?repage";
    }

}