package com.jctl.cloud.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页页脚
 * Created by kai on 2016/12/23 0023.
 */
@Controller
@RequestMapping("wapFoot")
public class WapFootController {

    @RequestMapping("")
    public String index(){
        return "web/industry/industry";
    }
}
