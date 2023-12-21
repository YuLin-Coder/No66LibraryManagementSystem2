package com.cya.pojo;

public class Type {
    /**
     * 图书分类的数据表的bean
     */
    private int tid;//分类的id
    private String name;//分类的名称

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	@Override
	public String toString() {
		return "Type [tid=" + tid + ", name=" + name + "]";
	}
    
    

}
