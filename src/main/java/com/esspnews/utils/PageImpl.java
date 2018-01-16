package com.esspnews.utils;/**
 * Created by wangchuanfu on 18/1/16.
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * User:wangchuanfu
 * Date:18/1/16
 * Time:15:22
 */

public class PageImpl<T> implements Page<T>, Serializable {

    private static final long serialVersionUID = 867755909294344406L;

    private final List<T> data = new ArrayList<T>();
    private final Pageable pageable;
    private final long totalCount;

    private String requestURL;//请求URL
    private String params;//chen_zhenyu添加的，用于传递查询的参数
    private String extraInfo;//请求地址的扩展信息，例如?keyword=ABC]

    public PageImpl(List<T> content, Pageable pageable, long total)
    {
        if (content != null)
        {
            this.data.addAll(content);
        }
        this.totalCount = total;
        this.pageable = pageable;
    }

    public PageImpl(List<T> content)
    {

        this(content, null, (null == content) ? 0 : content.size());
    }

    /**
     * 当前页
     */
    @Override
    public int getPage()
    {
        //pageable不为空，才取pageable中的当前页码。因为PageRequest构造时当前会-1，所以页面取时+1，如果+1后大于总页数，就取总页数
        return pageable == null ? 0 : ((pageable.getPageNumber() + 1) > getTotalPage() ? getTotalPage() : (pageable.getPageNumber() + 1));
    }

    /**
     * 每页显示的内容数
     */
    @Override
    public int getSize()
    {

        return pageable == null ? 0 : pageable.getPageSize();
    }

    /**
     * 总页数
     */
    @Override
    public int getTotalPage()
    {

        return getSize() == 0 ? 0 : (int) Math.ceil((double) totalCount
                / (double) getSize());
    }

    /**
     * 内容列表的元素总数
     */
    @Override
    public int getNumberOfElements()
    {

        return data.size();
    }

    /**
     * 总内容数
     */
    @Override
    public long getTotalCount()
    {

        return totalCount;
    }

    /**
     * 是否有上一页
     */
    @Override
    public boolean hasPreviousPage()
    {

        return getPage() > 0;
    }

    /**
     * 是否是第一页
     */
    @Override
    public boolean isFirstPage()
    {

        return !hasPreviousPage();
    }

    /**
     * 是否有下一页
     */
    @Override
    public boolean hasNextPage()
    {

        return ((getPage() + 1) * getSize()) < totalCount;
    }

    /**
     * 是否为最后一页
     */
    @Override
    public boolean isLastPage()
    {

        return !hasNextPage();
    }

    /**
     * 遍历内容
     */
    @Override
    public Iterator<T> iterator()
    {

        return data.iterator();
    }

    /**
     * 页面呈现内容，返回不能修改的列表
     */
    @Override
    public List<T> getData()
    {

        return Collections.unmodifiableList(data);
    }

    /**
     * 内容列表是否为空
     */
    @Override
    public boolean hasData()
    {

        return !data.isEmpty();
    }

    /**


    /**
     * 打印方法重写
     */
    @Override
    public String toString()
    {

        String contentType = "UNKNOWN";

        if (data.size() > 0)
        {
            contentType = data.get(0).getClass().getName();
        }

        return String.format("Page %s of %d containing %s instances",
                getPage(), getTotalPage(), contentType);
    }

    /**
     * 对比方法重写
     */
    @Override
    public boolean equals(Object obj)
    {

        if (this == obj)
        {
            return true;
        }

        if (!(obj instanceof PageImpl<?>))
        {
            return false;
        }

        PageImpl<?> that = (PageImpl<?>) obj;

        boolean totalEqual = this.totalCount == that.totalCount;
        boolean contentEqual = this.data.equals(that.data);
        boolean pageableEqual = this.pageable == null ? that.pageable == null
                : this.pageable.equals(that.pageable);

        return totalEqual && contentEqual && pageableEqual;
    }

    /**
     * 哈希地址计算重写
     */
    @Override
    public int hashCode()
    {

        int result = 17;

        result = 31 * result + (int) (totalCount ^ totalCount >>> 32);
        result = 31 * result + (pageable == null ? 0 : pageable.hashCode());
        result = 31 * result + data.hashCode();

        return result;
    }
    @Override
    public String getRequestURL()
    {
        return requestURL;
    }
    @Override
    public void setRequestURL(String requestURL)
    {
        this.requestURL = requestURL;
    }
    @Override
    public String getExtraInfo()
    {
        return extraInfo;
    }
    @Override
    public void setExtraInfo(String extraInfo)
    {
        this.extraInfo = extraInfo;
    }
    @Override
    public String getParams()
    {
        return params;
    }
    @Override
    public void setParams(String params)
    {
        this.params = params;
    }
}
