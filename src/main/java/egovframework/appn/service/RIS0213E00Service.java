package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.Ris0213DTO;


// 예약 예외 목록
public interface RIS0213E00Service {
	public List<Ris0213DTO> ris0213Select();
	public int ris0213Process(List<Ris0213DTO> list);
}
