package com.moca.web.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class outputHeadcopy {
    private Long headcopyid;
    private String sentence;
    private String name;
    private String keyword1;
    private String keyword2;
    private String keyword3;

    @Override
    public String toString() {
        return "outputHeadcopy{" +
                "headcopy_id=" + headcopyid +
                ", sentence='" + sentence + '\'' +
                ", name='" + name + '\'' +
                ", keyword1='" + keyword1 + '\'' +
                ", keyword2='" + keyword2 + '\'' +
                ", keyword3='" + keyword3 + '\'' +
                '}';
    }
}
