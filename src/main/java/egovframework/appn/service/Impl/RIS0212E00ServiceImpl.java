package egovframework.appn.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS0212E00Mapper;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0212RequestDTO;
import egovframework.appn.model.Ris0213RequestDTO;
import egovframework.appn.service.RIS0212E00Service;
import lombok.extern.slf4j.Slf4j;

// 휴일 기준관리
@Service("RIS0212E00Service")
@Slf4j
public class RIS0212E00ServiceImpl implements RIS0212E00Service{

	@Resource(name="RIS0212E00Mapper")
	private RIS0212E00Mapper mapper;

	@Override
	public List<Ris0212DTO> ris0212Select(Ris0212RequestDTO dto) {
		return mapper.ris0212Select(dto);
	}
	
	

	@Override
	public int ris0212Process(final List<Ris0212DTO> list) {
		int result = 0;
		List<Ris0212DTO> insertList = new ArrayList<>();
		List<Ris0212DTO> updateList = new ArrayList<>();
		List<Ris0212DTO> deleteList = new ArrayList<>();
		
		for(Ris0212DTO dto : list) {
			String flag = dto.getFlag();	
			switch(flag) {
			case "입력":
				insertList.add(dto);
				result++;
				break;
			case "수정":
				updateList.add(dto);
				result++;
				break;
			case "삭제":
				deleteList.add(dto);
				result++;
				break;
			default:
				new IllegalArgumentException("ris0212Process 잘못된 요청입니다.(Ris0212E00Service)");
			}
		};
		
		if(insertList.size()>0) {
			mapper.ris0212Insert(insertList);
		}
		
		if(updateList.size()>0) {
			mapper.ris0212Update(updateList);
		}
		
		if(deleteList.size()>0) {
			mapper.ris0212Delete(deleteList);
		}
		
		return result;
	}
	
	


}
