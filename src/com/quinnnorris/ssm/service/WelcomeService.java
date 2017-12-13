package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.controller.BaseController;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

/**
 * Title: WelcomeService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午9:53 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
public interface WelcomeService {

    public BaseJson getWelcomeModel(Model model, UserCustom userCustom);

    public void updateUserHeadp(UserCustom userCustom, HttpSession httpSession);
}
