package com.grabit.bdi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@MapperScan({"com.grabit.bdi.mapper"})
@ConfigurationProperties("com.grabit.bdi.config")
@PropertySource({"env.properties"})
public class BdiGrabitApplication {

	public static void main(String[] args) {
		SpringApplication.run(BdiGrabitApplication.class, args);
	}

}
