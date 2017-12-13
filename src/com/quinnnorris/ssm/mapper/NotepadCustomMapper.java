package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.NotepadCustom;
import com.quinnnorris.ssm.bean.TaskCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: NotepadCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午12:29 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("notepadCustomMapper")
public interface NotepadCustomMapper {

    public NotepadCustom selectNotByPhoneTitlesType(NotepadCustom notepadCustom);

    public List<NotepadCustom> selectNotByPhoneType(NotepadCustom notepadCustom);

    public void insertNewNotepad(NotepadCustom notepadCustom);

    public List<NotepadCustom> selectNotByPhoneTypeLimit(NotepadCustom notepadCustom);

    public void updateNotByPhoneTitlesType(NotepadCustom notepadCustom);

}
