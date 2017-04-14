package com.jctl.cloud.webapp;

/**
 * Created by Administrator on 2016/12/20 0020.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台新闻页面Controller
 */
@Controller
@RequestMapping("industryInfo")
public class WapIndustryInfoController {

    @RequestMapping("news")
    public String news() {
        return "web/bussinessInfo/news/index";
    }

    @RequestMapping("policies")
    public String Policies() {
        return "web/bussinessInfo/policies/index";
    }

    @RequestMapping("exhibitionActivity")
    public String exhibitionActivity() {
        return "web/bussinessInfo/exhibitionActivity/index";
    }

}
