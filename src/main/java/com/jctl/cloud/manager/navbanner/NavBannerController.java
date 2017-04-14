/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.navbanner;

import com.jctl.cloud.common.config.Global;
import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.Reflections;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 导航的轮播Controller
 *
 * @author 1
 * @version 2016-12-28
 */
@Controller
@RequestMapping(value = "${adminPath}/website/navbanner/navBanner")
public class NavBannerController extends BaseController {

    @Autowired
    private NavBannerService navBannerService;

    @ModelAttribute
    public NavBanner get(@RequestParam(required = false) String id) {
        NavBanner entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = navBannerService.get(id);
        }
        if (entity == null) {
            entity = new NavBanner();
        }
        return entity;
    }


    @RequestMapping("content")
    @ResponseBody
    public Map<String, Object> content(NavBanner banner) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            banner = navBannerService.getByNavId(banner);
            String[] propertys = new String[]{"id", "picPath", "navId"};
            if (banner != null) {
                for (String property : propertys) {
                    result.put(property, Reflections.invokeGetter(banner, property));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    @RequiresPermissions("website:navbanner:navBanner:view")
    @RequestMapping(value = {"list", ""})
    public String list(NavBanner navBanner, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<NavBanner> page = navBannerService.findPage(new Page<NavBanner>(request, response), navBanner);
        model.addAttribute("page", page);
        return "manager/navbanner/navBannerList";
    }

    @RequiresPermissions("website:navbanner:navBanner:view")
    @RequestMapping(value = "form")
    public String form(NavBanner navBanner, Model model) {
        model.addAttribute("navBanner", navBanner);
        return "manager/navbanner/navBannerForm";
    }

    @RequiresPermissions("website:navbanner:navBanner:edit")
    @RequestMapping(value = "save")
    public String save(NavBanner navBanner, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, navBanner)) {
            return form(navBanner, model);
        }
        navBannerService.save(navBanner);
        addMessage(redirectAttributes, "保存1成功");
        return "redirect:" + Global.getAdminPath() + "/website/navlist/navList/navBannerForm";

    }

    @RequiresPermissions("website:navbanner:navBanner:edit")
    @RequestMapping(value = "delete")
    public String delete(NavBanner navBanner, RedirectAttributes redirectAttributes) {
        navBannerService.delete(navBanner);
        addMessage(redirectAttributes, "删除1成功");
        return "redirect:" + Global.getAdminPath() + "/website/navbanner/navBanner/?repage";
    }

}