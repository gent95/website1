/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/smartcity">smartcity</a> All rights reserved.
 */
package com.jctl.cloud.manager.joinus;

import com.jctl.cloud.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 招聘职位表Entity
 * @author ll
 * @version 2017-01-24
 */
public class JoinUs extends DataEntity<JoinUs> {
	
	private static final long serialVersionUID = 1L;
	private String position;		// 职位
	private String salary;		// 薪资
	private String suffer;		// 经验
	private String education;		// 学历
	private String nature;		// 工作性质
	private String postionStatement;		// 岗位职责
	private String qualification;		// 任职资格
	private Date createTime;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public JoinUs() {
		super();
	}

	public JoinUs(String id){
		super(id);
	}

	@Length(min=0, max=200, message="职位长度必须介于 0 和 200 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Length(min=0, max=100, message="薪资长度必须介于 0 和 100 之间")
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	@Length(min=0, max=100, message="经验长度必须介于 0 和 100 之间")
	public String getSuffer() {
		return suffer;
	}

	public void setSuffer(String suffer) {
		this.suffer = suffer;
	}
	
	@Length(min=0, max=20, message="学历长度必须介于 0 和 20 之间")
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	@Length(min=0, max=20, message="工作性质长度必须介于 0 和 20 之间")
	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}
	
	public String getPostionStatement() {
		return postionStatement;
	}

	public void setPostionStatement(String postionStatement) {
		this.postionStatement = postionStatement;
	}
	
	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	
}