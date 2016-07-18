package com.cppba.web.common;

import com.cppba.core.util.CommonUtil;
import com.cppba.core.util.QRCodeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
@Controller
public class CommonAction {
    private static Logger logger = LoggerFactory.getLogger(CommonAction.class);

    //返回403错误
    @RequestMapping("/403.htm")
    public void login(
            HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<String,Object>();
        CommonUtil.responseBuildJson("403","你无权访问该资源!",null,response);
    }

    /**
     * 获取二维码
     * text 必须用UTF8编码格式，x内容出现 & 符号时，请用 %26 代替,换行符使用 %0A
     */
    @RequestMapping("/qrcode_image.htm")
    public void qrcode_image(
            HttpServletRequest request,HttpServletResponse response,
            @RequestParam(value="text", defaultValue="")String text) throws IOException {

        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        BufferedImage image = QRCodeUtil.QRCodeCreate(text, 250, 250);

        ImageIO.write(image, "png",response.getOutputStream());
    }

    /**
     * 下载二维码
     */
    @RequestMapping("/download_qrcode_image.htm")
    public void download_qrcode_image(
            HttpServletRequest request,HttpServletResponse response,
            @RequestParam(value="text", defaultValue="")String text) throws IOException {
        response.setHeader("Content-Disposition", "attachment; filename=qingcheng.png");
        response.setContentType("application/octet-stream; charset=utf-8");

        BufferedImage image = QRCodeUtil.QRCodeCreate(text, 250, 250);
        ImageIO.write(image, "png",response.getOutputStream());
    }
}
