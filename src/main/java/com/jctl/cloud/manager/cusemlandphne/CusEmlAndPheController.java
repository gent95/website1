/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.cusemlandphne;

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
 * 客户电话和邮箱管理Controller
 * @author mjt
 * @version 2016-12-26
 */
@Controller
@RequestMapping(value = "${adminPath}/website/cusemlandphne/cusEmlAndPhe")
public class CusEmlAndPheController extends BaseController {

	@Autowired
	private CusEmlAndPheService cusEmlAndPheService;
	
	@ModelAttribute
	public CusEmlAndPhe get(@RequestParam(required=false) String id) {
		CusEmlAndPhe entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cusEmlAndPheService.get(id);
		}
		if (entity == null){
			entity = new CusEmlAndPhe();
		}
		return entity;
	}
	
	@RequiresPermissions("website:cusemlandphne:cusEmlAndPhe:view")
	@RequestMapping(value = {"list", ""})
	public String list(CusEmlAndPhe cusEmlAndPhe, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CusEmlAndPhe> page = cusEmlAndPheService.findPage(new Page<CusEmlAndPhe>(request, response), cusEmlAndPhe);
		model.addAttribute("page", page);
		return "manager/cusemlandphne/cusEmlAndPheList";
	}

	@RequiresPermissions("website:cusemlandphne:cusEmlAndPhe:view")
	@RequestMapping(value = "form")
	public String form(CusEmlAndPhe cusEmlAndPhe, Model model) {
		model.addAttribute("cusEmlAndPhe", cusEmlAndPhe);
		return "manager/cusemlandphne/cusEmlAndPheForm";
	}

	@RequiresPermissions("website:cusemlandphne:cusEmlAndPhe:edit")
	@RequestMapping(value = "save")
	public String save(CusEmlAndPhe cusEmlAndPhe, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cusEmlAndPhe)){
			return form(cusEmlAndPhe, model);
		}
		cusEmlAndPheService.save(cusEmlAndPhe);
		addMessage(redirectAttributes, "保存客户电话和邮箱管理成功");
		return "redirect:"+ Global.getAdminPath()+"/website/cusemlandphne/cusEmlAndPhe/?repage";
	}
	
	@RequiresPermissions("website:cusemlandphne:cusEmlAndPhe:edit")
	@RequestMapping(value = "delete")
	public String delete(CusEmlAndPhe cusEmlAndPhe, RedirectAttributes redirectAttributes) {
		cusEmlAndPheService.delete(cusEmlAndPhe);
		addMessage(redirectAttributes, "删除客户电话和邮箱管理成功");
		return "redirect:"+ Global.getAdminPath()+"/website/cusemlandphne/cusEmlAndPhe/?repage";
	}

}