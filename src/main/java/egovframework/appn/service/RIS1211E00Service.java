package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.Ris1211DTO;
import egovframework.appn.model.Ris1211List2DTO;
import egovframework.appn.model.Ris1211List2RequestDTO;
import egovframework.appn.model.Ris1211List3DTO;
import egovframework.appn.model.Ris1211List3RequestDTO;
import egovframework.appn.model.Ris1211RequestDTO;


// 예약 관리
public interface RIS1211E00Service {	
	public List<Ris1211DTO> ris1211Select(Ris1211RequestDTO dto);
	public int ris1211Process(List<Ris1211DTO> list);
	
	public List<Ris1211List2DTO> ris1211SelectList2(Ris1211List2RequestDTO dto);
	public List<Ris1211List3DTO> ris1211SelectList3(Ris1211List3RequestDTO dto);



}
