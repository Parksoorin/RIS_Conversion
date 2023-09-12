package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.Ris1211DTO;


// 예약 관리
public interface RIS1211E00Service {	
	public List<Ris1211DTO> ris1211Select();
	public int ris1211Process(List<Ris1211DTO> list);
}
