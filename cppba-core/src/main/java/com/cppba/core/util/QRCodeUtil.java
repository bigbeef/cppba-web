package com.cppba.core.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import java.awt.image.BufferedImage;
import java.util.Hashtable;

/**
 * 
 *
 * QRCodeUtil
 * 二维码处理工具
 * 
 * zwf
 * 2015-12-8 下午01:14:34
 * 
 * @version 1.0.0
 *
 */
public class QRCodeUtil {

	/**
	 *
	 * QRCodeCreate(生成二维码)
	 * @param content  二维码内容
	 * @param W		宽度
	 * @param H		高度
	 * @return
	 */
	public static BufferedImage QRCodeCreate(String content, Integer W, Integer H){
		//生成二维码
		MultiFormatWriter mfw = new MultiFormatWriter();
		BitMatrix bitMatrix = null;
		Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.MARGIN, 0);
		try {
			bitMatrix = mfw.encode(content, BarcodeFormat.QR_CODE, W, H,hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		int width = bitMatrix.getWidth();
		int height = bitMatrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for(int x=0; x < width; x++){
			for(int y=0; y < height; y++){
				image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
			}
		}
		return image;
	}

	/**
	 * 
	 * QRCodeCreate(生成二维码)
	 * @param content  二维码内容
	 * @param path	保存相对路径("/usr/tomcat/webapps/FileSystem"+path)
	 * @param W		宽度
	 * @param H		高度
	 * @return
	 *//*
	public static String QRCodeCreate(String content,String path,Integer W,Integer H){
		String name=UUID.randomUUID().toString()+".png";
		String root = Globals.getFileSystemPath()+path;
		//创建文件夹  
        File dirFile = new File(root);  
        if (!dirFile.exists()) {  
            dirFile.mkdirs();  
        }
        //生成二维码
		MultiFormatWriter mfw = new MultiFormatWriter();
		BitMatrix bitMatrix = null;
		Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.MARGIN, 0);
		try {
			bitMatrix = mfw.encode(content, BarcodeFormat.QR_CODE, W, H,hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		int width = bitMatrix.getWidth();
		int height = bitMatrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for(int x=0; x < width; x++){
			for(int y=0; y < height; y++){
				image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
			}
		}
		try {
			ImageIO.write(image, "png", new File(root+"/"+name));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return name;
	}*/
}
