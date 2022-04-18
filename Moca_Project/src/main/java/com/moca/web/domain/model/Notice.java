package com.moca.web.domain.model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.Date;

@Getter
@Setter
public class Notice {
    private int noticeId;
    private String title;
    private String content;
    private boolean headerContent;
    private boolean mainDisplay;    // 노출여부
    private boolean showStatus;     // 공지노출 여부
    private LocalTime createdAt;    // 등록일
}
