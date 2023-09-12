package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;
//예약 관리
@Mapper("RIS1211E00Mapper")
public interface RIS1211E00Mapper {
	public List<Ris1211DTO> ris1211Select();
	public int ris1211Update(List<Ris1211DTO> list);
	public int ris1211Insert(List<Ris1211DTO> list);
	public int ris1211Delete(List<Ris1211DTO> list);
}
