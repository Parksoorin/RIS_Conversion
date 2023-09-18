package egovframework.stts.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;
import egovframework.stts.model.RisViewDocDTO;

@Mapper("SttsMapper")
public interface SttsMapper {
	List<Ris1201DTO> getDvsnSttsList(Map<String, String> param);
	List<Ris1201DTO> getEqpmSttsList(Map<String, String> param);
	List<Ris1201DTO> getViewDocSttsList(Map<String, String> param);
	List<Ris0102DTO> getRisDvsnList();
	List<Ris0102DTO> getRisRoomList();
	List<Ris0102DTO> getRisEqpmList();
	List<RisViewDocDTO> getRisViewDocList();
}
