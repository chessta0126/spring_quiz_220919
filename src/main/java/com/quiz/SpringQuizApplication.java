package com.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
// DB설정을 안 보겠다는 의미(이제 제거해야 함)

public class SpringQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringQuizApplication.class, args);
	}
}
