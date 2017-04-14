package com.jctl.cloud.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/2/3.
 */

@Controller
@RequestMapping("aboutus")
public class WapAboutUsController {

    @RequestMapping("company")
    public String company() {

        return "web/aboutus/company";
    }

    @RequestMapping("usIdea")
    public String usIdea() {
        return "web/aboutus/usIdea";
    }
}
