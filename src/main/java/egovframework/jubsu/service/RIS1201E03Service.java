package egovframework.jubsu.service;

import java.util.List;
import java.util.Map;

import egovframework.jubsu.model.RIS0102JoinRIS1201DTO;
import egovframework.jubsu.model.RIS1201DTO;
import egovframework.jubsu.model.RIS1201E0301DTO;
import egovframework.jubsu.model.RIS1201E0302DTO;

public interface RIS1201E03Service {
	
	List<RIS1201E0301DTO> ris1201E0301Data();
	List<RIS1201E0302DTO> ris1201DtoDetail(Map<String, Object> selectRowData);
	int updateData(RIS1201DTO dto);
	List<RIS0102JoinRIS1201DTO> ris0102JoinRis1201PopData();
	int changePkris();
	int insertData(RIS1201DTO dto);
	
}