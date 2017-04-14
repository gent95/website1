/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.joinus;

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
import java.util.Date;

/**
 * 招聘职位表Controller
 * @author ll
 * @version 2017-01-24
 */
@Controller
@RequestMapping(value = "${adminPath}/website/joinus/joinUs")
public class JoinUsController extends BaseController {

	@Autowired
	private JoinUsService joinUsService;
	
	@ModelAttribute
	public JoinUs get(@RequestParam(required=false) String id) {
		JoinUs entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = joinUsService.get(id);
		}
		if (entity == null){
			entity = new JoinUs();
		}
		return entity;
	}
	
	@RequiresPermissions("website:joinus:joinUs:view")
	@RequestMapping(value = {"list", ""})
	public String list(JoinUs joinUs, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JoinUs> page = joinUsService.findPage(new Page<JoinUs>(request, response), joinUs);
		model.addAttribute("page", page);
		return "manager/joinus/joinUsList";
	}

	@RequiresPermissions("website:joinus:joinUs:view")
	@RequestMapping(value = "form")
	public String form(JoinUs joinUs, Model model) {
		model.addAttribute("joinUs", joinUs);
		return "manager/joinus/joinUsForm";
	}

	@RequiresPermissions("website:joinus:joinUs:edit")
	@RequestMapping(value = "save")
	public String save(JoinUs joinUs, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, joinUs)){
			return form(joinUs, model);
		}
		if(joinUs.getCreateTime()==null){
			joinUs.setCreateTime(new Date());
		}
		joinUsService.save(joinUs);
		addMessage(redirectAttributes, "保存招聘职位成功");
		return "redirect:"+ Global.getAdminPath()+"/website/joinus/joinUs/?repage";
	}
	
	@RequiresPermissions("website:joinus:joinUs:edit")
	@RequestMapping(value = "delete")
	public String delete(JoinUs joinUs, RedirectAttributes redirectAttributes) {
		joinUsService.delete(joinUs);
		addMessage(redirectAttributes, "删除招聘职位成功");
		return "redirect:"+ Global.getAdminPath()+"/website/joinus/joinUs/?repage";
	}

}