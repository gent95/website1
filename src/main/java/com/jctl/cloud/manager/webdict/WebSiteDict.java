/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.webdict;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 字典Entity
 * @author kay
 * @version 2016-12-13
 */
public class WebSiteDict extends DataEntity<WebSiteDict> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String keyValue;		// 键
	private String lockValue;		// 值
	private Long orderNum;		// 排序
	private String status;		// 删除标价 0未启用 1启用
	private Long addUserId;		// 添加人
	private Date addTime;		// 添加时间
	private Long updateUserId;		// 修改人
	private Date updateTime;		// 修改时间
	private String remark;		// 备注
	
	public WebSiteDict() {
		super();
	}

	public WebSiteDict(String id){
		super(id);
	}

	@Length(min=0, max=255, message="名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="键长度必须介于 0 和 100 之间")
	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	
	@Length(min=0, max=100, message="值长度必须介于 0 和 100 之间")
	public String getLockValue() {
		return lockValue;
	}

	public void setLockValue(String lockValue) {
		this.lockValue = lockValue;
	}
	
	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	
	@Length(min=0, max=2, message="删除标价 0未启用 1启用长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	
	@Length(min=0, max=255, message="备注长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}