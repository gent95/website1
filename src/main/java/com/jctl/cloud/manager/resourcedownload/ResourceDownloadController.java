/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.resourcedownload;

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
 * 资源下载Controller
 * @author mjt
 * @version 2016-12-26
 */
@Controller
@RequestMapping(value = "${adminPath}/website/resourcedownload/resourceDownload")
public class ResourceDownloadController extends BaseController {

	@Autowired
	private ResourceDownloadService resourceDownloadService;
	
	@ModelAttribute
	public ResourceDownload get(@RequestParam(required=false) String id) {
		ResourceDownload entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = resourceDownloadService.get(id);
		}
		if (entity == null){
			entity = new ResourceDownload();
		}
		return entity;
	}
	
	@RequiresPermissions("website:resourcedownload:resourceDownload:view")
	@RequestMapping(value = {"list", ""})
	public String list(ResourceDownload resourceDownload, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ResourceDownload> page = resourceDownloadService.findPage(new Page<ResourceDownload>(request, response), resourceDownload);
		model.addAttribute("page", page);
		return "manager/resourcedownload/resourceDownloadList";
	}

	@RequiresPermissions("website:resourcedownload:resourceDownload:view")
	@RequestMapping(value = "form")
	public String form(ResourceDownload resourceDownload, Model model) {
		model.addAttribute("resourceDownload", resourceDownload);
		return "manager/resourcedownload/resourceDownloadForm";
	}

	@RequiresPermissions("website:resourcedownload:resourceDownload:edit")
	@RequestMapping(value = "save")
	public String save(ResourceDownload resourceDownload, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, resourceDownload)){
			return form(resourceDownload, model);
		}
		resourceDownloadService.save(resourceDownload);
		addMessage(redirectAttributes, "保存资源下载成功");
		return "redirect:"+ Global.getAdminPath()+"/website/resourcedownload/resourceDownload/?repage";
	}
	
	@RequiresPermissions("website:resourcedownload:resourceDownload:edit")
	@RequestMapping(value = "delete")
	public String delete(ResourceDownload resourceDownload, RedirectAttributes redirectAttributes) {
		resourceDownloadService.delete(resourceDownload);
		addMessage(redirectAttributes, "删除资源下载成功");
		return "redirect:"+ Global.getAdminPath()+"/website/resourcedownload/resourceDownload/?repage";
	}

}