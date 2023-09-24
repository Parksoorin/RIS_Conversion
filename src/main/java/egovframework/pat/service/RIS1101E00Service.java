package egovframework.pat.service;

import java.util.List;
import java.util.Map;

import egovframework.pat.model.RIS1101DTO;

public interface RIS1101E00Service {

	List<RIS1101DTO> ris1101List();
	RIS1101DTO ris1101DtoDetail(Map<String, Object> selectRowData);
	int updateData(RIS1101DTO dto);
	int insertData(RIS1101DTO dto);
	int findOne(Map<String, Object> ptntId);
	
	
}