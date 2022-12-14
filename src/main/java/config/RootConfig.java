package config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = {"service"})
@MapperScan(basePackages = {"mapper"})
public class RootConfig {

    @Bean
    public DataSource dataSource(){
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
        hikariConfig.setJdbcUrl("jdbc:oracle:thin:@//localhost:1521/XEPDB1");
        hikariConfig.setUsername("gwang_1");
        hikariConfig.setPassword("gwang_1");

        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;

    }

    @Bean
    public SqlSessionFactory sqlSessionFactory () throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource());
        return (SqlSessionFactory) sqlSessionFactory.getObject();
    }
}
