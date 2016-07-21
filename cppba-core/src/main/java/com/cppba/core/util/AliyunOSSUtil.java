package com.cppba.core.util;

import com.aliyun.oss.OSSClient;
import com.cppba.core.constant.Globals;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;

/**
 * 图片压缩处理 
 * @author 邹文峰
 */
public class AliyunOSSUtil {
    private static Logger logger = LoggerFactory.getLogger(AliyunOSSUtil.class);
    
    public static void uploadFile(InputStream inputStream, String key){
        // 创建OSSClient实例
        OSSClient ossClient = new OSSClient(Globals.endpoint, Globals.accessKeyId, Globals.accessKeySecret);
        // 使用访问OSS
        ossClient.putObject(Globals.bucketName, key, inputStream);
        // 关闭client
        ossClient.shutdown();
    }
    
}
