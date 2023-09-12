package egovframework.appn.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS0213E00Mapper;
import egovframework.appn.mapper.RisAppnMapper;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RIS0213E00Service;
import egovframework.appn.service.RisAppnService;
import egovframework.appn.util.RisAppnUtil;
import lombok.extern.slf4j.Slf4j;

// 예외 기준 관리
@Service("RIS0213E00Service")
@Slf4j
public class RIS0213E00ServiceImpl implements RIS0213E00Service{

	@Resource(name="RIS0213E00Mapper")
	private RIS0213E00Mapper mapper;
	
	// 예약 예외 기준 관리

	@Override
	public List<Ris0213DTO> ris0213Select() {
		return mapper.ris0213Select();
	}

	
	@Override
	public int ris0213Process(final List<Ris0213DTO> list) {
		
		int result = 0;
		List<Ris0213DTO> insertList = new ArrayList<>();
		List<Ris0213DTO> updateList = new ArrayList<>();
		List<Ris0213DTO> deleteList = new ArrayList<>();
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		log.info("Ris0213 Process --- 1 {}", result);
		for(Ris0213DTO dto : list) {
			String flag = dto.getFlag();	
			switch(flag) {
			case "입력":
				insertList.add(dto);
				break;
			case "수정":
				updateList.add(dto);
				break;
			case "삭제":
				deleteList.add(dto);
				break;
			default:
				new IllegalArgumentException("ris0213Process 잘못된 요청입니다.(RisAppnService)");
			}
		};
		
		if(insertList.size()>0) {
			result += mapper.ris0213Insert(insertList);
		}
		
		if(updateList.size()>0) {
			result += mapper.ris0213Update(updateList);
		}
		
		if(deleteList.size()>0) {
			result += mapper.ris0213Delete(deleteList);
		}
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		log.info("Ris0213 Process --- 2 {}", result);
		
		return result;
	}
	
	
	
	

	



}
