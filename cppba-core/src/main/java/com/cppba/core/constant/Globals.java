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
        //FileSystem是图片服务器的软链接
        return "../../FileSystem";
    }

    public final  static int userId = 1;

    //图片服务器地址
    public final static String file_server_url ="http://image.cppba.com";

    //email
    public final static String email_username="Service01@51dong.cc"/*"5k72@wukow.com"*/;//发送人用户名
    public final static String email_password="Service.01"/*"wkwl2014"*/;//发送人密码
    public final static String email_smtp="smtp.mxhichina.com"/*"smtp.exmail.qq.com"*/;//邮件服务器smtp
    public final static String email_server="Service01@51dong.cc";//接收通知


    //aliyun-oss
    public static String endpoint = "http://oss-cn-hongkong.aliyuncs.com";
    public static String accessKeyId = "KCsxSw9uWTJSz90h";
    public static String accessKeySecret = "JMlEEkI3nlXF1rkdBDzk9RtH1X5aD3";
    public static String bucketName = "hk-filesystem";

    public static String template_type = "blog";
    //public static String template_type = "txb";
}
