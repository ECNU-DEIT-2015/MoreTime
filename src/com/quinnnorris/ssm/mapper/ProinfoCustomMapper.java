package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.ProinfoCustom;
import org.springframework.stereotype.Repository;

/**
 * Title: ProinfoCusotmMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:34 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("proinfoCusotmMapper")
public interface ProinfoCustomMapper {

    public void insertProinfo(ProinfoCustom proinfoCustom);

    public ProinfoCustom selectProinfoByPhonePronumber(ProinfoCustom proinfoCustom);
}
