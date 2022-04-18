package spring.boot;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import spring.boot.repository.JdbcMemberRepository;
import spring.boot.repository.JdbcTemplateMemberRepository;
import spring.boot.repository.JpaMemberRepository;
import spring.boot.repository.MemberRepository;
import spring.boot.service.MemberService;

import javax.persistence.EntityManager;
import javax.sql.DataSource;

@Configuration
public class SpringConfig {
   /*
    private final DataSource dataSource;
    private final EntityManager em;

    public SpringConfig(DataSource dataSource, EntityManager em) {
        this.dataSource = dataSource;
        this.em=em;
    }

    @Bean
    public MemberService memberService(){
        return new MemberService(memberRepository());
    }

    @Bean
    public MemberRepository memberRepository(){
       // return new MemoryMemberRepository(); //순수 DB 연동
       // return new JdbcMemberRepository(dataSource); //Jdbc
        //return new JdbcTemplateMemberRepository(dataSource); //JdbcTemplate
        return new JpaMemberRepository(em); //JPA
    }
   */

    //JPA
    private final MemberRepository memberRepository;


    public SpringConfig(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Bean
    public MemberService memberService(){
        return new MemberService(memberRepository);
    }

}
