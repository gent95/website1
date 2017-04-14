/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.problem;

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
 * 问题提交Controller
 * @author mjt
 * @version 2016-12-22
 */
@Controller
@RequestMapping(value = "${adminPath}/website/problem/problemPost")
public class ProblemPostController extends BaseController {

	@Autowired
	private ProblemPostService problemPostService;
	
	@ModelAttribute
	public ProblemPost get(@RequestParam(required=false) String id) {
		ProblemPost entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = problemPostService.get(id);
		}
		if (entity == null){
			entity = new ProblemPost();
		}
		return entity;
	}
	
	@RequiresPermissions("website:problem:problemPost:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProblemPost problemPost, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProblemPost> page = problemPostService.findPage(new Page<ProblemPost>(request, response), problemPost);
		model.addAttribute("page", page);
		return "manager/problem/problemPostList";
	}

	@RequiresPermissions("website:problem:problemPost:view")
	@RequestMapping(value = "form")
	public String form(ProblemPost problemPost, Model model) {
		model.addAttribute("problemPost", problemPost);
		return "manager/problem/problemPostForm";
	}

	@RequiresPermissions("website:problem:problemPost:edit")
	@RequestMapping(value = "save")
	public String save(ProblemPost problemPost, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, problemPost)){
			return form(problemPost, model);
		}
		problemPostService.save(problemPost);
		addMessage(redirectAttributes, "保存问题提交成功");
		return "redirect:"+ Global.getAdminPath()+"/website/problem/problemPost/?repage";
	}
	
	@RequiresPermissions("website:problem:problemPost:edit")
	@RequestMapping(value = "delete")
	public String delete(ProblemPost problemPost, RedirectAttributes redirectAttributes) {
		problemPostService.delete(problemPost);
		addMessage(redirectAttributes, "删除问题提交成功");
		return "redirect:"+ Global.getAdminPath()+"/website/problem/problemPost/?repage";
	}

}