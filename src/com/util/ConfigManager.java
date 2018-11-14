package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManager {
	private Properties p ;
	private  static ConfigManager  cm ;
	
	private ConfigManager() {
		p = new Properties();
		InputStream is = ConfigManager.class.getClassLoader().getResourceAsStream("database.properties");
		try {
			p.load(is);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static synchronized  ConfigManager getInstance() {
		if(cm==null) {
			cm = new ConfigManager();
		}
		return cm;
	}
	
	public String getValue(String key) {
		return p.getProperty(key);
	}
}
