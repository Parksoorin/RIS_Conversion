package egovframework.stts.service;

import java.util.List;
import java.util.Map;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;
import egovframework.stts.model.RisViewDocDTO;

public interface SttsService {
	List<Ris1201DTO> getDvsnSttsList(Map<String, String> param);
	List<Ris1201DTO> getEqpmSttsList(Map<String, String> param);
	List<Ris1201DTO> getViewDocSttsList(Map<String, String> param);
	List<Ris0102DTO> getRisDvsnList();
	List<Ris0102DTO> getRisRoomList();
	List<Ris0102DTO> getRisEqpmList();
	List<RisViewDocDTO> getRisViewDocList();
}
