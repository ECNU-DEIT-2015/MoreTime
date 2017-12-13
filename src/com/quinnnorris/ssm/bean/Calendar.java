package com.quinnnorris.ssm.bean;

/**
 * Title: Calendar
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 上午9:08 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
public class Calendar {

    private int tid;
    private int id;
    private String phone;
    private String sday;
    private String eday;
    private String stime;
    private String etime;
    private String inners;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSday() {
        return sday;
    }

    public void setSday(String sday) {
        this.sday = sday;
    }

    public String getEday() {
        return eday;
    }

    public void setEday(String eday) {
        this.eday = eday;
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime;
    }

    public String getInner() {
        return inners;
    }

    public void setInner(String inner) {
        this.inners = inner;
    }
}
