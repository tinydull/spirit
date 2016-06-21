package com.kk.spirit.entity;

import java.io.Serializable;
import java.util.List;

public class PagerJson<T> implements Serializable
{

	
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 7737088231719832688L;
    private long total;
    private List<T> rows;
    
    public PagerJson (long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public List<T> getRows()
    {
        return rows;
    }

    public void setRows(List<T> rows)
    {
        this.rows = rows;
    }
    
    
    
}
