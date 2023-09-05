package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.Ris0213Mapper;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.Ris0213Service;

@Service("ris0213Service")
public class Ris0213ServiceImpl implements Ris0213Service{

	@Resource(name="ris0213Mapper")
	private Ris0213Mapper ris0213Mapper;
	
	@Override
	public List<Ris0213DTO> findAll() {
		return ris0213Mapper.findAll();
	}
	
}
