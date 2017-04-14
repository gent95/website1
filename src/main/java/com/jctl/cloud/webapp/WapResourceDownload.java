package com.jctl.cloud.webapp;

import com.jctl.cloud.manager.resourcedownload.ResourceDownload;
import com.jctl.cloud.manager.resourcedownload.ResourceDownloadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016/12/20 0020.
 */
@Controller
@RequestMapping(value = "resourceDow")
public class WapResourceDownload {

    @Autowired
    private ResourceDownloadService resourceDownloadService;

    @RequestMapping(value = "get")
    public String get(HttpServletRequest request,ResourceDownload resourceDownload){
        List<ResourceDownload> resourceDownloads = resourceDownloadService.findList(resourceDownload);
        request.getSession().setAttribute("resDows",resourceDownloads);
        return "/web/downList/downList";
    }

    @RequestMapping(value = "downtext")
    public String getDownText(HttpServletRequest request, ResourceDownload resourceDownload){
        request.getSession().setAttribute("resDow",resourceDownloadService.get(resourceDownload));
        return "/web/downList/downList";
    }
}
