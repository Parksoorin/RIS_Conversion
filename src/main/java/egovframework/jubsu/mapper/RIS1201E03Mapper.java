package egovframework.jubsu.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.jubsu.model.RIS1201E0301DTO;


@Mapper("RIS1201E03Mapper")
public interface RIS1201E03Mapper {
	List<RIS1201E0301DTO> ris1201E0301Data();
	
	
}