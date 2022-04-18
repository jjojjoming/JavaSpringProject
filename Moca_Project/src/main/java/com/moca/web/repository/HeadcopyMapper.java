package com.moca.web.repository;

import com.moca.web.domain.model.inputHeadcopy;
import com.moca.web.domain.model.likeHeadcopy;
import com.moca.web.domain.model.outputHeadcopy;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HeadcopyMapper {

    @Select("select S.headcopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from moca_client.HEADCOPY S join moca_client.CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{brand_main_key} or S.keyword2 like #{brand_main_key} or S.keyword3 like #{brand_main_key} or sentence like #{brand_main_key} order by T.type_id")
    List<outputHeadcopy> selectHeadcopyListKey1(inputHeadcopy inputheadcopy);

    @Select("select S.headcopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from moca_client.HEADCOPY S join moca_client.CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like '화장품' or S.keyword2 like '화장품' or S.keyword3 like '화장품' or sentence like '화장품' order by T.type_id")
    List<outputHeadcopy> selectHeadcopyListKeytest();

    @Select("select S.headcopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from moca_client.HEADCOPY S join moca_client.CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{brand_sub_key1} or S.keyword2 like #{brand_sub_key1} or S.keyword3 like #{brand_sub_key1} or sentence like #{brand_sub_key1} order by T.type_id")
    List<outputHeadcopy> selectHeadcopyListKey2(inputHeadcopy inputheadcopy);

    @Select("select S.headcopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from moca_client.HEADCOPY S join moca_client.CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{brand_sub_key2} or S.keyword2 like #{brand_sub_key2} or S.keyword3 like #{brand_sub_key2} or sentence like #{brand_sub_key2} order by T.type_id")
    List<outputHeadcopy> selectHeadcopyListKey3(inputHeadcopy inputheadcopy);

    @Select("select S.headcopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from HEADCOPY S join CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where C.categories_id=${brand_category} order by T.type_id")
    List<outputHeadcopy> selectHeadcopyListCategory(inputHeadcopy inputheadcopy);

    @Insert("insert into HISTORY(sentence, type_id, user_id) values(#{sentence},#{type_id},#{user_id})")
    void likeHeadcopy(likeHeadcopy likeHeadcopy);

}
