package com.moca.web.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class outputSalescopy {

    private Long type_id;
    private String salesCategory;
    private Long salescopy_id;
    private String sentence;
    private String category;
    private String keyword1;
    private String keyword2;
    private String keyword3;

    @Override
    public String toString() {
        return "outputSalescopy{" +
                "type_id=" + type_id +
                ", salesCategory='" + salesCategory + '\'' +
                ", salescopy_id=" + salescopy_id +
                ", sentence='" + sentence + '\'' +
                ", category='" + category + '\'' +
                ", keyword1='" + keyword1 + '\'' +
                ", keyword2='" + keyword2 + '\'' +
                ", keyword3='" + keyword3 + '\'' +
                '}';
    }

}
