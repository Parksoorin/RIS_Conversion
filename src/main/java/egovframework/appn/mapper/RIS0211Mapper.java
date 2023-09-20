package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.appn.model.*;

@Mapper("RIS0211Mapper")
public interface RIS0211Mapper {
	public List<Ris0211DTO> ris0211Select(RIS0211RequestDTO dto);
	public int ris0211Update(List<Ris0211DTO> list);
	public int ris0211Insert(List<Ris0211DTO> list);
	public int ris0211Delete(List<Ris0211DTO> list);
	public List<String> ris0211YearSelect(RIS0211RequestDTO dto);
}
