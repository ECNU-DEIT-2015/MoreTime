package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.UserCustom;
import org.springframework.stereotype.Repository;

/**
 * Title: UserCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午2:10 星期一
 * @author: quinn_norris
 * @version: 1.0
 */

@Repository("userCustomMapper")
public interface UserCustomMapper {

    public UserCustom selectUserByPhoneAndPW(UserCustom userCustom);

    public UserCustom selectUserByPhone(UserCustom userCustom);

    public void insertUserReturnId(UserCustom userCustom);

    public void updateUserLogintime(UserCustom userCustom);

    public void updateUserHeadp(UserCustom userCustom);

    public void updateUserUsername(UserCustom userCustom);

    public void updateUserUsertype(UserCustom userCustom);

    public void updateUserPW(UserCustom userCustom);

    public void updateUserEmail(UserCustom userCustom);

}