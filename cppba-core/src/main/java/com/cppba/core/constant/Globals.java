package com.cppba.core.constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 静态变量
 */
public class Globals {
    private static Logger logger = LoggerFactory.getLogger(Globals.class);
    
    //文件上传路径
    public static String getFileSystemPath(){
        return "../../FileSystem";
    }

    //图片服务器地址
    public final static String img_server_url="http://image.cppba.com/";

    //email
    public final static String email_username="Service01@51dong.cc"/*"5k72@wukow.com"*/;//发送人用户名
    public final static String email_password="Service.01"/*"wkwl2014"*/;//发送人密码
    public final static String email_smtp="smtp.mxhichina.com"/*"smtp.exmail.qq.com"*/;//邮件服务器smtp
    public final static String email_server="Service01@51dong.cc";//接收通知
    
    
}
