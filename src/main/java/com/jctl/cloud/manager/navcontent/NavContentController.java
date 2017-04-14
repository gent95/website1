/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.navcontent;

import com.jctl.cloud.common.config.Global;
import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
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

/**
 * 新闻Controller
 * @author kay
 * @version 2016-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/website/navcontent/navContent")
public class NavContentController extends BaseController {

	@Autowired
	private NavContentService navContentService;
	
	@ModelAttribute
	public NavContent get(@RequestParam(required=false) String id) {
		NavContent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = navContentService.get(id);
		}
		if (entity == null){
			entity = new NavContent();
		}
		return entity;
	}
	
	@RequiresPermissions("website:navcontent:navContent:view")
	@RequestMapping(value = {"list", ""})
	public String list(NavContent navContent, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<NavContent> page = navContentService.findPage(new Page<NavContent>(request, response), navContent);
		model.addAttribute("page", page);
		return "manager/navcontent/navContentList";
	}

	@RequiresPermissions("website:navcontent:navContent:view")
	@RequestMapping(value = "form")
	public String form(NavContent navContent, Model model) {
		model.addAttribute("navContent", navContent);
		return "manager/navcontent/navContentForm";
	}

	@RequiresPermissions("website:navcontent:navContent:edit")
	@RequestMapping(value = "save")
	public String save(NavContent navContent, Model model, RedirectAttributes redirectAttributes) {
		System.out.print(111111);

		if (!beanValidator(model, navContent)){
			return form(navContent, model);
		}
		navContentService.save(navContent);
		addMessage(redirectAttributes, "保存新闻成功");
		return "redirect:"+ Global.getAdminPath()+"/website/navcontent/navContent/?repage";
	}
	
	@RequiresPermissions("website:navcontent:navContent:edit")
	@RequestMapping(value = "delete")
	public String delete(NavContent navContent, RedirectAttributes redirectAttributes) {
		navContentService.delete(navContent);
		addMessage(redirectAttributes, "删除新闻成功");
		return "redirect:"+ Global.getAdminPath()+"/website/navcontent/navContent/?repage";
	}

}