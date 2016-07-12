package com.cppba.config.redis;

import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

//@EnableRedisHttpSession
public class RedisHttpSessionConfig {
    @Bean
    public JedisConnectionFactory connectionFactory() {
        JedisConnectionFactory connection = new JedisConnectionFactory();
        connection.setHostName("113.10.222.49");
        connection.setPort(6379);
        return connection;
    }
}
