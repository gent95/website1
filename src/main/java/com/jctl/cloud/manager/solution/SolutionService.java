/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/jctl/station">station</a> All rights reserved.
 */
package com.jctl.cloud.manager.solution;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 解决方案Service
 * @author ll
 * @version 2016-12-20
 */
@Service
@Transactional(readOnly = true)
public class SolutionService extends CrudService<SolutionDao, Solution> {
	@Autowired
	private  SolutionDao solutionDao;
	public Solution get(String id) {
		return super.get(id);
	}
	
	public List<Solution> findList(Solution solution) {
		return super.findList(solution);
	}
	public Solution getSolutionByNavId(Solution navId){return solutionDao.getSolutionByNavId(navId);}
	/*public List<Solution> getListByNavId(Solution navId){return solutionDao.getListByNavId(navId);}*/
	//public Page<Solution> getListByNavId(Page<Solution> page, Solution solution){return super.findManagerPage(page,solution);}
	public Page<Solution> findPage(Page<Solution> page, Solution solution) {
		return super.findPage(page, solution);
	}
	
	@Transactional(readOnly = false)
	public void save(Solution solution) {
		super.save(solution);
	}
	
	@Transactional(readOnly = false)
	public void delete(Solution solution) {
		super.delete(solution);
	}
	
}