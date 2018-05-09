package com.jk.model;

import java.io.Serializable;
import java.util.Date;


public class Logs implements Serializable {
	private static final long serialVersionUID = -4810303873597548420L;
	private String userName;
	private String clazzName;
	private String methodName;
	private String params;
	private String time;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getClazzName() {
		return clazzName;
	}
	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "Logs [userName=" + userName + ", clazzName=" + clazzName + ", methodName=" + methodName + ", params="
				+ params + ", time=" + time + "]";
	}
	
	
	
}
