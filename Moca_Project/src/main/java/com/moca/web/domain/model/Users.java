package com.moca.web.domain.model;

import com.moca.web.domain.BaseTimeEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Users extends BaseTimeEntity implements UserDetails {

    @Id
    private Long id;

    private String email;

    private String phone;

    private String name;

    private String password;

    private String address;

    private boolean enabled;

    private Set<UserAuthority> authorities;

    private boolean isMarketing;

    private String kakaoId;

    private String profileImgName;

    private String verificationCode;

    private MultipartFile profileImg;

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }
}
