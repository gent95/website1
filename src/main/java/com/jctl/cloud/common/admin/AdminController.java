package com.jctl.cloud.common.admin;


import com.jctl.cloud.common.utils.FileUtils;
import com.jctl.cloud.common.utils.Reflections;
import com.jctl.cloud.common.utils.UploadUtils;
import com.jctl.cloud.common.utils.ftp.FtpUtils;
import com.jctl.cloud.common.utils.ftp.UploadResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户管理管理
 * Created by kay on 2016/12/8 0008.
 */

@Controller
@RequestMapping("admin")
public class AdminController extends HttpServlet {
    private final Long IMG_SIZE = 1024 * 1024 * 5l;

    @Value("${imgUrl}")
    protected String imgUrl;

    @Value("${ftp.address}")
    protected String ftp_address;

    @Value("${ftp.username}")
    protected String ftpUsername;

    @Value("${ftp.password}")
    protected String ftpPassword;


    /**
     * 普通图片上传
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public Map<String, Object> upload(HttpServletRequest request) {
        UploadUtils uploadUtils = new UploadUtils();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try{

            String [] up = uploadUtils.uploadFile(request);
            resultMap.put("flag",1);//成功
            resultMap.put("url",up[4]);//url
            resultMap.put("code", 0);

            //编辑器用
            Map map = new HashMap();
            map.put("src", up[4]);
            resultMap.put("data",map);
        }catch (Exception e){
            resultMap.put("flag",0);
            resultMap.put("code", 0);
            e.printStackTrace();
        }




//        FileItem item = request.
//        try {
//            BufferedImage img = ImageIO.read(file.getInputStream());
//            // 校验文件长宽高
//            if (img.getHeight() > 2000) {
//                resultMap.put("msg", "图片高度不能大于200");
//                resultMap.put("flag", 0);
//                return resultMap;
//            }
//            if (file == null) {
//                resultMap.put("msg", "文件不能为空");
//                resultMap.put("flag", 0);
//                return resultMap;
//            }
//            UploadResult uploadResult = FtpUtils.upload(file, imgUrl, ftp_address, ftpUsername, ftpPassword);
//            String[] propertys = new String[]{"url"};
//            for (String property : propertys) {
//                resultMap.put(property, Reflections.invokeGetter(uploadResult, property));
//            }
//            resultMap.put("flag", 1);
//        } catch (Exception e) {
//            resultMap.put("flag", 0);
//            e.printStackTrace();
//        }
        return resultMap;
    }

    /**
     * 富文本上传用
     *
     * @param request
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "editUpload", method = RequestMethod.POST)
    public Map<String, Object> editUpload(HttpServletRequest request, MultipartFile file) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if (file == null) {
            resultMap.put("msg", "文件不能为空");
            resultMap.put("flag", 0);
            return resultMap;
        }
        Long size = file.getSize();
        if (size > IMG_SIZE) {
            resultMap.put("code", 1);
            resultMap.put("msg", "请上传小于5M的图片！");
            return resultMap;
        }

        try {
            UploadResult uploadResult = FtpUtils.upload(file, imgUrl, ftp_address, ftpUsername, ftpPassword);
//            ImgResult result = ImgUtils.upload(request, file);
            if (uploadResult != null) {
                resultMap.put("code", 0);
                resultMap.put("msg", "");
                Map<String, Object> data = new HashMap<String, Object>();
                data.put("src", uploadResult.getUrl());
                resultMap.put("data", data);
            } else {
                resultMap.put("code", 1);
                resultMap.put("msg", "不知道为什么，图片上传失败了！");
                return resultMap;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }



}
