/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.modules.light.entity.antiequipment;

import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 防盗设备Entity
 * @author kay
 * @version 2016-11-11
 */
public class AntiEquipment extends DataEntity<AntiEquipment> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private Long road;		// 路段
	private Long distributionBox;		// 配电柜
	private Long cableNum;		// 线缆编号
	private String defenseState;		// 布防/撒防状态
	private Long admin;		// 管理员
	private Date addTime;		// addtime
	private Long addUserId;		// adduserid
	private Date updateTime;		// updatetime
	private Long updateUserId;		// updateuserid
	
	public AntiEquipment() {
		super();
	}

	public AntiEquipment(String id){
		super(id);
	}

	@Length(min=0, max=32, message="名称长度必须介于 0 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Long getRoad() {
		return road;
	}

	public void setRoad(Long road) {
		this.road = road;
	}
	
	public Long getDistributionBox() {
		return distributionBox;
	}

	public void setDistributionBox(Long distributionBox) {
		this.distributionBox = distributionBox;
	}
	
	public Long getCableNum() {
		return cableNum;
	}

	public void setCableNum(Long cableNum) {
		this.cableNum = cableNum;
	}
	
	@Length(min=0, max=2, message="布防/撒防状态长度必须介于 0 和 2 之间")
	public String getDefenseState() {
		return defenseState;
	}

	public void setDefenseState(String defenseState) {
		this.defenseState = defenseState;
	}
	
	public Long getAdmin() {
		return admin;
	}

	public void setAdmin(Long admin) {
		this.admin = admin;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	public Long getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(Long addUserId) {
		this.addUserId = addUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	
}