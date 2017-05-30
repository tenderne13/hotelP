package com.hotel.common;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;


public class Paths {
		// 访问路径设置
		private static String STATIC_TMP_ACCESS_URL;
		private static String IMAGE_REAL_PATH;
		private static String IMAGE_PHOTO_PATH;
		static {
			Properties properties = new Properties();
			try {
				properties.load(Paths.class.getClassLoader().getResourceAsStream(
						"filePath.properties"));
				STATIC_TMP_ACCESS_URL = properties
						.getProperty("STATIC_TMP_ACCESS_URL");
				IMAGE_REAL_PATH = properties
						.getProperty("IMAGE_REAL_PATH");
				IMAGE_PHOTO_PATH = properties
						.getProperty("IMAGE_PHOTO_PATH");
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		private Paths() {
		}

		public static String getPhotoPath(String imageName) {
			return IMAGE_PHOTO_PATH + "/" + imageName;
		}

		public static String getStaticAccessTempUrl(String imageName) {
			return "http://" + STATIC_TMP_ACCESS_URL
					+ imageName;
		}

		

		public static String getIMAGE_PHOTO_PATH() {
			return IMAGE_PHOTO_PATH;
		}

		public static String getIMAGE_REAL_PATH() {
			return IMAGE_REAL_PATH;
		}
}
