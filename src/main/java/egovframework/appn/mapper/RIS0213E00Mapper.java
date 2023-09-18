package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;
//예약 예외 목록
@Mapper("RIS0213E00Mapper")
public interface RIS0213E00Mapper {
	
	// 예약 예외 목록
	public List<Ris0213DTO> ris0213Select(Ris0213RequestDTO dto);
	public int ris0213Update(List<Ris0213DTO> list);
	public int ris0213Insert(List<Ris0213DTO> list);
	public int ris0213Delete(List<Ris0213DTO> list);

	

}
