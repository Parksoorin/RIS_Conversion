package egovframework.jubsu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E02Mapper;
import egovframework.jubsu.service.RIS1201E02Service;


@Service("RIS1201E02Service")
public class RIS1201E02ServiceImpl implements RIS1201E02Service {
	
	@Resource(name="RIS1201E02Mapper")
	private RIS1201E02Mapper RIS1201E02Mapper;
	
}