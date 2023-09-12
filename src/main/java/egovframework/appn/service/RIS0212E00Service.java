package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;


// 예약 휴일 목록
public interface RIS0212E00Service {
	public List<Ris0212DTO> ris0212Select();
	public int ris0212Process(List<Ris0212DTO> list);
}
