package main.java.com.base;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;


public class BaseController {

	
	//把查询到的list作为json返回到前台（bootstrap-table）:服务器模式
	public void doListJsonResponse(List<Map<String,Object>> list,int total,HttpServletResponse response) throws IOException{
		JSONObject json = new JSONObject();
		json.put("total", total);
		json.put("rows", list);
		response.getWriter().write(json.toString());
	}
	//返回请求成功的json字符串
	public void doJsonSuccessResponse(HttpServletResponse response) throws IOException{
		JSONObject json = new JSONObject();
		json.put("success", true);
		response.getWriter().write(json.toString());
	}
	//json格式的字符串转list
	public List<Map<String,Object>> DoJson2String(String jsonString){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		JSONArray jsonArray = new JSONArray(jsonString);
		for(int i=0;i<jsonArray.length();i++){
			JSONObject json = (JSONObject) jsonArray.get(i);
			resultMap = Json2Map(json);
			list.add(resultMap);
		}
		return list;
	}
	//json转map
	public Map<String,Object> Json2Map(JSONObject json){
		Map<String,Object> map = new HashMap<String, Object>();
		Iterator<String> it = json.keys();
		while(it.hasNext()){
			String key = it.next();
			Object value = json.get(key);
			map.put(key, value);
		}
		return map;
	}
}
