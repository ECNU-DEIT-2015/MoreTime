package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.SubjobCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: SujobCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午2:35 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("subjobCustomMapper")
public interface SubjobCustomMapper {
    public void insertSubjob(SubjobCustom subjobCustom);

    public List<SubjobCustom> selectSubjobByPhonePronumber(SubjobCustom subjobCustom);

    public List<SubjobCustom> selectSubjobByPhonePronumberPerson(SubjobCustom subjobCustom);

    public List<SubjobCustom> selectpersoncountByPronumber(SubjobCustom subjobCustom);

    public SubjobCustom selectallcountByPronumber(SubjobCustom subjobCustom);

    public List<SubjobCustom> selectSubjobByPhone(SubjobCustom subjobCustom);
}
