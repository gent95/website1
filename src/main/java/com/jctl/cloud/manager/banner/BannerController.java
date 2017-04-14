/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.manager.banner;

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
 * 轮播图Controller
 * @author kay
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/website/banner/banner")
public class BannerController extends BaseController {

	@Autowired
	private BannerService bannerService;
	
	@ModelAttribute
	public Banner get(@RequestParam(required=false) String id) {
		Banner entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = bannerService.get(id);
		}
		if (entity == null){
			entity = new Banner();
		}
		return entity;
	}
	
	@RequiresPermissions("website:banner:banner:view")
	@RequestMapping(value = {"list", ""})
	public String list(Banner banner, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Banner> page = bannerService.findPage(new Page<Banner>(request, response), banner);
		model.addAttribute("page", page);
		return "manager/banner/bannerList";
	}

	@RequiresPermissions("website:banner:banner:view")
	@RequestMapping(value = "form")
	public String form(Banner banner, Model model) {
		model.addAttribute("banner", banner);
		return "manager/banner/bannerForm";
	}

	@RequiresPermissions("website:banner:banner:edit")
	@RequestMapping(value = "save")
	public String save(Banner banner, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, banner)){
			return form(banner, model);
		}
		if(banner.getIsNewRecord()){
			banner.setAddTime(new Date());
		}
		bannerService.save(banner);
		addMessage(redirectAttributes, "保存轮播图成功");
		return "redirect:"+ Global.getAdminPath()+"/website/banner/banner/?repage";
	}
	
	@RequiresPermissions("website:banner:banner:edit")
	@RequestMapping(value = "delete")
	public String delete(Banner banner, RedirectAttributes redirectAttributes) {
		bannerService.delete(banner);
		addMessage(redirectAttributes, "删除轮播图成功");
		return "redirect:"+ Global.getAdminPath()+"/website/banner/banner/?repage";
	}


	/**
	 * 一键修改轮播状态
	 * @param banner
	 * @return
     */
	@RequestMapping("changeStatus")
	public String changeStatus(Banner banner){
		if(banner.getShowFlag().equals("0")){
			banner.setShowFlag("1");
		}else {
			banner.setShowFlag("0");
		}
		bannerService.save(banner);
		return "redirect:"+ Global.getAdminPath()+"/manager/banner/banner/?repage";
	}

}