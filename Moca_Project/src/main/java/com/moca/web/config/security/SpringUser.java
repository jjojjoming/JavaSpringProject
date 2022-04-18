package com.moca.web.config.security;

import com.moca.web.domain.model.Users;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

public class SpringUser extends User {

    // 내장 객체인 User은 세션처럼  성공한 객체를 담아두기 위해 서버내에서 항상 불러 쓸 수 있게

    private Users users;

    public SpringUser(String email, String password, List<GrantedAuthority> grantedAuthorities, Users users) {
        super(email, password, grantedAuthorities);
        this.users = users;
    }

    public Users getUser() {
        return users;
    }

    public void setUser(Users user) {
        this.users = user;
    }
}
