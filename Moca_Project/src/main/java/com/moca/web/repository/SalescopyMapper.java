package com.moca.web.repository;

import com.moca.web.domain.model.inputHeadcopy;
import com.moca.web.domain.model.inputSalescopy;
import com.moca.web.domain.model.outputHeadcopy;
import com.moca.web.domain.model.outputSalescopy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SalescopyMapper {

    @Select("select T.type_id, T.name as salesCategory, S.salescopy_id, S.sentence, C.name as category, S.keyword1, S.keyword2, S.keyword3 from SALESCOPY S join CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{sales_main_key} or S.keyword2 like #{sales_main_key} or S.keyword3 like #{sales_main_key} or sentence like #{sales_main_key} order by T.type_id")
    List<outputSalescopy> selectSalesCopyListKey1(inputSalescopy inputSalesCopy);

    @Select("select T.type_id, T.name as salesCategory, S.salescopy_id, S.sentence, C.name as category, S.keyword1, S.keyword2, S.keyword3 from SALESCOPY S join CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{sales_sub_key1} or S.keyword2 like #{sales_sub_key1} or S.keyword3 like #{sales_sub_key1} or sentence like #{sales_sub_key1} order by T.type_id")
    List<outputSalescopy> selectSalesCopyListKey2(inputSalescopy inputSalesCopy);

    @Select("select T.type_id, T.name as salesCategory, S.salescopy_id, S.sentence, C.name as category, S.keyword1, S.keyword2, S.keyword3 from SALESCOPY S join CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where S.keyword1 like #{sales_sub_key2} or S.keyword2 like #{sales_sub_key2} or S.keyword3 like #{sales_sub_key2} or sentence like #{sales_sub_key2} order by T.type_id")
    List<outputSalescopy> selectSalesCopyListKey3(inputSalescopy inputSalesCopy);

    @Select("select T.type_id, T.name, S.salescopy_id, S.sentence, C.name,S.keyword1,S.keyword2,S.keyword3 from SALESCOPY S join CATEGORIES C on S.categories_id = C.categories_id join TYPE T on S.type_id = T.type_id where C.categories_id=${sales_category} order by T.type_id")
    List<outputSalescopy> selectSalesCopyListCategory(inputSalescopy inputSalesCopy);

}
