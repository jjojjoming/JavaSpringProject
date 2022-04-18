package com.moca.web.domain.model;

import com.moca.web.domain.BaseTimeEntity;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.security.core.GrantedAuthority;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class UserAuthority extends BaseTimeEntity implements GrantedAuthority {

    @Id
    private Long userId;

    @Id
    private String authority;

}
