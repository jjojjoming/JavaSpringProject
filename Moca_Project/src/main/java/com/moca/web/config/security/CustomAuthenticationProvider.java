package com.moca.web.config.security;

import com.moca.web.domain.model.UserAuthority;
import com.moca.web.service.SnsApiService;
import com.moca.web.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;

@RequiredArgsConstructor
@Configuration
public class CustomAuthenticationProvider implements AuthenticationProvider {

    //특정 페이지 접속할 수 없게 권한 준다 예를 들어서 마이페이 같은 경우 로그인을 해야만 들어갈 수 있으니까

    private final PasswordEncoder passwordEncoder;
    private final UserService userService;
    private final SnsApiService snsApiService;
    public final Integer SESSION_TIMEOUT_IN_SECONDS = 30*60;
    private final HttpSession httpSession;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String email = (String)authentication.getPrincipal();
        String password = (String)authentication.getCredentials();
        SpringUser springUser;

        //카카오 로그인
        if(password.equals("moca-web-kakao-login")){
            springUser = (SpringUser)snsApiService.loadUserByKakaoUser(email);
            this.withdrawalFilter(springUser);
            httpSession.setMaxInactiveInterval(SESSION_TIMEOUT_IN_SECONDS);
            httpSession.setAttribute("user",springUser.getUser());
        }else {
            //스프링 시큐리티 적용 폼 로그인
            springUser = (SpringUser) userService.loadUserByUsername(email);
            this.withdrawalFilter(springUser);
            if (!passwordEncoder.matches(password, springUser.getPassword())) {
                // 로그인 실패 이력 남기기
//            userService.updateFailedLoginCountPlus(email);
                throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
            }
        }

        // 유저 로그인 이력 남기기
//        userService.updateMemberLoginDt(springUser.getMember().getMemberNo());
//        userService.updateFailedLoginCountInit(userId);

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(email, password, springUser.getAuthorities());
        authenticationToken.setDetails(springUser);
        return authenticationToken;
    }

    /**
     * 탈퇴회원 로그인 에러 처리
     * @param springUser
     */
    public void withdrawalFilter(SpringUser springUser){
        // 탈퇴한 회원이 로그인시 권한 체크
        Collection<GrantedAuthority> authorities = springUser.getAuthorities();
        authorities.stream().forEach(auth -> {
            String role = auth.getAuthority();
            if(role.equals("DELETE")){
                throw new BadCredentialsException("탈퇴");
            }
        });
    }


    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(UsernamePasswordAuthenticationToken.class);
    }
}
