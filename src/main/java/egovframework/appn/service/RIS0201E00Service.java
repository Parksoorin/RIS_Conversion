package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.RIS0210RequestDTO;
import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.RISAppnChangeDTO;
import egovframework.appn.model.Ris0210DTO;
import egovframework.appn.model.Ris0211DTO;


// 예약 기준 관리
public interface RIS0201E00Service {
	public List<Ris0210DTO> ris0210Select(RIS0210RequestDTO dto);
	
	public List<RISAppnChangeDTO> risAppnChangeSelect(RISAppnChangeDTO dto);
	public int ris0210Process(List<Ris0210DTO> list);
	public int ris0211Process(List<Ris0211DTO> list);
	public List<Ris0211DTO> ris0211Select(RIS0211RequestDTO dto);
	public List<String> ris0211YearSelect(RIS0211RequestDTO dto);

}
