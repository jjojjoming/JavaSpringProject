package com.moca.web.config.security;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomAuthenticationProvider customAuthenticationProvider;
    private final SessionRegistry sessionRegistry;


    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(customAuthenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        CustomLoginSuccessHandler handler = new CustomLoginSuccessHandler();
        handler.addIgnoreUrl("/loginProcess");
        handler.addIgnoreUrl("/login");

        http.addFilterBefore(characterEncodingFilter(), SecurityContextPersistenceFilter.class)
                .formLogin().loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .loginProcessingUrl("/loginProcess")
                .failureHandler(new CustomLoginFailureHandler())
                .successHandler(handler)

                .and().cors()

                .and()
                .authorizeRequests()
                .antMatchers("/h2-console/*").permitAll()
                .antMatchers("/").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/error").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/user/memberShip").permitAll()
                .antMatchers("/user/**").hasAnyAuthority("ROLE_USER")
                .antMatchers("/cs/**").hasAnyAuthority("ROLE_USER")
                .antMatchers("/service/copy/**").hasAnyAuthority("ROLE_USER")

                .and()
                .logout().logoutUrl("/logout")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/")

//                .and()
//                .csrf().ignoringAntMatchers("")

                .and()
                .exceptionHandling()
                .accessDeniedHandler(new CustomAccessDeniedHandler())

                .and()
                .rememberMe()
                .key("key")
                .tokenValiditySeconds(1000)
//                    .userDetailsService(userService)

                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                .sessionFixation().newSession()
                .maximumSessions(1)
                .expiredUrl("/")
                .maxSessionsPreventsLogin(false)
                .sessionRegistry(sessionRegistry);
    }

    public CharacterEncodingFilter characterEncodingFilter() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }

}