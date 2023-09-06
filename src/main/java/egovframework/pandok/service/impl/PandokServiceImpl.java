package egovframework.pandok.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pandok.mapper.PandokMapper;
import egovframework.pandok.service.PandokService;

@Service("PandokService")
public class PandokServiceImpl implements PandokService {
	@Resource(name="PandokMapper")
	private PandokMapper pandokMapper;
	
	@Override
	public int getRis0601List() {
		return pandokMapper.getRis0601List();
	}
}