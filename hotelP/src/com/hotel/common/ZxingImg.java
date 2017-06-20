package com.hotel.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

public class ZxingImg {
	private static final int BLACK = 0xff000000;
    private static final int WHITE = 0xFFFFFFFF;
	
	

	public static void encode(String content,File file,BarcodeFormat barcodeFormat,int width,int height){
		try {
			content=new String(content.getBytes("UTF-8"), "ISO-8859-1");
			BitMatrix encode = new MultiFormatWriter().encode(content, barcodeFormat, width, height);
			writeToFile(encode, "png", file);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		public static void writeToFile(BitMatrix matrix,String format,File file){
			 int width = matrix.getWidth();
		     int height = matrix.getHeight();
		     BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		     for (int x = 0; x < width; x++) {
		         for (int y = 0; y < height; y++) {
		             image.setRGB(x, y, matrix.get(x, y) == true ? BLACK : WHITE);
		         }
		     }
		     try {
				ImageIO.write(image, format, file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}
		
		
		public static void main(String[] args) {
			String content="http://www.hao123.com";
			File file = new File("D://test.png");
			int width=400;
			int height=400;
			ZxingImg.encode(content, file, BarcodeFormat.QR_CODE, width, height);
			System.out.println("执行完了");
		}
	
}
