package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;
//예약 관리
@Mapper("RIS1211E00Mapper")
public interface RIS1211E00Mapper {
	public List<Ris1211DTO> ris1211Select(Ris1211RequestDTO dto);
	public int ris1211Update(List<Ris1211DTO> list);
	public int ris1211Insert(List<Ris1211DTO> list);
	public int ris1211Delete(List<Ris1211DTO> list);
	
	
	public List<Ris1211List2DTO> ris1211SelectList2(Ris1211List2RequestDTO dto);
	public List<Ris1211List3DTO> ris1211SelectList3(Ris1211List3RequestDTO dto);
	
	
}
