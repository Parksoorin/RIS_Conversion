package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;
//예약 휴일 목록
@Mapper("RIS0212E00Mapper")
public interface RIS0212E00Mapper {
	
	// 예약 휴일 목록
	public List<Ris0212DTO> ris0212Select(Ris0212RequestDTO dto);
	public int ris0212Update(List<Ris0212DTO> list);
	public int ris0212Insert(List<Ris0212DTO> list);
	public int ris0212Delete(List<Ris0212DTO> list);
	

}
