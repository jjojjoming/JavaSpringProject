package com.moca.web.config;


import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxFilter extends HttpServlet implements Filter{

    private String ajaxHeader = "x-csrf-token";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpRes = (HttpServletResponse) response;

        if (isAjaxRequest(httpReq)) {
            try {
                if("/login".equals(httpReq.getRequestURI()) || "/home".equals(httpReq.getRequestURI())) {
                    httpRes.sendError(HttpServletResponse.SC_FORBIDDEN);
                }else {
                    filterChain.doFilter(httpReq, httpRes);
                }
            } catch (AccessDeniedException e) {
                httpRes.sendError(HttpServletResponse.SC_FORBIDDEN);
            } catch (AuthenticationException e) {
                httpRes.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } catch (Exception e){
                httpRes.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            filterChain.doFilter(httpReq, httpRes);
        }

    }

    private boolean isAjaxRequest(HttpServletRequest req) {

        String header = req.getHeader(ajaxHeader);
        return (header != null);
    }

}
