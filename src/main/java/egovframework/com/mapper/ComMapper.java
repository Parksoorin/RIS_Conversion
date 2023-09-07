package egovframework.com.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.com.model.RisUserDTO;


@Mapper("ComMapper")
public interface ComMapper {
	List<RisUserDTO> RisUserList();
}