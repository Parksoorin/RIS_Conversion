package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.Ris0210DTO;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;


// 예약 기준 관리
public interface RIS0201E00Service {
	public List<Ris0210DTO> ris0210Select();
	public int ris0210Process(List<Ris0210DTO> list);
}
