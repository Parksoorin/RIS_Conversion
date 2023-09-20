package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS1211E00Mapper;
import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.Ris1211DTO;
import egovframework.appn.service.RIS1211E00Service;
import lombok.extern.slf4j.Slf4j;

// 예약 관리
@Service("RIS1211E00Service")
@Slf4j
public class RIS1211E00ServiceImpl implements RIS1211E00Service{

	@Resource(name="RIS1211E00Mapper")
	private RIS1211E00Mapper mapper;


	@Override
	public int ris1211Process(List<Ris1211DTO> list) {
		return 0;
	}


	@Override
	public List<Ris1211DTO> ris1211Select(RIS0211RequestDTO dto) {
		return null;
	}


	

	
	


}
