package com.moca.web.repository;

import com.moca.web.domain.model.Notice;
import com.moca.web.domain.model.PagerInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface NoticeRepository {
    int selectNoticeCount();
    List<Notice> selectNoticeList(@Param("pager") PagerInfo pagerInfo, @Param("headerContent") int headerContent);
}