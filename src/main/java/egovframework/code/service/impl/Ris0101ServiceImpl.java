package egovframework.code.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.code.mapper.Ris0101Mapper;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.service.Ris0101Service;

@Service("ris0101Service")
public class Ris0101ServiceImpl implements Ris0101Service{

	@Resource(name="ris0101Mapper")
	private Ris0101Mapper ris0101Mapper;
	
	@Override
	public List<Ris0101DTO> findAll() {
		System.out.println("imple findAll >>>>>");
		return ris0101Mapper.findListAll();
	}
	
}
