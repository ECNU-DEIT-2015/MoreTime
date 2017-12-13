package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.CalendarCustom;
import com.quinnnorris.ssm.service.Implement.CalendarServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

/**
 * Title: CalendarController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 上午8:52 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class CalendarController {

    @Autowired
    CalendarServiceImpl calendarService;

    @RequestMapping("/calendar")
    public String toCalenderPage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "calendar";
    }


    @RequestMapping(value = "/calendar", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson addCalenderPage(HttpSession httpSession) {
        BaseJson baseJson = calendarService.setCalendarPage(httpSession);
        try {
            baseJson = calendarService.setComingMessage(baseJson, httpSession);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return baseJson;
    }

    @RequestMapping(value = "/calendar/put", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson putNewInCalendar(@RequestParam String inner, @RequestParam String s_day,
                                     @RequestParam String e_day, HttpSession httpSession) {
        CalendarCustom calendarCustom = new CalendarCustom();
        calendarCustom.setPhone((String) httpSession.getAttribute("phone"));
        calendarCustom.setSday(s_day);
        calendarCustom.setEday(e_day);
        calendarCustom.setInner(inner);
        return calendarService.putNewCal(calendarCustom);
    }

    @RequestMapping(value = "/calendar/update", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson updateCalendarTime(@RequestParam String inner, @RequestParam String dayup,
                                       @RequestParam String timeup, HttpSession httpSession) {
        CalendarCustom calendarCustom = new CalendarCustom();
        calendarCustom.setPhone((String) httpSession.getAttribute("phone"));
        calendarCustom.setInner(inner);
        calendarCustom.setSday(dayup);
        calendarCustom.setStime(timeup);
        return calendarService.updateCalendarTime(calendarCustom);
    }

}
