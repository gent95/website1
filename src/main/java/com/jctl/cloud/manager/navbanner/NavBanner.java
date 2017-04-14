/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.navbanner;

import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 导航的轮播Entity
 * @author 1
 * @version 2016-12-28
 */
public class NavBanner extends DataEntity<NavBanner> {
	
	private static final long serialVersionUID = 1L;
	private String picPath;		// 轮播图
	private Long navId;		// 导航表
	
	public NavBanner() {
		super();
	}

	public NavBanner(String id){
		super(id);
	}

	@Length(min=1, max=255, message="轮播图长度必须介于 1 和 255 之间")
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
	@NotNull(message="导航表不能为空")
	public Long getNavId() {
		return navId;
	}

	public void setNavId(Long navId) {
		this.navId = navId;
	}
	
}