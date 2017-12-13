package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.ProinfoCustom;
import com.quinnnorris.ssm.bean.ProjectCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: ProjectCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:34 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("projectCustomMapper")
public interface ProjectCustomMapper {
    public void insertPro(ProjectCustom projectCustom);

    public List<ProjectCustom> selectProByPhoneTypes(ProjectCustom projectCustom);

    public ProjectCustom selectProByPronumber(ProjectCustom projectCustom);

    public void updateTypesByPhone(ProjectCustom projectCustom);

    public List<ProjectCustom> selectProByPhone(ProjectCustom projectCustom);
}
