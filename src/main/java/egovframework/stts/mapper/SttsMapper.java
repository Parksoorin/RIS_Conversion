package egovframework.stts.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;

@Mapper("SttsMapper")
public interface SttsMapper {
	List<Ris1201DTO> getRis1201List(Map<String, String> param);
	List<Ris0102DTO> getRisDvsnList();
	List<Ris0102DTO> getRisRoomList();
	List<Ris0102DTO> getRisEqpmList();
}
