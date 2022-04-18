package com.moca.web.domain.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cs {


    private Long boardId;

    private String subject;

    private Long userId;

    private String content;

    private String writeDay;

    private Long readCount; //조회수

    private String name; //글쓴이


}
