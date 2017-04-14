package com.jctl.cloud.webapp;

import com.jctl.cloud.manager.solution.Solution;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/20.
 */
@Controller
@RequestMapping("/wappartner")
public class WapPartnerController {
    /**
     * 渠道伙伴
     * @return
     */
    @RequestMapping("/partner")
    public String partner() {
        return "/web/partner/partner";
    }

    /**
     * 企业业务解决方案伙伴计划
     *
     * @param model
     * @return
     */
    @RequestMapping("/businessPlan")
    public String businessPlan(Model model, Solution solution) {
        return "/web/partner/business_plan";
    }

    /**
     * 技术认证
     *
     * @param model
     * @return
     */
    @RequestMapping("/technical")
    public String technical(Model model, Solution solution) {
        return "/web/partner/technical";
    }

    /**
     * 渠道伙伴政策
     *
     * @param model
     * @returplan_deploy.jspn
     */
    @RequestMapping("/policy")
    public String policy(Model model, Solution solution) {
        return "/web/partner/policy";
    }

    /**
     * 合作伙伴大学
     *
     * @param model
     * @return
     */
    @RequestMapping("/partnerCollge")
    public String partnerCollge(Model model, Solution solution) {
        return "/web/partner/partner_college";
    }

    /**
     * 联盟伙伴
     *
     * @param model
     * @return
     */
    @RequestMapping("/coalitionPartner")
    public String coalitionPartner(Model model, Solution solution) {
        return "/web/partner/alliance";
    }
}