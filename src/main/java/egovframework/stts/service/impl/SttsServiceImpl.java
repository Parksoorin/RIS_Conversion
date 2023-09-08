package egovframework.stts.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.stts.mapper.SttsMapper;
import egovframework.stts.service.SttsService;

@Service("SttsService")
public class SttsServiceImpl implements SttsService {
	@Resource(name="SttsMapper")
	private SttsMapper sttsMapper;
}
