package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

@Mapper("risAppnMapper")
public interface RisAppnMapper {
	public List<Ris0213DTO> ris0213FindAll();
}
