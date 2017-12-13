package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: Project
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:28 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public class Project {

    private int proid;
    private String phone;
    private String proname;
    private String info;
    private String pronumber;
    private String barcolor;
    private int types;
    private Date begtime;
    private Date endtime;

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getPronumber() {
        return pronumber;
    }

    public void setPronumber(String pronumber) {
        this.pronumber = pronumber;
    }

    public String getBarcolor() {
        return barcolor;
    }

    public void setBarcolor(String barcolor) {
        this.barcolor = barcolor;
    }

    public int getTypes() {
        return types;
    }

    public void setTypes(int types) {
        this.types = types;
    }

    public Date getBegtime() {
        return begtime;
    }

    public void setBegtime(Date begtime) {
        this.begtime = begtime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}
