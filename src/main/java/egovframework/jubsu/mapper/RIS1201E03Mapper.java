package egovframework.jubsu.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.jubsu.model.RIS1201E0301DTO;
import egovframework.jubsu.model.RIS1201E0302DTO;


@Mapper("RIS1201E03Mapper")
public interface RIS1201E03Mapper {
	List<RIS1201E0301DTO> ris1201E0301Data();
	RIS1201E0302DTO ris1201DtoDetail(Map<String, Object> selectRowData);
	
}