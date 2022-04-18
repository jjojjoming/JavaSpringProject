package com.moca.web.service;

import com.moca.web.domain.model.Notice;
import com.moca.web.domain.model.PagerInfo;
import com.moca.web.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class NoticeService {

    private final NoticeRepository noticeRepository;

    public List<Notice> selectNoticeList(PagerInfo pagerInfo, int isHeaderContent) {
        List<Notice> selectNoticeList = noticeRepository.selectNoticeList(pagerInfo, isHeaderContent);

        for(int i = 0; i < selectNoticeList.size(); i++ ){
            String unescapeHtml4Content = StringEscapeUtils.unescapeHtml4(selectNoticeList.get(i).getContent());
            selectNoticeList.get(i).setContent(unescapeHtml4Content);
        }
        return selectNoticeList;
    }
}
