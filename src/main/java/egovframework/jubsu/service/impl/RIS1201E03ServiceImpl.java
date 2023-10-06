package egovframework.jubsu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.jubsu.mapper.RIS1201E03Mapper;
import egovframework.jubsu.model.RIS1201E0301DTO;
import egovframework.jubsu.model.RIS1201E0302DTO;
import egovframework.jubsu.service.RIS1201E03Service;


@Service("RIS1201E03Service")
public class RIS1201E03ServiceImpl implements RIS1201E03Service {
	
	@Resource(name="RIS1201E03Mapper")
	private RIS1201E03Mapper RIS1201E03Mapper;
	
	@Override
	public List<RIS1201E0301DTO> ris1201E0301Data() {
		return RIS1201E03Mapper.ris1201E0301Data();
	}
	
	@Override
	public List<RIS1201E0302DTO> ris1201DtoDetail(Map<String, Object> selectRowData) {
		return RIS1201E03Mapper.ris1201DtoDetail(selectRowData);
	}
	
	@Override
	public int updateData(RIS1201E0302DTO dto) {
		return RIS1201E03Mapper.updateData(dto);
	}
	
	
}