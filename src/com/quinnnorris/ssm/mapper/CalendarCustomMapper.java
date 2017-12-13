package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.CalendarCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: CalendarCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 上午10:43 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("calendarCustomMapper")
public interface CalendarCustomMapper {


    public void insertNewCal(CalendarCustom calendarCustom);

    public int getAllCalByPhone(CalendarCustom calendarCustom);

    public List<CalendarCustom> selectCalByPhoneInner(CalendarCustom calendarCustom);

    public void updateCalendarTime(CalendarCustom calendarCustom);

    public List<CalendarCustom> selectCalByPhone(CalendarCustom calendarCustom);
}
