package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

// 예약 기준 관리
@Mapper("RIS0201E00Mapper")
public interface RIS0201E00Mapper {
	
	public List<Ris0210DTO> ris0210Select(RIS0210RequestDTO dto);
	public int ris0210Update(List<Ris0210DTO> list);
	public int ris0210Insert(List<Ris0210DTO> list);
	public int ris0210Delete(List<Ris0210DTO> list);


}
