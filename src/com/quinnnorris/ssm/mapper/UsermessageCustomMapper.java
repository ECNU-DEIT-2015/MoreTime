package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.UsermessageCustom;
import org.springframework.stereotype.Repository;

/**
 * Title: UsermessageCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/30 下午1:51 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("usermessageCustomMapper")
public interface UsermessageCustomMapper {

    public UsermessageCustom selectUserMessageByPhone(UsermessageCustom usermessageCustom);

    public void insertMessageByPhone(UsermessageCustom usermessageCustom);

    public void updateUserSchool(UsermessageCustom usermessageCustom);

    public void updateUserLocal(UsermessageCustom usermessageCustom);

    public void updateUserSign(UsermessageCustom usermessageCustom);

    public void updateUserBgimage(UsermessageCustom usermessageCustom);

}
