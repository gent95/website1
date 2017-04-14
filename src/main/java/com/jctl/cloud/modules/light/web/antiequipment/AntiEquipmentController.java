/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.web.antiequipment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.modules.light.entity.antiequipment.AntiEquipment;
import com.jctl.cloud.modules.light.service.antiequipment.AntiEquipmentService;
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
 * 防盗设备Controller
 * @author kay
 * @version 2016-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/light/antiequipment/antiEquipment")
public class AntiEquipmentController extends BaseController {

	@Autowired
	private AntiEquipmentService antiEquipmentService;
	
	@ModelAttribute
	public AntiEquipment get(@RequestParam(required=false) String id) {
		AntiEquipment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = antiEquipmentService.get(id);
		}
		if (entity == null){
			entity = new AntiEquipment();
		}
		return entity;
	}
	
	@RequiresPermissions("light:antiequipment:antiEquipment:view")
	@RequestMapping(value = {"list", ""})
	public String list(AntiEquipment antiEquipment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AntiEquipment> page = antiEquipmentService.findPage(new Page<AntiEquipment>(request, response), antiEquipment);
		model.addAttribute("page", page);
		return "modules/light/antiequipment/antiEquipmentList";
	}

	@RequiresPermissions("light:antiequipment:antiEquipment:view")
	@RequestMapping(value = "form")
	public String form(AntiEquipment antiEquipment, Model model) {
		model.addAttribute("antiEquipment", antiEquipment);
		return "modules/light/antiequipment/antiEquipmentForm";
	}

	@RequiresPermissions("light:antiequipment:antiEquipment:edit")
	@RequestMapping(value = "save")
	public String save(AntiEquipment antiEquipment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, antiEquipment)){
			return form(antiEquipment, model);
		}
		antiEquipmentService.save(antiEquipment);
		addMessage(redirectAttributes, "保存防盗设备成功");
		return "redirect:"+Global.getAdminPath()+"/light/antiequipment/antiEquipment/?repage";
	}
	
	@RequiresPermissions("light:antiequipment:antiEquipment:edit")
	@RequestMapping(value = "delete")
	public String delete(AntiEquipment antiEquipment, RedirectAttributes redirectAttributes) {
		antiEquipmentService.delete(antiEquipment);
		addMessage(redirectAttributes, "删除防盗设备成功");
		return "redirect:"+Global.getAdminPath()+"/light/antiequipment/antiEquipment/?repage";
	}

}