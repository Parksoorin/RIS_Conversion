package egovframework.login.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.login.service.LoginService;
import egovframework.com.model.RisUserDTO;
import egovframework.login.mapper.LoginMapper;


@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name = "LoginMapper")
	private LoginMapper loginMapper;

	@Override
	public RisUserDTO loginId(RisUserDTO dto) {
		// TODO Auto-generated method stub
		return loginMapper.loginId(dto);
	}

	@Override
	public RisUserDTO userPasswordChk(RisUserDTO dto) {
		// TODO Auto-generated method stub
		return loginMapper.userPasswordChk(dto);
	}

	@Override
	public int userPasswordChange(RisUserDTO dtos) {
		// TODO Auto-generated method stub
		return loginMapper.userPasswordChange(dtos);
	}
}