package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.appn.model.*;

@Mapper("RISAppnChangeMapper")
public interface RISAppnChangeMapper {
	public List<RISAppnChangeDTO> risAppnChangeSelect(RISAppnChangeDTO dto);
}
