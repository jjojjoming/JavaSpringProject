package kr.co.soft.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.soft.beans.UserBean;
import kr.co.soft.interceptor.CheckLoginInterceptor;
import kr.co.soft.interceptor.CheckWriterInterceptor;
import kr.co.soft.interceptor.TopMenuInterceptor;
import kr.co.soft.mapper.TopMenuMapper;
import kr.co.soft.mapper.UserMapper;
import kr.co.soft.mapper.BoardMapper;
import kr.co.soft.mapper.PayMapper;
import kr.co.soft.service.BoardService;
import kr.co.soft.service.TopMenuService;

//<annotation-driven/>와 같음
@Configuration // controller들어옴
//controller어노테이션(@)이 셋팅되어 있는 클래스 로드
@EnableWebMvc // controller불러옴
//bean 사용시 필요
@PropertySource("/WEB-INF/properties/db.properties")
@ComponentScan("kr.co.soft.controller")
@ComponentScan("kr.co.soft.dao") 
@ComponentScan("kr.co.soft.service")
public class ServletAppContext implements WebMvcConfigurer {

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;
	
	@Autowired
	private TopMenuService topmenuService;
	
	@Autowired
	private BoardService boardService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	// jsp의 파일이름 앞 뒤 생략
	// index
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");

	}

	// 정적 파일의 경로를 매핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resource/");
	}

	// 데이터베이스 연결(@PropertySource("/WEB-INF/properties/db.properties"))

	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	// 등록된 접속정보와 쿼리문 관리(getcon)
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);// 등록

		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	
	//쿼리문 실행을 위한 객체(Mapper)
	@Bean 
	public MapperFactoryBean<TopMenuMapper> test_mapper(SqlSessionFactory factory) throws Exception { 
		MapperFactoryBean<TopMenuMapper> factoryBean = new MapperFactoryBean<TopMenuMapper>(TopMenuMapper.class);
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean; 
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		WebMvcConfigurer.super.addInterceptors(registry);
		
		TopMenuInterceptor topMenuInterceptor=new TopMenuInterceptor(topmenuService, loginUserBean);
		InterceptorRegistration reg1=registry.addInterceptor(topMenuInterceptor);
		reg1.addPathPatterns("/**"); //모든 요청주소에 AOP등록
		
		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);
		reg2.addPathPatterns("/user/modify", "/user/logout", "/board/*");
		reg2.excludePathPatterns("/board/main");
		
		CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, boardService);
		InterceptorRegistration reg3 = registry.addInterceptor(checkWriterInterceptor);
		reg3.addPathPatterns("/board/modify", "/board/delete");
	}
	
	
	
	/* 메세지 등록 */
	
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res=new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		
		return res;
	}
	
	/* @PropertySource와 메세지 충돌 => 분리하는 코드 */
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	 
	
	//쿼리문 실행을 위한 객체(Mapper)UserMapper
	@Bean 
	public MapperFactoryBean<UserMapper> user_mapper(SqlSessionFactory factory) throws Exception { 
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean; 
	}
	
	//쿼리문 실행을 위한 객체(Mapper)boardMapper
		@Bean 
		public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception { 
			MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
			factoryBean.setSqlSessionFactory(factory); 
			
			return factoryBean; 
		}
		
		@Bean 
		public MapperFactoryBean<PayMapper> getPayMapper(SqlSessionFactory factory) throws Exception { 
			MapperFactoryBean<PayMapper> factoryBean = new MapperFactoryBean<PayMapper>(PayMapper.class);
			factoryBean.setSqlSessionFactory(factory); 
			
			return factoryBean; 
		}
	
	//첨부파일의 내용이 등록되도록 StandardServletMultipartResolver 를 등록
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();	//객체 생성하여 변환
	}

	  
}