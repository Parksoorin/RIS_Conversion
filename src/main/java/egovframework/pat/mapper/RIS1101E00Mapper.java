package egovframework.pat.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.pat.model.RIS1101DTO;

@Mapper("RIS1101E00Mapper")
public interface RIS1101E00Mapper {
	List<RIS1101DTO> RIS1101List();
}