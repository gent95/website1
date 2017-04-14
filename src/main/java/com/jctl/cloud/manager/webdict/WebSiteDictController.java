/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.webdict;

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
 * 字典Controller
 * @author kay
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/website/webdict/webSiteDict")
public class WebSiteDictController extends BaseController {

	@Autowired
	private WebSiteDictService webSiteDictService;
	
	@ModelAttribute
	public WebSiteDict get(@RequestParam(required=false) String id) {
		WebSiteDict entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = webSiteDictService.get(id);
		}
		if (entity == null){
			entity = new WebSiteDict();
		}
		return entity;
	}
	
	@RequiresPermissions("website:webdict:webSiteDict:view")
	@RequestMapping(value = {"list", ""})
	public String list(WebSiteDict webSiteDict, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WebSiteDict> page = webSiteDictService.findPage(new Page<WebSiteDict>(request, response), webSiteDict);
		model.addAttribute("page", page);
		return "manager/webdict/webSiteDictList";
	}

	@RequiresPermissions("website:webdict:webSiteDict:view")
	@RequestMapping(value = "form")
	public String form(WebSiteDict webSiteDict, Model model) {
		model.addAttribute("webSiteDict", webSiteDict);
		return "manager/webdict/webSiteDictForm";
	}

	@RequiresPermissions("website:webdict:webSiteDict:edit")
	@RequestMapping(value = "save")
	public String save(WebSiteDict webSiteDict, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, webSiteDict)){
			return form(webSiteDict, model);
		}
		if(webSiteDict.getIsNewRecord()){
			webSiteDict.setAddTime(new Date());
		}else {
			webSiteDict.setUpdateTime(new Date());
		}
		webSiteDictService.save(webSiteDict);
		addMessage(redirectAttributes, "保存字典参数成功");
		return "redirect:"+ Global.getAdminPath()+"/website/webdict/webSiteDict/?repage";
	}
	
	@RequiresPermissions("website:webdict:webSiteDict:edit")
	@RequestMapping(value = "delete")
	public String delete(WebSiteDict webSiteDict, RedirectAttributes redirectAttributes) {
		webSiteDictService.delete(webSiteDict);
		addMessage(redirectAttributes, "删除字典参数成功");
		return "redirect:"+ Global.getAdminPath()+"/website/webdict/webSiteDict/?repage";
	}

}