package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.bean.UsermessageCustom;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession; /**
 * Title: ProfileService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/30 下午1:41 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
public interface ProfileService {
    public void setModels(Model model, HttpSession httpSession);

    public BaseJson changingUserSchool(UsermessageCustom usermessageCustom);

    public BaseJson changingUserLocal(UsermessageCustom usermessageCustom);

    public BaseJson changingUserSign(UsermessageCustom usermessageCustom);

    public BaseJson changingUserBgimage(UsermessageCustom usermessageCustom);

    public BaseJson changingUserEmail(UserCustom userCustom);
}
