package com.jctl.cloud.webapp;

import com.jctl.cloud.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/1/25 0025.
 */
@Controller
@RequestMapping(value = "map")
public class WapMapController  extends BaseController {

    @RequestMapping("")
    public String show(){
        return "web/map/map";
    }
}
