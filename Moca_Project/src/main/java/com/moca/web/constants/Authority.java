package com.moca.web.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Slf4j
@Getter
@AllArgsConstructor
public enum Authority {

    ROLE_USER("ROLE_USER", "RM", "일반 회원"),
    ROLE_ERROR("ROLE_ERROR", "RE", "권한 에러"),
    ;

    private final String role;
    private final String value;
    private final String description;

    /**
     * Authority의 Enum 상수들을 순회하며 role 를 갖고 있는게 있는지 확인합니다.
     *
     * @param checkRole
     * @return
     */
    public static Authority findByRole(String checkRole) {
        return Arrays.stream(Authority.values())
                .filter(authority -> authority.hasRoleCode(checkRole))
                .findAny()
                .orElse(ROLE_ERROR);
    }

    public static Authority findByInvalidRole(String checkRole) {
        return Arrays.stream(Authority.values())
                .filter(authority -> authority.invalidHasRoleCode(checkRole))
                .findAny()
                .orElse(ROLE_ERROR);
    }

    public static List<String> getRoles(String checkRole) {
        List<String> roleList = new ArrayList<>();

        return null;
    }

    public boolean invalidHasRoleCode(String checkRole) {
        return !role.equals(checkRole);
    }

    public boolean hasRoleCode(String checkRole) {
        return role.equals(checkRole);
    }
}
