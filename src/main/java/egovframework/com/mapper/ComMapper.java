package egovframework.com.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.com.model.RISPRGMQ00DTO;
import egovframework.com.model.RISUSERQ00DTO;


@Mapper("ComMapper")
public interface ComMapper {
	List<RISUSERQ00DTO> RisUserList();
	List<RISPRGMQ00DTO> RisPrgmList();
}