package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: Subjob
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:28 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public class Subjob {

    private int subid;
    private String  pronumber;
    private String phone;
    private int dotimes;
    private String subinfo;
    private String pushperson;
    private Date pushtime;

    public int getSubid() {
        return subid;
    }

    public void setSubid(int subid) {
        this.subid = subid;
    }

    public String  getPronumber() {
        return pronumber;
    }

    public void setPronumber(String  pronumber) {
        this.pronumber = pronumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getDotimes() {
        return dotimes;
    }

    public void setDotimes(int dotimes) {
        this.dotimes = dotimes;
    }

    public String getSubinfo() {
        return subinfo;
    }

    public void setSubinfo(String subinfo) {
        this.subinfo = subinfo;
    }

    public String getPushperson() {
        return pushperson;
    }

    public void setPushperson(String pushperson) {
        this.pushperson = pushperson;
    }

    public Date getPushtime() {
        return pushtime;
    }

    public void setPushtime(Date pushtime) {
        this.pushtime = pushtime;
    }
}
