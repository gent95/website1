/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.web.lightlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.modules.light.entity.lightlist.LightList;
import com.jctl.cloud.modules.light.service.lightlist.LightListService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jctl.cloud.common.config.Global;

/**
 * 灯具列表Controller
 * @author kay
 * @version 2016-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/light/lightlist/lightList")
public class LightListController extends BaseController {

	@Autowired
	private LightListService lightListService;
	
	@ModelAttribute
	public LightList get(@RequestParam(required=false) String id) {
		LightList entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = lightListService.get(id);
		}
		if (entity == null){
			entity = new LightList();
		}
		return entity;
	}
	
	@RequiresPermissions("light:lightlist:lightList:view")
	@RequestMapping(value = {"list", ""})
	public String list(LightList lightList, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LightList> page = lightListService.findPage(new Page<LightList>(request, response), lightList);
		model.addAttribute("page", page);
		return "modules/light/lightlist/lightListList";
	}

	@RequiresPermissions("light:lightlist:lightList:view")
	@RequestMapping(value = "form")
	public String form(LightList lightList, Model model) {
		model.addAttribute("lightList", lightList);
		return "modules/light/lightlist/lightListForm";
	}

	@RequiresPermissions("light:lightlist:lightList:edit")
	@RequestMapping(value = "save")
	public String save(LightList lightList, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lightList)){
			return form(lightList, model);
		}
		lightListService.save(lightList);
		addMessage(redirectAttributes, "保存灯具成功");
		return "redirect:"+Global.getAdminPath()+"/light/lightlist/lightList/?repage";
	}
	
	@RequiresPermissions("light:lightlist:lightList:edit")
	@RequestMapping(value = "delete")
	public String delete(LightList lightList, RedirectAttributes redirectAttributes) {
		lightListService.delete(lightList);
		addMessage(redirectAttributes, "删除灯具成功");
		return "redirect:"+Global.getAdminPath()+"/light/lightlist/lightList/?repage";
	}

}