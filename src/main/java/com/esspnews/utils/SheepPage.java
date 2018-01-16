package com.esspnews.utils;

import com.alibaba.fastjson.annotation.JSONField;
import org.apache.logging.log4j.core.util.Integers;

import java.util.ArrayList;
import java.util.List;

/**
 * User:wangchuanfu
 * Date:18/1/16
 * Time:15:26
 */

public class SheepPage {
    /**
     * ok原始关键字
     */
    private String originalKeyword;
    /**
     * dk解码后的关键字
     */
    private String decodeKeyword;
    /**
     * pk上一次的关键字
     */
    private String previousKeyword;
    /**
     * pdk上一次解码后的关键字
     */
    private String previousDecodeKeyword;
    /**
     * ci分类id
     */
    private String catalogId;
    /**
     * at属性
     */
    private String attrs;
    /**
     * so排序
     */
    private String sort;
    /**
     * st查询方式
     */
    /**
     * ps每页数量
     */
    private int pageSize;
    /**
     * pn当前页
     */
    private int pageNumber;
    /**
     * 是否促销商品
     */
    private boolean discount;
    // ========================Response数据=================
    /**
     * 查询时过滤的id
     */
    private List<String> filtIds = new ArrayList<String>();
    /**
     * 查询结果
     */
    private List<Object> results = new ArrayList<Object>();
    /**
     * 总记录条数
     */
    private long total;

    public SheepPage(SheepPage sheepPage)
    {
        this.attrs = sheepPage.attrs;
        this.catalogId = sheepPage.catalogId;
        this.decodeKeyword = sheepPage.decodeKeyword;
        this.discount = sheepPage.discount;
        this.originalKeyword = sheepPage.originalKeyword;
        this.pageNumber = sheepPage.pageNumber;
        this.pageSize = sheepPage.pageSize;
        this.previousDecodeKeyword = sheepPage.previousDecodeKeyword;
        this.previousKeyword = sheepPage.previousKeyword;
        this.sort = sheepPage.sort;
    }

    public SheepPage(String originalKeyword, String previousKeyword,
                     String catalogId, String attrs, String sort, String pageSize,
                     String pageNumber, String searchTypeCode) throws Exception
    {
        // 关键词解码处理
        if (originalKeyword == null || "".equals(originalKeyword.trim()))
        {
            this.originalKeyword = "%E6%AC%A7%E5%A7%86%E9%BE%99%E8%A1%80%E5%8E%8B%E8%AE%A1";
            this.decodeKeyword = "欧姆龙血压计";
        }


        // 分类id

    }

    public SheepPage(String originalKeyword, String pageSize, String pageNumber) {
        // 关键词解码处理
        if (originalKeyword == null || "".equals(originalKeyword.trim()))
        {
            this.originalKeyword = "%E6%AC%A7%E5%A7%86%E9%BE%99%E8%A1%80%E5%8E%8B%E8%AE%A1";
            this.decodeKeyword = "欧姆龙血压计";
        }

        // 每页条数
        int tPageSize= Integers.parseInt(pageSize, 28);
        this.pageSize = (tPageSize <= 0 || tPageSize > 96) ? 28 : tPageSize;
        // 当前页
        int tPageNumber = Integers.parseInt(pageNumber, 1);
        this.pageNumber = tPageNumber - 1 < 0 ? 0 : tPageNumber - 1;


    }

    /**
     * 偏移值=每页显示内容数*当前页数
     */
    @JSONField(serialize = false)
    public int getOffset()
    {
        return pageNumber * pageSize;
    }

    public String getOriginalKeyword()
    {
        return originalKeyword;
    }

    public void setOriginalKeyword(String originalKeyword)
    {
        this.originalKeyword = originalKeyword;
    }

    public String getDecodeKeyword()
    {
        return decodeKeyword;
    }

    public void setDecodeKeyword(String decodeKeyword)
    {
        this.decodeKeyword = decodeKeyword;
    }

    public String getPreviousKeyword()
    {
        return previousKeyword;
    }

    public void setPreviousKeyword(String previousKeyword)
    {
        this.previousKeyword = previousKeyword;
    }

    public String getPreviousDecodeKeyword()
    {
        return previousDecodeKeyword;
    }

    public void setPreviousDecodeKeyword(String previousDecodeKeyword)
    {
        this.previousDecodeKeyword = previousDecodeKeyword;
    }

    public String getCatalogId()
    {
        return catalogId;
    }

    public void setCatalogId(String catalogId)
    {
        this.catalogId = catalogId;
    }

    public String getAttrs()
    {
        return attrs;
    }

    public void setAttrs(String attrs)
    {
        this.attrs = attrs;
    }

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getPageNumber()
    {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber)
    {
        this.pageNumber = pageNumber;
    }

    public boolean isDiscount()
    {
        return discount;
    }

    public void setDiscount(boolean discount)
    {
        this.discount = discount;
    }



    public List<String> getFiltIds()
    {
        return filtIds;
    }

    public void setFiltIds(List<String> filtIds)
    {
        this.filtIds = filtIds;
    }

    public List<Object> getResults()
    {
        return results;
    }

    public void setResults(List<Object> results)
    {
        this.results = results;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }
}
