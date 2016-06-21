package com.kk.spirit.utils;

import com.alibaba.fastjson.JSON;

public class JSONUtil
{

	
    public static String writeJson (Object obj) {
        /*ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(Include.NON_EMPTY);  
        try
        {
            return mapper.writeValueAsString(obj);
        }
        catch (JsonProcessingException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/
    	return JSON.toJSONString(obj);
    }
}
