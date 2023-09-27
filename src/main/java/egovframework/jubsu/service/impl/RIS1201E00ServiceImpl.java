package egovframework.jubsu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E00Mapper;
import egovframework.jubsu.service.RIS1201E00Service;


@Service("RIS1201E00Service")
public class RIS1201E00ServiceImpl implements RIS1201E00Service {
	
	@Resource(name="RIS1201E00Mapper")
	private RIS1201E00Mapper RIS1201E00Mapper;
	
}