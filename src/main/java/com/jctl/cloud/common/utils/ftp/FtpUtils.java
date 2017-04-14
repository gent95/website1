package com.jctl.cloud.common.utils.ftp;


import org.apache.commons.io.IOUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;

/**
 * Created by Kay on 2016/12/22 0022.
 */
public class FtpUtils implements Serializable {

    private static String base_img_upload = "/upload/img";


    /**
     * Ftp上传方法 暂时先服务图片
     *
     * @param file
     * @return
     */
    public static UploadResult upload( MultipartFile file,String imgUrl,String address,String userName,String passWord) {
        FTPClient ftpClient = new FTPClient();
        FileInputStream fileInputStream = null;
        UploadResult result = new UploadResult();
        try {
            ftpClient.connect(address);
            ftpClient.login(userName, passWord);
            InputStream stream = file.getInputStream();
            ftpClient.makeDirectory(base_img_upload);
            ftpClient.changeWorkingDirectory(base_img_upload);
            ftpClient.setBufferSize(1024);
            ftpClient.setControlEncoding("UTF-8");
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            String filename = file.getOriginalFilename();
            String saveName = new Date().getTime() + filename.substring(filename.lastIndexOf("."));
            result.setUrl(imgUrl+ saveName);
            result.setPicName(saveName);
            result.setIpAddr(imgUrl);
            ftpClient.storeFile(saveName, stream);

            System.out.print("192.168.0.10:8085/"+ saveName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                IOUtils.closeQuietly(fileInputStream);
                ftpClient.disconnect();
            } catch (IOException e) {
                System.out.print("关闭ftp链接发生异常");
                e.printStackTrace();

            }
        }
        return result;
    }

    /**
     * 文件上传-后面开发
     * @return
     */
    public static  UploadResult upload(String address,String userName,String passWord){





        return null;
    }







    public static void testUpload() {
        FTPClient ftpClient = new FTPClient();
        FileInputStream fis = null;

        try {
            ftpClient.connect("192.168.0.10");
            ftpClient.login("admin", "123456");

            File srcFile = new File("C:/1.jpg");
            System.out.print(srcFile);
            fis = new FileInputStream(srcFile);
            //梗概活动空间，文件夹位置
            ftpClient.changeWorkingDirectory("/upload/img");

            //创房间文件夹   相对路径创建  或者绝对路径创建
            ftpClient.makeDirectory("/upload/img");
            ftpClient.makeDirectory("/upload/text");
            ftpClient.setBufferSize(1024);
            ftpClient.setControlEncoding("utf-8");
            //设置文件类型（二进制）
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            ftpClient.storeFile("1001111100.rar", fis);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("FTP客户端出错！", e);
        } finally {
            IOUtils.closeQuietly(fis);
            try {
                ftpClient.disconnect();
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("关闭FTP连接发生异常！", e);
            }
        }
    }

    /**
     * 测试
     * @param args
     */
    public static void main(String[] args){
        testUpload();
    }
}
