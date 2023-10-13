package egovframework.jubsu.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.jubsu.model.RIS1201E0302DTO;

@Mapper("RIS1201E02Mapper")
public interface RIS1201E02Mapper {
	List<RIS1201E0302DTO> ris1201E0302datas();
	
}