package com.hotel.common.util;

import java.io.FileReader;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;




import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class PostUtil {
	 /** 
     * 重写验证方法，取消检测ssl 
     */  
    private static TrustManager truseAllManager = new X509TrustManager(){  
  
        public void checkClientTrusted(  
                java.security.cert.X509Certificate[] arg0, String arg1)  
                throws CertificateException {  
            // TODO Auto-generated method stub  
              
        }  
  
        public void checkServerTrusted(  
                java.security.cert.X509Certificate[] arg0, String arg1)  
                throws CertificateException {  
            // TODO Auto-generated method stub  
              
        }  
  
        public java.security.cert.X509Certificate[] getAcceptedIssuers() {  
            // TODO Auto-generated method stub  
            return null;  
        }  
          
    }; 
	/** 
     * 访问https的网站 
     * @param httpclient 
     */  
    private static void enableSSL(DefaultHttpClient httpclient){  
        //调用ssl  
         try {  
                SSLContext sslcontext = SSLContext.getInstance("TLS");  
                sslcontext.init(null, new TrustManager[] { truseAllManager }, null);  
                SSLSocketFactory sf = new SSLSocketFactory(sslcontext);  
                sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);  
                Scheme https = new Scheme("https", sf, 443);  
                httpclient.getConnectionManager().getSchemeRegistry().register(https);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
    }  
    
    
	
	
	public static JSONObject doPostStr(String url,String outStr){
		DefaultHttpClient httpClient=new DefaultHttpClient();
		enableSSL(httpClient);
		HttpPost httpPost=new HttpPost(url);
		JSONObject jsonObject=null;
		try {
			httpPost.setEntity(new StringEntity(outStr,"UTF-8"));
			HttpResponse response=httpClient.execute(httpPost);
			String result=EntityUtils.toString(response.getEntity(),"UTF-8");
			jsonObject=JSON.parseObject(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	
	
	
	
	/**
	 * 执行头条js获得请求接口的参数
	 * @return
	 */
	public static JSONObject getUrlParam(){
		JSONObject jsonObject=null;
		FileReader reader=null;
		try {
			ScriptEngineManager manager=new ScriptEngineManager();
			ScriptEngine engine=manager.getEngineByName("javascript");
			String jsFileName="E:/toutiao.js";
			reader=new FileReader(jsFileName);
			engine.eval(reader);
			if (engine instanceof Invocable) {
				Invocable invoke = (Invocable) engine;
				Object obj = invoke.invokeFunction("getParam");
				jsonObject = JSONObject.parseObject(obj != null ? obj.toString() : null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(reader!=null){
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return jsonObject;
	}
	
	/**
	 * doGet请求方法
	 * @param url
	 * @return
	 */
	public static JSONObject doGetStr(String url){
		DefaultHttpClient httpClient=new DefaultHttpClient();
		enableSSL(httpClient);
		HttpGet httpGet=new HttpGet(url);
		httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0");
		httpGet.setHeader("Cookie", "csrftoken=30dcf3990fa6aae5e2bc32ce86e5ec48; tt_webid=6436619940845880834; WEATHER_CITY=%E5%8C%97%E4%BA%AC; UM_distinctid=15cee0bbd12d8-0b0e1e2319539d-4d584131-13c680-15cee0bbd13139; CNZZDATA1259612802=1009653813-1498637798-null%7C1498637798; __tasessionId=zlbp5mo9d1498642366073; uuid='w:519f60b4044649639aedec9bd897dd23'; _ga=GA1.2.1944013063.1498642370; _gid=GA1.2.1874914792.1498642370;Connection: keep-alive");
		System.out.println(httpGet.getHeaders("Cookie"));
		JSONObject jsonObject=null;
		try {
			HttpResponse response=httpClient.execute(httpGet);
			HttpEntity entity=response.getEntity();
			if(entity!=null){
				String result =EntityUtils.toString(entity,"UTF-8");
				jsonObject=JSONObject.parseObject(result);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	public static String doGetStrs(String url){
		DefaultHttpClient httpClient=new DefaultHttpClient();
		enableSSL(httpClient);
		HttpGet httpGet=new HttpGet(url);
		httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0");
		httpGet.setHeader("Cookie", "csrftoken=30dcf3990fa6aae5e2bc32ce86e5ec48; tt_webid=6436619940845880834; WEATHER_CITY=%E5%8C%97%E4%BA%AC; UM_distinctid=15cee0bbd12d8-0b0e1e2319539d-4d584131-13c680-15cee0bbd13139; CNZZDATA1259612802=1009653813-1498637798-null%7C1498637798; __tasessionId=zlbp5mo9d1498642366073; uuid='w:519f60b4044649639aedec9bd897dd23'; _ga=GA1.2.1944013063.1498642370; _gid=GA1.2.1874914792.1498642370;Connection: keep-alive");
		System.out.println(httpGet.getHeaders("Cookie"));
		try {
			HttpResponse response=httpClient.execute(httpGet);
			HttpEntity entity=response.getEntity();
			if(entity!=null){
				String result =EntityUtils.toString(entity,"UTF-8");
				return result;
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
		
	}
	/**
	 * doPost请求方法
	 * @param url
	 * @param outStr
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static JSONObject doPostStr(String url,Map<String, String> params){
		DefaultHttpClient httpClient=new DefaultHttpClient();
		HttpPost httpPost=new HttpPost(url);
		httpPost.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0");
		httpPost.setHeader("Cookie", "csrftoken=30dcf3990fa6aae5e2bc32ce86e5ec48; tt_webid=6436619940845880834; WEATHER_CITY=%E5%8C%97%E4%BA%AC; UM_distinctid=15cee0bbd12d8-0b0e1e2319539d-4d584131-13c680-15cee0bbd13139; CNZZDATA1259612802=1009653813-1498637798-null%7C1498637798; __tasessionId=zlbp5mo9d1498642366073; uuid='w:519f60b4044649639aedec9bd897dd23'; _ga=GA1.2.1944013063.1498642370; _gid=GA1.2.1874914792.1498642370;Connection: keep-alive");
		System.out.println(httpPost.getHeaders("Cookie"));
		JSONObject jsonObject=null;
		try {
			if(params!=null){
				List<NameValuePair> list=new ArrayList<NameValuePair>();
				Set<String> keySet=params.keySet();
				for(String key:keySet){
					list.add(new BasicNameValuePair(key, params.get(key)));
				}
				httpPost.setEntity(new UrlEncodedFormEntity(list, HTTP.UTF_8));
			}
			HttpResponse response=httpClient.execute(httpPost);
			String result=EntityUtils.toString(response.getEntity(),"UTF-8");
			jsonObject=JSONObject.parseObject(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public static void main(String[] args) {
		String url ="https://kyfw.12306.cn/otn/leftTicket/query?leftTicketDTO.train_date=2017-06-29&leftTicketDTO.from_station=BJP&leftTicketDTO.to_station=BMP&purpose_codes=ADULT";
		String url2="http://www.toutiao.com/api/pc/feed/?min_behot_time=0&category=__all__&utm_source=toutiao&widen=1&tadrequire=true&as=A12599F553877CD&cp=5953A7473C8D5E1";
		System.out.println(doGetStrs(url));
	}
}
