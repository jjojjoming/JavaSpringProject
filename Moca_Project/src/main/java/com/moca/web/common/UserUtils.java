package com.moca.web.common;

import com.moca.web.config.security.SpringUser;
import com.moca.web.domain.model.Users;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Iterator;

@Service
public class UserUtils {

    /**
     * 회원 정보 불러오기
     * @return
     */
    public static Users getUser() {

        if (isLogin()) {
            SpringUser springUser = (SpringUser) SecurityContextHolder.getContext().getAuthentication().getDetails();
            return springUser.getUser();
        } else {
            return null;
        }
    }

    /**
     * 회원 권한이 있는지 조회한다.
     */
    public static boolean hasRole(String role) {
        if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
            return false;
        } else {
            SpringUser springUser = (SpringUser) SecurityContextHolder.getContext().getAuthentication().getDetails();
            Collection<? extends GrantedAuthority> authorities = springUser.getAuthorities();
            for (Iterator iterator = authorities.iterator(); iterator.hasNext(); ) {
                GrantedAuthority type = (GrantedAuthority) iterator.next();
                if (role.equals(type.getAuthority())) {
                    return true;
                }
            }
            return false;
        }
    }

    /**
     * 로그인 회원인지 확인
     * @return
     */
    public static boolean isLogin() {
        return !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)
                && SecurityContextHolder.getContext().getAuthentication() != null
                && SecurityContextHolder.getContext().getAuthentication().isAuthenticated();
    }
}
