package com.moca.web.domain.model;

import lombok.Data;

@Data
public class History {

    private String historyId;
    private String sentence;
    private Long typeId;
    private Long userId;
}
