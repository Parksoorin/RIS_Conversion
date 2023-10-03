package egovframework.pandok.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.Ris1101DTO;
import egovframework.pandok.model.Ris1301DTO;
import egovframework.pandok.model.RisUserDTO;

@Mapper("PandokMapper")
public interface PandokMapper {
	List<Ris0601DTO> getRis0601List(Map<String, String> param);
	List<Ris0102DTO> getRis0102List();
	List<RisUserDTO> getRisUserList();
	List<Ris1301DTO> getRis1301List(Map<String, String> param);
	List<Ris1101DTO> getRis1101List();
	int duplicateCheck(Ris0601DTO dto);
	int saveRis0601List(Ris0601DTO dto);
	int saveTempRis1301List(Ris1301DTO dto);
}