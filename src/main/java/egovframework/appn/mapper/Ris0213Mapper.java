package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

@Mapper("ris0213Mapper")
public interface Ris0213Mapper {
	public List<Ris0213DTO> findAll();
}
