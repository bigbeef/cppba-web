package com.cppba.main;

        import com.cppba.core.util.ImgCompressUtil;

        import java.awt.image.BufferedImage;

public class ImgCompress {

    public static void main(String[] args) {
        String fileName = "f:\\ImgTest\\bg.jpg";

        BufferedImage bufferedImage = ImgCompressUtil.resize(fileName, 0.5);
        ImgCompressUtil.writeToFile(fileName+"_middle.png", bufferedImage);

        BufferedImage img = ImgCompressUtil.resize(fileName, 0.25);
        ImgCompressUtil.writeToFile(fileName+"_small.png", img);
    }

}
