package com.esspnews.utils;

/**
 * Created by wangchuanfu on 18/1/16.
 */
public interface Pageable {
    /**
     * 当前页
     * @return
     */
    int getPageNumber();

    /**
     * 每页显示的内容数
     * @return
     */
    int getPageSize();

    /**
     * 当前页 * 每页显示的内容数 = 偏移值
     * @return
     */
    int getOffset();


}
