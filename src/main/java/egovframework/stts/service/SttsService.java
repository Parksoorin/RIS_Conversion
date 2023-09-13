package egovframework.stts.service;

import java.util.List;
import java.util.Map;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;

public interface SttsService {
	List<Ris1201DTO> getRis1201List(Map<String, String> param);
	List<Ris0102DTO> getRisImgnList();
	List<Ris0102DTO> getRisRoomList();
}
