package com.salesianos.triana.easycook.EasyCook;

import com.salesianos.triana.easycook.EasyCook.config.StorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@EnableConfigurationProperties(StorageProperties.class)
@SpringBootApplication
public class EasyCookApplication {

    public static void main(String[] args) {
		SpringApplication.run(EasyCookApplication.class, args);
	}

}
