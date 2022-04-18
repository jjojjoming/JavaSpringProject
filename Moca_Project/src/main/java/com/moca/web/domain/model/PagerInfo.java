package com.moca.web.domain.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagerInfo {
    /**
     * 현재페이지
     */
    private int currentPage = 1;
    private int pageTotal; //페이지 전체 갯수

    private int startPageIndex;//현재 보여지는 페이지의 첫번째 인덱스(1부터 시작)
    private int endPageIndex;//현재 보여지는 페이지의 마지막 인덱스(1부터 시작)
    private int blockPage = 5;//한화면에 보여줄 페이지의 수

    private int itemCountPerPage = 12;//페이지당 아이템 수
    private int itemCountTotal;//전체 아이템 수
    private int start;

    public PagerInfo(Integer currentPage) {
        this.currentPage = currentPage == null || currentPage < 1 ? 1 : currentPage;
        this.start = computeStart();
    }

    public PagerInfo(Integer currentPage, Integer itemCountPerPage) {
        this.currentPage = currentPage < 1 ? 1 : currentPage;
        this.itemCountPerPage = itemCountPerPage;
        this.start = computeStart();
    }

    private int computeStart() {
        return (currentPage - 1) * itemCountPerPage;
    }

    public void setItemCountTotal(int itemCountTotal) {
        this.itemCountTotal = itemCountTotal;
        this.pageTotal = itemCountTotal % itemCountPerPage == 0 ? (itemCountTotal / itemCountPerPage) : (itemCountTotal / itemCountPerPage + 1);

        this.startPageIndex = ((currentPage - 1) / this.blockPage) * this.blockPage + 1;
        this.endPageIndex = this.startPageIndex + this.blockPage - 1;
        this.endPageIndex = this.endPageIndex > this.pageTotal ? this.pageTotal : this.endPageIndex;
    }
}
