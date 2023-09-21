package egovframework.jubsu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E03Mapper;
import egovframework.jubsu.service.RIS1201E03Service;


@Service("RIS1201E03Service")
public class RIS1201E03ServiceImpl implements RIS1201E03Service {
	
	@Resource(name="RIS1201E03Mapper")
	private RIS1201E03Mapper RIS1201E03Mapper;
	
	
}