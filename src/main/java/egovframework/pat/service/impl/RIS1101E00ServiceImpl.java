package egovframework.pat.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pat.mapper.RIS1101E00Mapper;
import egovframework.pat.model.RIS1101DTO;
import egovframework.pat.service.RIS1101E00Service;

@Service("RIS1101E00Service")
public class RIS1101E00ServiceImpl implements RIS1101E00Service {
	
	@Resource(name="RIS1101E00Mapper")
	private RIS1101E00Mapper RIS1101E00Mapper;
	
	@Override
	public List<RIS1101DTO> ris1101List() {
		return RIS1101E00Mapper.ris1101List();
	}
	
	@Override
	public RIS1101DTO ris1101DtoDetail(Map<String, Object> selectRowData) {
		return RIS1101E00Mapper.ris1101DtoDetail(selectRowData);
	}
	
	@Override
	public int updateData(RIS1101DTO dto) {
		return RIS1101E00Mapper.updateData(dto);
	}
	
	@Override
	public int insertData(RIS1101DTO dto) {
		return RIS1101E00Mapper.insertData(dto);
	}
	
	@Override
	public int findOne(Map<String, Object> ptntId) {
		
		int result = RIS1101E00Mapper.findOne(ptntId);
		// result 값이 1인 경우 중복된 ID가 있다는 의미.
		if(result == 1) return 1;
		// result 값이 1인 경우 중복된 ID가 없다는 것을 의미.
		return 0;
	}
	
}