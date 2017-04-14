package com.jctl.cloud.webapp;

import com.jctl.cloud.manager.product.Product;
import com.jctl.cloud.manager.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * 产品管理的controller
 * Created by dream on 2016/12/26.
 */

@Controller
@RequestMapping("product")
public class WebProductController {

    @Autowired
    private ProductService productService;

    /**
     *农业互联网监控系统
     * @param product
     * @param model
     * @return
     */
    @RequestMapping("AgrInternet")
    public String AgrInternet(Product product, Model model ) {
        try {
            List<Product> products =  productService.findByNavId(product);
            model.addAttribute("product", products);
            //request.getSession().setAttribute("size",products.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/web/serve/prdRef";
    }

    @RequestMapping("greenHouse")
    public String greedHouse(Product product, Model model ){
        return "web/product/greenHouse/greenHouse";
    }
    @RequestMapping("moitoringSystem")
    public String moitoringSystem(Product product, Model model ){
        return "web/product/monitoringSystem/monitoringSystem";
    }

    @RequestMapping("waterAndFerMac")
    public String waterAndFerMac(Product product, Model model ){
        return "web/product/waterAndFerMac/waterAndFerMac";
    }


}
