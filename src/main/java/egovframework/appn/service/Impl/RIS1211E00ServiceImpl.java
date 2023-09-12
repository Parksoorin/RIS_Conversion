package egovframework.appn.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS1211E00Mapper;
import egovframework.appn.mapper.RisAppnMapper;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.model.Ris1211DTO;
import egovframework.appn.service.RIS1211E00Service;
import egovframework.appn.service.RisAppnService;
import egovframework.appn.util.RisAppnUtil;
import lombok.extern.slf4j.Slf4j;

// 예약 관리
@Service("RIS1211E00Service")
@Slf4j
public class RIS1211E00ServiceImpl implements RIS1211E00Service{

	@Resource(name="RIS1211E00Mapper")
	private RIS1211E00Mapper mapper;

	@Override
	public List<Ris1211DTO> ris1211Select() {
		return null;
	}

	@Override
	public int ris1211Process(List<Ris1211DTO> list) {
		return 0;
	}

	
	


}
