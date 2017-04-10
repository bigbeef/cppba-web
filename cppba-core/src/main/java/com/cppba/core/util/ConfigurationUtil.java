package com.cppba.core.util;


import org.apache.commons.configuration2.CombinedConfiguration;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.io.File;

public class ConfigurationUtil {

    private static CombinedConfiguration CONFIG = null;

    static {
        //读取config文件夹下的配置文件
        File configFile = new File(ConfigurationUtil.class.getResource("/config").getPath());
        File[] propertiesFiles = configFile.listFiles();
        Configurations configurations = new Configurations();
        CONFIG = new CombinedConfiguration();
        try {
            for (File propertiesFile : propertiesFiles) {
                if(propertiesFile.getName().contains(".properties")){
                    CONFIG.addConfiguration(configurations.properties(propertiesFile));
                }
            }
        } catch (ConfigurationException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取 String 类型的属性值
     */
    public static String getString(String key) {
        return CONFIG.getString(key);
    }

    /**
     * 获取 String 类型的属性值（可指定默认值）
     */
    public static String getString(String key, String defaultValue) {
        return CONFIG.getString(key, defaultValue);
    }

    public static boolean getBoolean(String key) {
        return CONFIG.getBoolean(key);
    }

    public static boolean getBoolean(String key, boolean defaultValue) {
        return CONFIG.getBoolean(key, defaultValue);
    }

    public static Boolean getBoolean(String key, Boolean defaultValue) {
        return CONFIG.getBoolean(key, defaultValue);
    }

    public static Integer getInteger(String key) {
        return CONFIG.getInt(key);
    }

    public static Integer getInteger(String key, Integer defaultValue) {
        return CONFIG.getInteger(key, defaultValue);
    }
}
