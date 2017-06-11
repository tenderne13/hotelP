package com.hotel.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;


public class MD5Util {
	public static String toMd5String(String password){
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] digest = md5.digest(password.getBytes("utf-8"));
			
			return toHex(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
		
	}
	
	
	public static String toHex(byte input[]) {
		if (input == null)
			return null;
		StringBuffer output = new StringBuffer(input.length * 2);
		for (int i = 0; i < input.length; i++) {
			int current = input[i] & 0xff;
			if (current < 16)
				output.append("0");
			output.append(Integer.toString(current, 16));
		}

		return output.toString();
	}
	
	public static void main(String[] args) {
		String a="123456";
		System.out.println(MD5Util.toMd5String(a));
	}
}
