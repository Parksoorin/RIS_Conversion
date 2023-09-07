package egovframework.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mapper.ComMapper;
import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;


@Service("ComService")
public class ComServiceImpl implements ComService {
	
	@Resource(name = "ComMapper")
	private ComMapper comMapper;
	@Override
	public List<RisUserDTO> RisUserList() {
		// TODO Auto-generated method stub
		return comMapper.RisUserList();
	}
}