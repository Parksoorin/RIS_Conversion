package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS1211E00Mapper;
import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.Ris1211DTO;
import egovframework.appn.model.Ris1211List2DTO;
import egovframework.appn.model.Ris1211List2RequestDTO;
import egovframework.appn.model.Ris1211List3DTO;
import egovframework.appn.model.Ris1211List3RequestDTO;
import egovframework.appn.model.Ris1211RequestDTO;
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
	public List<Ris1211DTO> ris1211Select(Ris1211RequestDTO dto) {
		return mapper.ris1211Select(dto);
	}


	@Override
	public List<Ris1211List2DTO> ris1211SelectList2(Ris1211List2RequestDTO dto) {
		return mapper.ris1211SelectList2(dto);
	}


	@Override
	public List<Ris1211List3DTO> ris1211SelectList3(Ris1211List3RequestDTO dto) {
		return mapper.ris1211SelectList3(dto);
	}


	

	
	


}
