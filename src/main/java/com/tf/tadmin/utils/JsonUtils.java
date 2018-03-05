package com.tf.tadmin.utils;

import java.io.IOException;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author mo.xf
 *
 */
public class JsonUtils {
	static ObjectMapper mapper = null;
	public static Logger logger = Logger.getLogger(JsonUtils.class);
	static {
		mapper = new ObjectMapper();
		// 为 null 的不转换
		// mapper.setSerializationInclusion(JsonSerialize.Inclusion.NON_NULL.NON_NULL);
	}

	public static <T> T readValue(String content, Class<T> clazz) {
		T t = null;
		// mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);  
		try {
			t = mapper.readValue(content, clazz);
		} catch (JsonParseException e) {
			logger.error(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
		return t;
	}
	
	
	public static String writeValueAsString(Object o) {
		String str = null;
		try {
			str = mapper.writeValueAsString(o);
		} catch (JsonGenerationException e) {
			logger.error(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
		return str;
	}

	@SuppressWarnings("rawtypes")
	public static Object readValues(String content, Class CollectionType,
			Class clazz) {
		Object o = null;

		try {
			o = mapper.readValue(content,
					getCollectionType(CollectionType, clazz));
		} catch (JsonParseException e) {
			logger.error(e.getMessage(), e);
		} catch (JsonMappingException e) {
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}

		return o;
	}

	public static JavaType getCollectionType(Class<?> collectionClass,
			Class<?>... elementClasses) {
		return mapper.getTypeFactory().constructParametricType(collectionClass,
				elementClasses);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String, Object> readJson2Map(String json){
		 Map<String, Object> maps = null ;
		 try {
			 maps = mapper.readValue(json, Map.class);
		    } catch (JsonParseException e) {
		        e.printStackTrace();
		    } catch (JsonMappingException e) {
		        e.printStackTrace();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		 
		 return maps ;
	}
	
	public static void main(String[] args) {
		//Message m = new Message(true , "test") ;
		//System.out.println(JsonUtils.writeValueAsString(m)) ;
		
		//Map m = JsonUtils.readValue("{\"success\":true,\"msg\":\"test\"}", Map.class) ;
	}
}
