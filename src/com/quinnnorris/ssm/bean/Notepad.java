package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: Notepad
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 上午10:55 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class Notepad {

    private int nid;
    private int id;
    private Date fintime;
    private String phone;
    private String titles;
    private String inners;
    private int types;

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFintime() {
        return fintime;
    }

    public void setFintime(Date fintime) {
        this.fintime = fintime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getInners() {
        return inners;
    }

    public void setInners(String inners) {
        this.inners = inners;
    }

    public int getTypes() {
        return types;
    }

    public void setTypes(int types) {
        this.types = types;
    }
}
