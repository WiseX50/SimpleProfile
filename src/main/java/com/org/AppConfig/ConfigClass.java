package com.org.AppConfig;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({"com.org.Controller","com.org.Entity"})
public class ConfigClass {

}
