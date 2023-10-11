package egovframework.login.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.login.model.MenuDTO;
import egovframework.login.model.RisUserDTO;


@Mapper("LoginMapper")
public interface LoginMapper {
	RisUserDTO loginId(RisUserDTO dto);
	RisUserDTO userPasswordChk(RisUserDTO dto);
	int userPasswordChange(RisUserDTO dtos);
	List<MenuDTO> menuList(RisUserDTO result);
}
