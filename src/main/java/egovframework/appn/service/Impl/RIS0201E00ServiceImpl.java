package egovframework.appn.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS0201E00Mapper;
import egovframework.appn.model.Ris0210DTO;
import egovframework.appn.service.RIS0201E00Service;
import lombok.extern.slf4j.Slf4j;

// 예약 기준관리
@Service("RIS0201E00Service")
@Slf4j
public class RIS0201E00ServiceImpl implements RIS0201E00Service{

	@Resource(name="RIS0201E00Mapper")
	private RIS0201E00Mapper mapper;

	@Override
	public List<Ris0210DTO> ris0210Select() {
		return null;
	}

	@Override
	public int ris0210Process(List<Ris0210DTO> list) {
		return 0;
	}

	
	


}
