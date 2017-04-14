package com.jctl.cloud.webapp;

import com.jctl.cloud.common.utils.Reflections;
import com.jctl.cloud.manager.banner.Banner;
import com.jctl.cloud.manager.banner.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页轮播
 * Created by liukai on 2016/12/19 0019.
 */

@Controller
@RequestMapping("wapBanner")
public class WapBannerController {


    @Autowired
    private BannerService bannerService;

    /**
     * 获取轮播列表
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public List<Map<String, Object>> list() {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        List<Banner> bannerList = bannerService.getBannerList();
        try {
            if (bannerList == null) {
                return null;
            }
            String[] propertys = new String[]{"title", "url", "picPath"};
            for (Banner banner : bannerList) {
                Map<String, Object> map = new HashMap<String, Object>();
                for (String property : propertys) {
                    map.put(property, Reflections.invokeGetter(banner, property));
                }
                result.add(map);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


}
