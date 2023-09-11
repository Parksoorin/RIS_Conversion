package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

@Mapper("risAppnMapper")
public interface RisAppnMapper {
	
	// 예약 예외 목록
	public List<Ris0213DTO> ris0213Select();
	public int ris0213Update(List<Ris0213DTO> list);
	public int ris0213Insert(List<Ris0213DTO> list);
	public int ris0213Delete(List<Ris0213DTO> list);
	
	// 예약 휴일 목록
	public List<Ris0212DTO> ris0212Select();
	public int ris0212Update(List<Ris0212DTO> list);
	public int ris0212Insert(List<Ris0212DTO> list);
	public int ris0212Delete(List<Ris0212DTO> list);
	

}
