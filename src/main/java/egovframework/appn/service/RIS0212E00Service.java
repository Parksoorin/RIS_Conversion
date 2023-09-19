package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0212RequestDTO;
import egovframework.appn.model.Ris0213RequestDTO;


// 예약 휴일 목록
public interface RIS0212E00Service {
	public List<Ris0212DTO> ris0212Select(Ris0212RequestDTO dto);
	public int ris0212Process(List<Ris0212DTO> list);
}
