package com.jctl.cloud.webapp;

import com.jctl.cloud.manager.newslist.NewsList;
import com.jctl.cloud.manager.newslist.NewsListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页新闻Controller
 * Created by kay on 2016/12/27 0027.
 */
@Controller
@RequestMapping("wapNews")
public class WapNewsController {

    @Autowired
    private NewsListService newsListService;

    /**
     * 跳转至新闻详情页面
     * @return
     */
    @RequestMapping("")
    public String index(NewsList news,Model model) {
        if (news == null){
            return null;
        }
        try{
            NewsList newsList=  newsListService.getNewsDetail(news);
            model.addAttribute("news",newsList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "web/news/newsIndex/newsPage";
    }



    @RequestMapping("detail")
    public String detail(NewsList news,Model model) {
        if (news == null){
            return null;
        }
        try{
            NewsList newsList=  newsListService.getNewsDetail(news);
            model.addAttribute("news",newsList);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "web/news/newsIndex/newsPage";
    }


}
