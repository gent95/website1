package com.jctl.cloud.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/2/9 0009.
 */
@Controller
public class TestController {

    @RequestMapping(value = "test/{id}/test/{name}")
    public void test(@PathVariable Long id,@PathVariable String name){
        System.out.print(id);
        System.out.print(name);
    }

    @RequestMapping(value = "test1")
    public String test1(){

        System.out.print("test");
        return "web/index";
    }





}
