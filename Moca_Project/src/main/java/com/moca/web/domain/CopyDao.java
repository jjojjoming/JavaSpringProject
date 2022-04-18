package com.moca.web.domain;

import com.moca.web.domain.model.inputSalescopy;
import com.moca.web.domain.model.outputHeadcopy;
import com.moca.web.domain.model.outputSalescopy;
import com.moca.web.repository.SalescopyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CopyDao {

    @Autowired
    private SalescopyMapper salescopyMapper;

    public List<outputSalescopy> selectSalesCopyListKey1(inputSalescopy inputSalesCopy){
        //System.out.println("Brand_Main_Key : "+inputSalesCopy.getSales_main_key()+" 넘어갈거같은데");
        return salescopyMapper.selectSalesCopyListKey1(inputSalesCopy);
    }

    public List<outputSalescopy> selectSalesCopyListKey2(inputSalescopy inputSalesCopy){
        //System.out.println("Brand_Main_Key : "+inputSalesCopy.getSales_main_key()+" 넘어갈거같은데");
        return salescopyMapper.selectSalesCopyListKey2(inputSalesCopy);
    }

    public List<outputSalescopy> selectSalesCopyListKey3(inputSalescopy inputSalesCopy){
        //System.out.println("Brand_Main_Key : "+inputSalesCopy.getSales_main_key()+" 넘어갈거같은데");
        return salescopyMapper.selectSalesCopyListKey3(inputSalesCopy);
    }

    public List<outputSalescopy> selectSalesCopyListCategory(inputSalescopy inputSalesCopy){
        //System.out.println("Brand_Main_Key : "+inputSalesCopy.getSales_main_key()+" 넘어갈거같은데");
        return salescopyMapper.selectSalesCopyListCategory(inputSalesCopy);
    }


}
