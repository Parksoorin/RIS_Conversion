package egovframework.pat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pat.mapper.RIS1101E00Mapper;
import egovframework.pat.model.RIS1101DTO;
import egovframework.pat.service.RIS1101E00Service;

@Service("RIS1101E00Service")
public class RIS1101E00ServiceImpl implements RIS1101E00Service {
	
	@Resource(name="RIS1101E00Mapper")
	private RIS1101E00Mapper RIS1101E00Mapper;
	
	@Override
	public List<RIS1101DTO> RIS1101List() {
		System.out.println("test");
		return RIS1101E00Mapper.RIS1101List();
	}
	
}