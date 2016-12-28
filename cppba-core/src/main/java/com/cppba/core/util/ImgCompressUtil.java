package com.cppba.core.util;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/** 
 * 图片压缩处理 
 * @author 邹文峰
 */ 
public class ImgCompressUtil {

	
	/**
	 * 强制压缩/放大图片到固定的大小 
	 * @param fileName 压缩文件("c:\\1.png")
	 * @param compressPercent 压缩比例(压缩为原来一半传0.5)
	 * @return
	 */
    public static BufferedImage resize(String fileName,double compressPercent){
    	BufferedImage img = null;//原图
    	BufferedImage compressImg = null;//压缩后图
    	int width,height;
    	try {
    	File file = new File(fileName);
		img = ImageIO.read(file);
		width = (int)(img.getWidth()*compressPercent);
		height = (int)(img.getHeight()*compressPercent);
    	compressImg = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB );     	
    	compressImg.getGraphics().drawImage(img, 0, 0, width, height, null); // 绘制缩小后的图  
    	} catch (IOException e) {
			e.printStackTrace();
		}
    	return compressImg;
    }
    
    /**
     * 
     * @param file 存放位置("c:\\1.png")
     * @param img
     */
    public static void writeToFile(String file,BufferedImage img){
    	try {
    		File destFile = new File(file);
    		FileOutputStream out = new FileOutputStream(destFile); // 输出到文件流
			ImageIO.write(img, "png", out);
    		out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
