package com.jctl.cloud.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dream on 2016/12/20.
 */
@Controller
@RequestMapping("forworld")
public class WebForWorldController {

    @RequestMapping("AgrInternet")
    public String AgrInternet(){
        return "/web/serve/prdRef";
    }
}
