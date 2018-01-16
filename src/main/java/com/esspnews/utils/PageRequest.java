package com.esspnews.utils;



import java.io.Serializable;

/**
 * User:wangchuanfu
 * Date:18/1/16
 * Time:15:05
 */

public class PageRequest  implements Pageable, Serializable {


    private static final long serialVersionUID = 8280485938848398236L;

    private int p = 0;
    private int s = 28;

    public PageRequest()
    {

    }





    public PageRequest(int page, int size)
    {

        if (0 > page)
        {
            throw new IllegalArgumentException(
                    "Page index must not be less than zero!");
        }

        if (0 >= size)
        {
            throw new IllegalArgumentException(
                    "Page size must not be less than or equal to zero!");
        }

        this.p = page - 1 < 0 ? 0 : page - 1;
        this.s = size;

    }

    /**
     * 获得每页显示内容数
     */
    @Override
    public int getPageSize()
    {
        return s;
    }

    /**
     * 获得当前页数
     */
    @Override
    public int getPageNumber()
    {

        return p;
    }

    /**
     * 偏移值=每页显示内容数*当前页数
     */
    @Override
    public int getOffset()
    {

        return p * s;
    }


    @Override
    public boolean equals(final Object obj)
    {

        if (this == obj)
        {
            return true;
        }

        if (!(obj instanceof PageRequest))
        {
            return false;
        }

        PageRequest that = (PageRequest) obj;

        boolean pEqual = this.p == that.p;
        boolean sEqual = this.s == that.s;



        return pEqual && sEqual ;
    }

    @Override
    public int hashCode()
    {

        int result = 17;

        result = 31 * result + p;
        result = 31 * result + s;

        return result;
    }

    public int getPage()
    {
        return p;
    }

    public void setPage(int p)
    {
        this.p = p < 1 ? 0 : p;
        this.p = p > 99 ? 99 : p;
    }

    public void setP(int p)
    {
        this.p = p < 1 ? 0 : p;
        this.p = p > 99 ? 99 : p;
    }

    public int getSize()
    {
        return s;
    }

    public void setSize(int s)
    {
        this.s = s;
    }

    public void setS(int s)
    {
        this.s = s;
    }

}
