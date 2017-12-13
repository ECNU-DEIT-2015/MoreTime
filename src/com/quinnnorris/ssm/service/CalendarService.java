package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.CalendarCustom;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

/**
 * Title: CalendarService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 上午8:54 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
public interface CalendarService {


    public BaseJson putNewCal(CalendarCustom calendarCustom);

    public BaseJson updateCalendarTime(CalendarCustom calendarCustom);

    public BaseJson setCalendarPage(HttpSession httpSession);

    public BaseJson setComingMessage(BaseJson baseJson,HttpSession httpSession) throws ParseException;
}
