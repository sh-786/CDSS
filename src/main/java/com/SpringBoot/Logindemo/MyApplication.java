package com.SpringBoot.Logindemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.SpringBoot.Logindemo.Controller"})
@ComponentScan(basePackages= {"com.SpringBoot.Logindemo.Modal"})
@ComponentScan(basePackages= {"com.SpringBoot.Logindemo.Repository"})
@ComponentScan(basePackages= {"com.SpringBoot.Logindemo.Services"})
public class MyApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyApplication.class, args);
	}

}
