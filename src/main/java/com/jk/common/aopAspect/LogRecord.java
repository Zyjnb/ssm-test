/** 
 * <pre>项目名称:mystical-organization 
 * 文件名称:LogRecord.java 
 * 包名:com.jk.common.aopAspect 
 * 创建日期:2018年3月20日下午9:36:27 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.common.aopAspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.jk.common.aopAspect.LogRecord;
import com.jk.model.Logs;
import com.jk.model.User;

/** 
 * <pre>项目名称：mystical-organization    
 * 类名称：LogRecord    
 * 类描述：    
 * 创建人：张立恒  
 * 创建时间：2018年3月20日 下午9:36:27    
 * 修改人：张立恒    
 * 修改时间：2018年3月20日 下午9:36:27    
 * 修改备注：       
 * @version </pre>    
 */
public class LogRecord {
	private Logger logger=Logger.getLogger(LogRecord.class);
	@Autowired
	private MongoTemplate mongoTemplate;
	
	private Long startTime;
	private Long endTime;
	
	public void beforeThead(){
		//startTime=new Date().getTime();
		System.out.println("前置调用");
	}
	
	public void afterThead(JoinPoint jp,Object retValue){
		
		endTime=new Date().getTime();
		System.out.println("后置调用");
		//Long time=(endTime-startTime)/1000;
		//类名
		String clazzName=null;
		try {
			clazzName = Class.forName(jp.getTarget().getClass().getName()).getSimpleName();
			//System.out.println("在类名为"+clazzName+"，方法名为"+jp.getSignature().getName()+"的方法运行时间为"+time+"秒");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//方法名
		String methodName = jp.getSignature().getName();
		
		    Object[] paramValues = jp.getArgs();  
		    String[] paramNames = ((CodeSignature) jp.getSignature()).getParameterNames();  
		    String params=null;
		    for(int i=0;i<paramNames.length;i++){  
		    	params+=paramNames[i]+":"+paramValues[i]+",";  
		    }
		//HttpServletRequest request = ServletActionContext.getRequest();
		/*User user=(User) request.getSession().getAttribute("user");
		String userName ="小张";*/
		Logs logs=new Logs();
		Date now=new Date();
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		String time=sim.format(now);
		//logs.setUserName(user.getUsername());
		logs.setParams(params);
		logs.setClazzName(clazzName);
		logs.setMethodName(methodName);
		logs.setTime(time);
		//System.out.println(retValue.toString());
		mongoTemplate.insert(logs);
		logger.info("类名:"+clazzName+",方法名:"+methodName+",参数与参数名:"+params+",操作时间是:"+time);
	}
}
