package egovframework.login.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.com.model.RisUserDTO;


@Mapper("LoginMapper")
public interface LoginMapper {
	RisUserDTO loginId(RisUserDTO dto);
}
