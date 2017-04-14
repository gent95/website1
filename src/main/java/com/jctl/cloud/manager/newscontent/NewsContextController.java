/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.newscontent;

import com.jctl.cloud.common.config.Global;
import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * newsContentController
 *
 * @author kay
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/website/newscontent/newsContext")
public class NewsContextController extends BaseController {

    @Autowired
    private NewsContextService newsContextService;

    @ModelAttribute
    public NewsContext get(@RequestParam(required = false) String id) {
        NewsContext entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = newsContextService.get(id);
        }
        if (entity == null) {
            entity = new NewsContext();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(NewsContext newsContext, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<NewsContext> page = newsContextService.findPage(new Page<NewsContext>(request, response), newsContext);
        model.addAttribute("page", page);
        return "manager/newscontent/newsContextList";
    }

    @RequestMapping(value = "form")
    public String form(NewsContext newsContext, Model model) {
        NewsContext temp = newsContext;
        newsContext = newsContextService.getByNewsListId(newsContext.getNewListId());
        if(newsContext != null){
            model.addAttribute("newsContext", newsContext);
        }else {
            model.addAttribute("newsContext", temp);
        }
        return "manager/newscontent/newsContextForm";
    }

    @RequestMapping(value = "save")
    public String save(NewsContext newsContext, Model model, RedirectAttributes redirectAttributes) {
        try{
            if (!beanValidator(model, newsContext)) {
                return form(newsContext, model);
            }
            newsContextService.save(newsContext);
            addMessage(redirectAttributes, "保存新闻成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/website/newslist/newsList";
    }

    @RequestMapping(value = "delete")
    public String delete(NewsContext newsContext, RedirectAttributes redirectAttributes) {
        newsContextService.delete(newsContext);
        addMessage(redirectAttributes, "删除新闻成功");
        return "redirect:" + Global.getAdminPath() + "/website/newscontent/newsContext/?repage";
    }

}