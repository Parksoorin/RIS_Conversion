package egovframework.login.service;

import java.util.List;
import java.util.Map;

import egovframework.com.model.RisUserDTO;

public interface LoginService {
	RisUserDTO loginId(RisUserDTO dto);
	RisUserDTO userPasswordChk(RisUserDTO dto);
	int userPasswordChange(RisUserDTO dtos);
}