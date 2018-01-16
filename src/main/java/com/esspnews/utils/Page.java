package com.esspnews.utils;

import java.util.Iterator;
import java.util.List;

/**
 * Created by wangchuanfu on 18/1/16.
 */
public interface Page<T> extends Iterable<T> {


    /**
     * 当前页
     * @return
     */
    int getPage();

    /**
     * 每页显示的内容数
     * @return
     */
    int getSize();

    /**
     * 总页数
     * @return
     */
    int getTotalPage();

    /**
     * 内容列表的元素总数
     * @return
     */
    int getNumberOfElements();

    /**
     * 总内容数
     * @return
     */
    long getTotalCount();

    /**
     * 是否有上一页
     * @return
     */
    boolean hasPreviousPage();

    /**
     * 是否为第一页
     * @return
     */
    boolean isFirstPage();

    /**
     * 是否有下一页
     * @return
     */
    boolean hasNextPage();

    /**
     * 是否为最后一页
     * @return
     */
    boolean isLastPage();

    @Override
    Iterator<T> iterator();

    /**
     * 内容列表
     * @return
     */
    List<T> getData();

    /**
     * 是否存在内容
     * @return
     */
    boolean hasData();

    /**
     * 排序
     * @return
     */


    //==========新增

    String getRequestURL();

    void setRequestURL(String requestURL);

    String getExtraInfo();

    void setExtraInfo(String extraInfo);

    String getParams();

    void setParams(String params);
}
