package com.vo;

import com.entity.Menu;

/**
 * 
 * @date 2021/9/10
 */
public class MenuVo extends Menu {

    private Integer page;
    private Integer limit;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
