package com.cppba.core.util;

import com.cppba.core.constant.Globals;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

/**
 * @author Administrator
 *
 */
public class UploadFileUtil {
	/**
	 * base64 --  文件base64编码 "iVBORw0KGgoAAAAN......"
	 * path -- 上传路径 "/Image/article"
	 * ext -- 拓展名   "png"
	 * @throws Exception 
	 */
	public static String base64ToFile(String base64,String path,String ext) throws Exception{
		String root = Globals.getFileSystemPath()+path;
		//创建文件夹  
        File dirFile = new File(root);  
        if (!dirFile.exists()) {
            dirFile.mkdirs();  
        }  
		String name=UUID.randomUUID().toString()+"."+ext;
		BASE64Decoder decoder = new BASE64Decoder();
		FileOutputStream write = new FileOutputStream(new File(root+"/"+name));
		byte[] decoderBytes = decoder.decodeBuffer(base64);
		write.write(decoderBytes);
		write.close();
		//生成中等缩略图
		ImgCompressUtil.createImgCompress(root+"/"+name,1);
		//生成小等缩略图
		ImgCompressUtil.createImgCompress(root+"/"+name,2);
		return name;
	}
}