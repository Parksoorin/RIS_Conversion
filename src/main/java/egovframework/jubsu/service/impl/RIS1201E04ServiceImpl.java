package egovframework.jubsu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E04Mapper;
import egovframework.jubsu.service.RIS1201E04Service;


@Service("RIS1201E04Service")
public class RIS1201E04ServiceImpl implements RIS1201E04Service {
	
	@Resource(name="RIS1201E04Mapper")
	private RIS1201E04Mapper RIS1201E04Mapper;
	
	
	
}