/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.cusemlandphne;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import com.jctl.cloud.manager.navlist.NavList;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 客户电话和邮箱管理Entity
 * @author mjt
 * @version 2016-12-26
 */
public class CusEmlAndPhe extends DataEntity<CusEmlAndPhe> {
	
	private static final long serialVersionUID = 1L;
	private NavList navList;		// 导航编号
	private String companyName;		// 公司地址
	private String webAddr;//公司网址
	private String email;		// 邮编
	private String phone;		// 电话
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private String picPath;		// 公司图片

	public String getWebAddr() {
		return webAddr;
	}

	public void setWebAddr(String webAddr) {
		this.webAddr = webAddr;
	}

	public CusEmlAndPhe() {
		super();
	}

	public CusEmlAndPhe(String id){
		super(id);
	}

	public NavList getNavList() {
		return navList;
	}

	public void setNavList(NavList navList) {
		this.navList = navList;
	}

	@Length(min=0, max=255, message="公司名称长度必须介于 0 和 255 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=0, max=255, message="邮箱长度必须介于 0 和 255 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Long getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(Long addUserId) {
		this.addUserId = addUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=500, message="公司图片长度必须介于 0 和 500 之间")
	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	
}