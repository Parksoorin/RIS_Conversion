package egovframework.code.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.code.model.Ris0101DTO;

@Mapper("ris0101Mapper")
public interface Ris0101Mapper {
	public List<Ris0101DTO> findListAll();
}
