package com.moca.web.domain.model;

import lombok.Data;

@Data
public class Review {

    private Long reviewId;
    private Long userId;
    private String content;
    private boolean openView;
    private String writeDate;
    private Users users;

}
