package com.moca.web.config;

import com.moca.web.config.security.WebSecurityConfig;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;


public class WebWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{RootConfig.class, WebSecurityConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{WebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext servletContext)
            throws ServletException {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", characterEncodingFilter);

        encodingFilter.addMappingForUrlPatterns(null, false, "/*");

        XssEscapeServletFilter xssEscapeServletFilter = new XssEscapeServletFilter();
        FilterRegistration.Dynamic xssFilterRegistration = servletContext.addFilter("xssEscapeServletFilter", xssEscapeServletFilter);
        xssFilterRegistration.addMappingForUrlPatterns(null, false, "/*");

        AjaxFilter ajaxFilter = new AjaxFilter();
        FilterRegistration.Dynamic sessionFilterRegistration = servletContext.addFilter("ajaxFilter", ajaxFilter);
        sessionFilterRegistration.addMappingForUrlPatterns(null, false, "/*");

        super.onStartup(servletContext);
    }

}