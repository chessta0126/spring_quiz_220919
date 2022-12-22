package com.quiz;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@MapperScan(basePackages = "com.quiz.*")
// mapper scan : 베이스 패키지 밑에 있는 Repository Annotation, DAO를 찾는 역할

@SpringBootApplication

// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
// DB설정을 안 보겠다는 의미(이제 제거해야 함)

public class SpringQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringQuizApplication.class, args);
	}

	@Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);

        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml"); //  앞: 경로, *뒤: 파일 이름 이렇게 끝나야 함
        sessionFactory.setMapperLocations(res);

        return sessionFactory.getObject();
    }
}
