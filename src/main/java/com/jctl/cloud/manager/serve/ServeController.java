/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.serve;

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
 * 服务Controller
 * @author msl
 * @version 2016-12-26
 */
@Controller
@RequestMapping(value = "${adminPath}/website/serve/serve")
public class ServeController extends BaseController {

	@Autowired
	private ServeService serveService;
	
	@ModelAttribute
	public Serve get(@RequestParam(required=false) String id) {
		Serve entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = serveService.get(id);
		}
		if (entity == null){
			entity = new Serve();
		}
		return entity;
	}
	
	@RequiresPermissions("website:serve:serve:view")
	@RequestMapping(value = {"list", ""})
	public String list(Serve serve, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Serve> page = serveService.findPage(new Page<Serve>(request, response), serve);
		model.addAttribute("page", page);
		return "manager/serve/serveList";
	}

	@RequiresPermissions("website:serve:serve:view")
	@RequestMapping(value = "form")
	public String form(Serve serve, Model model) {
		model.addAttribute("serve", serve);
		return "manager/serve/serveForm";
	}

	@RequiresPermissions("website:serve:serve:edit")
	@RequestMapping(value = "save")
	public String save(Serve serve, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, serve)){
			return form(serve, model);
		}
		serveService.save(serve);
		addMessage(redirectAttributes, "保存服务成功");
		return "redirect:"+ Global.getAdminPath()+"/website/serve/serve/?repage";
	}
	
	@RequiresPermissions("website:serve:serve:edit")
	@RequestMapping(value = "delete")
	public String delete(Serve serve, RedirectAttributes redirectAttributes) {
		serveService.delete(serve);
		addMessage(redirectAttributes, "删除服务成功");
		return "redirect:"+ Global.getAdminPath()+"/website/serve/serve/?repage";
	}
	@RequiresPermissions("website:serve:serve:view")
	@RequestMapping(value = "recommend")
	public String remoned(Serve serve,RedirectAttributes redirectAttributes){
		if(serve.getIsShow().equals(1)){
			serve.setIsShow("0");
			serveService.save(serve);
		}else if(serve.getIsShow().equals(0)){
			serve.setIsShow("1");
			serveService.save(serve);
		}
		return "manager/serve/serveList";
	}

}