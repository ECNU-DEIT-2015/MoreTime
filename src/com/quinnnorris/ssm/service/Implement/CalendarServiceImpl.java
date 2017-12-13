package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.CalendarCustom;
import com.quinnnorris.ssm.mapper.CalendarCustomMapper;
import com.quinnnorris.ssm.service.CalendarService;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.*;

/**
 * Title: CalendarServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 上午8:54 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    CalendarCustomMapper calendarCustomMapper;

    @Override
    public BaseJson setCalendarPage(HttpSession httpSession) {
        CalendarCustom customs = new CalendarCustom();
        customs.setPhone((String) httpSession.getAttribute("phone"));
        List<CalendarCustom> calendarCustoms = calendarCustomMapper.selectCalByPhone(customs);
        List<Map<String, String>> list = new ArrayList<>();
        for (CalendarCustom custom : calendarCustoms) {
            Map<String, String> calendar = new HashMap<>();
            calendar.put("syear", custom.getSday().substring(0, 4));
            calendar.put("smonth", String.valueOf(Integer.parseInt(custom.getSday().substring(4, 6))-1));
            calendar.put("sday", custom.getSday().substring(6, 8));
            calendar.put("eyear", custom.getEday().substring(0, 4));
            calendar.put("emonth", String.valueOf(Integer.parseInt(custom.getEday().substring(4, 6))-1));
            calendar.put("eday", custom.getEday().substring(6, 8));
            calendar.put("inners", custom.getInner());
            list.add(calendar);
        }
        Map<String, List<Map<String, String>>> map = new HashMap<>();
        map.put("cal_list", list);
        return new BaseJson(map);
    }

    @Override
    public BaseJson setComingMessage(BaseJson baseJsons, HttpSession httpSession) throws ParseException {
        BaseJson baseJson = baseJsons;
        CalendarCustom customs = new CalendarCustom();
        customs.setPhone((String) httpSession.getAttribute("phone"));
        List<CalendarCustom> calendarCustoms = calendarCustomMapper.selectCalByPhone(customs);
        List<Map<String, String>> list = new ArrayList<>();
        for (CalendarCustom custom : calendarCustoms) {
            if (Integer.parseInt(custom.getEday()) >= Integer.parseInt(DateUtil.simpleDateFormat(new Date()))) {
                Map<String, String> calendar = new HashMap<>();
                calendar.put("syear", custom.getSday().substring(0, 4));
                calendar.put("smonth", String.valueOf(Integer.parseInt(custom.getSday().substring(4, 6))-1));
                calendar.put("sday", custom.getSday().substring(6, 8));
                calendar.put("shour", custom.getStime().substring(0, 2));
                calendar.put("smin", custom.getStime().substring(2, 4));
                calendar.put("inners", custom.getInner());
                list.add(calendar);
            }
        }
        Map<String, List<Map<String, String>>> map = (Map<String, List<Map<String, String>>>) (baseJson.getObject());
        map.put("com_list", list);
        baseJson.setObject(map);
        return baseJson;
    }

    @Override
    public BaseJson putNewCal(CalendarCustom calendarCustom) {
        String sday = calendarCustom.getSday();
        String eday = calendarCustom.getEday();
        calendarCustom.setSday(updateStringDay(sday));
        calendarCustom.setEday(updateStringDay(eday));
        calendarCustom.setStime(updateStringTime(sday));
        calendarCustom.setEtime(updateStringTime(eday));
        List<CalendarCustom> custom = calendarCustomMapper.selectCalByPhoneInner(calendarCustom);
        if (custom.size() >= 1) return new BaseJson("1");
        calendarCustomMapper.insertNewCal(calendarCustom);
        return new BaseJson("0");
    }

    @Override
    public BaseJson updateCalendarTime(CalendarCustom calendarCustom) {
        List<CalendarCustom> custom = calendarCustomMapper.selectCalByPhoneInner(calendarCustom);
        if (custom.size() >= 2) return new BaseJson("1");
        List<String> days = null;
        List<String> times = null;
        try {
            days = DateUtil.addDays(custom.get(0).getSday(), custom.get(0).getEday(), calendarCustom.getSday());
            times = DateUtil.addTimes(custom.get(0).getStime(), custom.get(0).getEtime(), calendarCustom.getStime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendarCustom.setSday(days.get(0));
        calendarCustom.setEday(days.get(1));
        calendarCustom.setStime(times.get(0));
        calendarCustom.setEtime(times.get(1));
        calendarCustomMapper.updateCalendarTime(calendarCustom);
        return new BaseJson("0");
    }


    //Thu Oct 12 2017 00:00:00 GMT+0800 (CST)
    private String updateStringDay(String day) {
        String sday = day.substring(4, 15);
        if (sday.substring(0, 3).equals("Jan")) sday = sday.replace("Jan", "01");
        if (sday.substring(0, 3).equals("Feb")) sday = sday.replace("Feb", "02");
        if (sday.substring(0, 3).equals("Mar")) sday = sday.replace("Mar", "03");
        if (sday.substring(0, 3).equals("Apr")) sday = sday.replace("Apr", "04");
        if (sday.substring(0, 3).equals("May")) sday = sday.replace("Mar", "05");
        if (sday.substring(0, 3).equals("Jun")) sday = sday.replace("Jun", "06");
        if (sday.substring(0, 3).equals("Jul")) sday = sday.replace("Jul", "07");
        if (sday.substring(0, 3).equals("Aug")) sday = sday.replace("Aug", "08");
        if (sday.substring(0, 3).equals("Sep")) sday = sday.replace("Sep", "09");
        if (sday.substring(0, 3).equals("Oct")) sday = sday.replace("Oct", "10");
        if (sday.substring(0, 3).equals("Nov")) sday = sday.replace("Nov", "11");
        if (sday.substring(0, 3).equals("Dec")) sday = sday.replace("Dec", "12");
        try {
            return DateUtil.simpleDateFormat(sday);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String updateStringTime(String time) {
        String times = time.substring(16, 24);
        try {
            return DateUtil.simpleDateTimeFormat(times);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}
