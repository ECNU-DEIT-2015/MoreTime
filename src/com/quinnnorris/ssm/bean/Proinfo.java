package com.quinnnorris.ssm.bean;

/**
 * Title: Proinfo
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:28 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public class Proinfo {

    private String phone;
    private String  pronumber;
    private int procount;
    private String persons;
    private String forgetinfo;
    private int toteltimes;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPronumber() {
        return pronumber;
    }

    public void setPronumber(String pronumber) {
        this.pronumber = pronumber;
    }

    public int getProcount() {
        return procount;
    }

    public void setProcount(int procount) {
        this.procount = procount;
    }

    public String getPersons() {
        return persons;
    }

    public void setPersons(String persons) {
        this.persons = persons;
    }

    public String getForgetinfo() {
        return forgetinfo;
    }

    public void setForgetinfo(String forgetinfo) {
        this.forgetinfo = forgetinfo;
    }

    public int getToteltimes() {
        return toteltimes;
    }

    public void setToteltimes(int toteltimes) {
        this.toteltimes = toteltimes;
    }
}
