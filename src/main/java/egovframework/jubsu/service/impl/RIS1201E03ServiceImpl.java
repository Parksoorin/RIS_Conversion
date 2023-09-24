package egovframework.jubsu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E03Mapper;
import egovframework.jubsu.model.RIS1201E0301DTO;
import egovframework.jubsu.service.RIS1201E03Service;


@Service("RIS1201E03Service")
public class RIS1201E03ServiceImpl implements RIS1201E03Service {
	
	@Resource(name="RIS1201E03Mapper")
	private RIS1201E03Mapper RIS1201E03Mapper;
	
	@Override
	public List<RIS1201E0301DTO> ris1201E0301Data() {
		return RIS1201E03Mapper.ris1201E0301Data();
	}
	
	
}