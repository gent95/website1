/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jctl.cloud.webapp;

import com.jctl.cloud.common.persistence.Page;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.manager.navlist.NavList;
import com.jctl.cloud.manager.navlist.NavListService;
import com.jctl.cloud.manager.solution.Solution;
import com.jctl.cloud.manager.solution.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 解决方案Controller
 *
 * @author ll
 * @version 2016-12-20
 */
@Controller
@RequestMapping(value = "wapsolution")
public class WapSolutionController extends BaseController {

    @Autowired
    private SolutionService solutionService;
    @Autowired
    private NavListService navListService;

    /**
     * 文字
     * @return
     */
    @RequestMapping("/busnesRef")
    public String introduction(Model model,@RequestParam(required = false)String navId) {
        Solution solution=null;
        NavList navList=null;
        String type=null;
        int navids=Integer.parseInt(navId);
        if(navids>=126&&navids<=132){
            type="智慧农业";
        }
        if(navids>=133&&navids<=139){
            type="智慧园区";
        }
        if(navids>=140&&navids<=146){
            type="智慧社区";
        }
        if(StringUtils.isNoneBlank(navId)){
            Solution solution1=new Solution();
            NavList navList1=new NavList();
            navList1.setId(navId);
            solution1.setNavList(navList1);
            solution=solutionService.getSolutionByNavId(solution1);
        }
        model.addAttribute("solution",solution);
        model.addAttribute("type",type);
        return "/web/solution/busnesRef";
    }

        /**
     * 图文
     *
     * @param model
     * @return
     */
   @RequestMapping("/applicationCase")
    public String applicationCase(Model model,@RequestParam(required = false)String navId,Solution solution, HttpServletRequest request, HttpServletResponse response) {
       /* List<Solution> solution=null;
        Solution  sol=null;*/
        String type=null;
        int navids=Integer.parseInt(navId);
        if(navids>=126&&navids<=132){
            type="智慧农业";
        }
        if(navids>=133&&navids<=139){
            type="智慧园区";
        }
        if(navids>=140&&navids<=146){
            type="智慧社区";
        }
        if(StringUtils.isNoneBlank(navId)){
            NavList navList1=new NavList();
            navList1.setId(navId);
            solution.setNavList(navList1);
            Page<Solution> pageList=new Page<Solution>(request, response);
            pageList.setPageSize(4);
            Page<Solution> page = solutionService.findPage(pageList, solution);
            model.addAttribute("page", page);
        }
        model.addAttribute("type",type);
        return "/web/solution/Agriculture";
    }

    /*public String list(Solution solution, HttpServletRequest request, HttpServletResponse response, Model model,String navId) {
            NavList navList=new NavList();
            navList.setId(navId);
            solution.setNavList(navList);
        Page<Solution> page = solutionService.findPage(new Page<Solution>(request, response), solution);
        model.addAttribute("page", page);
        return "/modules/cms/front/themes/basic/solution/Agriculture";
    }*/

    /**
     * 图文详情
     *
     * @param model
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam(required = false)String id,@RequestParam(required = false)String name) {
      Solution solution=null;
        String type=null;
        if(StringUtils.isNoneBlank(name)){
            type=name;
        }
        if(StringUtils.isNoneBlank(id)){
            solution=solutionService.get(id);
        }
        model.addAttribute("solution",solution);
        model.addAttribute("type",type);



        return "/web/solution/busnesRef";
    }
}