package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS0212E00Mapper;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.service.RIS0212E00Service;
import lombok.extern.slf4j.Slf4j;

// 휴일 기준관리
@Service("RIS0212E00Service")
@Slf4j
public class RIS0212E00ServiceImpl implements RIS0212E00Service{

	@Resource(name="RIS0212E00Mapper")
	private RIS0212E00Mapper mapper;

	@Override
	public List<Ris0212DTO> ris0212Select() {
		return mapper.ris0212Select();
	}
	
	

	@Override
	public int ris0212Process(final List<Ris0212DTO> list) {
		int result = 0;
		return result;
	}
	
	


}
