package com.jctl.cloud.webapp;

import com.jctl.cloud.manager.serve.Serve;
import com.jctl.cloud.manager.serve.ServeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dream on 2016/12/26.
 */

@Controller
@RequestMapping("serve")
public class WebServeController {

    @Autowired
    private ServeService serveService;

    @RequestMapping("smartcustom")
    public String AgrInternet(Serve serve, Model model) {
        try {
            Serve serves =  serveService.findByNavId(serve);
            model.addAttribute("serve", serves);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/web/serve/prdRef";
    }
}
