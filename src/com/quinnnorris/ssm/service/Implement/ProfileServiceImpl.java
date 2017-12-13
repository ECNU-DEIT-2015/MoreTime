package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.bean.UsermessageCustom;
import com.quinnnorris.ssm.mapper.UserCustomMapper;
import com.quinnnorris.ssm.mapper.UsermessageCustomMapper;
import com.quinnnorris.ssm.service.ProfileService;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

/**
 * Title: ProfileServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/30 下午1:41 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("profileServiceImpl")
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    UsermessageCustomMapper usermessageCustomMapper;

    @Autowired
    UserCustomMapper userCustomMapper;

    @Override
    public void setModels(Model model, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone((String) httpSession.getAttribute("phone"));
        UserCustom custom = userCustomMapper.selectUserByPhone(userCustom);
        model.addAttribute("regtime", "");
        try {
            model.addAttribute("regtime", DateUtil.proshowDateFormat(custom.getRegtime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        model.addAttribute("email", custom.getEmail());
        model.addAttribute("headp", custom.getHeadp());
        model.addAttribute("username", custom.getUsername());

        UsermessageCustom usermessageCustom = new UsermessageCustom();
        usermessageCustom.setPhone((String) httpSession.getAttribute("phone"));
        UsermessageCustom messageCustom = usermessageCustomMapper.selectUserMessageByPhone(usermessageCustom);
        if(messageCustom == null){
            usermessageCustom.setBgimage("/headp/infosbg.jpg");
            usermessageCustom.setLocal("");
            usermessageCustom.setSchool("");
            usermessageCustom.setSign("不辜负自己在每一天");
            usermessageCustomMapper.insertMessageByPhone(usermessageCustom);
            messageCustom = usermessageCustomMapper.selectUserMessageByPhone(usermessageCustom);
        }
        model.addAttribute("bgimage", messageCustom.getBgimage());
        model.addAttribute("local", messageCustom.getLocal());
        model.addAttribute("school", messageCustom.getSchool());
        model.addAttribute("sign", messageCustom.getSign());
    }

    @Override
    public BaseJson changingUserSchool(UsermessageCustom usermessageCustom) {
        usermessageCustomMapper.updateUserSchool(usermessageCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(usermessageCustom.getSchool());
        return baseJson;
    }

    @Override
    public BaseJson changingUserLocal(UsermessageCustom usermessageCustom) {
        usermessageCustomMapper.updateUserLocal(usermessageCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(usermessageCustom.getLocal());
        return baseJson;
    }

    @Override
    public BaseJson changingUserSign(UsermessageCustom usermessageCustom) {
        usermessageCustomMapper.updateUserSign(usermessageCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(usermessageCustom.getSign());
        return baseJson;
    }

    @Override
    public BaseJson changingUserBgimage(UsermessageCustom usermessageCustom) {
        usermessageCustomMapper.updateUserBgimage(usermessageCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(usermessageCustom.getBgimage());
        return baseJson;
    }

    @Override
    public BaseJson changingUserEmail(UserCustom userCustom) {
        userCustomMapper.updateUserEmail(userCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(userCustom.getEmail());
        return baseJson;
    }
}
