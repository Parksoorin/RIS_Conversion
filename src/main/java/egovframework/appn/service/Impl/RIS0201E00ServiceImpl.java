package egovframework.appn.service.Impl;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.appn.mapper.RIS0201E00Mapper;
import egovframework.appn.mapper.RIS0211Mapper;
import egovframework.appn.mapper.RISAppnChangeMapper;
import egovframework.appn.mapper.RISAppnCommonMapper;
import egovframework.appn.model.RIS0210RequestDTO;
import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.RISAppnCalDTO;
import egovframework.appn.model.RISAppnCalRequestDTO;
import egovframework.appn.model.RISAppnChangeDTO;
import egovframework.appn.model.RISAppnChangeRequestDTO;
import egovframework.appn.model.Ris0210DTO;
import egovframework.appn.model.Ris0210FormDTO;
import egovframework.appn.model.Ris0211DTO;
import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.service.RIS0201E00Service;
import lombok.extern.slf4j.Slf4j;

// 예약 기준관리
@Service("RIS0201E00Service")
@Slf4j
public class RIS0201E00ServiceImpl implements RIS0201E00Service{

	@Resource(name="RIS0201E00Mapper")
	private RIS0201E00Mapper mapper;

	@Resource(name="RIS0211Mapper")
	private RIS0211Mapper ris0211Mapper;

	@Resource(name="RISAppnChangeMapper")
	private RISAppnChangeMapper risAppnChangeMapper;
	
	@Resource(name="RISAppnCommonMapper")
	private RISAppnCommonMapper risAppnCommonMapper;
	
	
	@Override
	public List<Ris0210DTO> ris0210Select(RIS0210RequestDTO dto) {
		return mapper.ris0210Select(dto);
	}
	
	@Override
	public List<RISAppnChangeDTO> risAppnChangeSelect(RISAppnChangeRequestDTO dto) {
		return risAppnChangeMapper.risAppnChangeSelect(dto);
	}
	
	@Override
	public List<String> ris0211YearSelect(RIS0211RequestDTO dto) {

		return ris0211Mapper.ris0211YearSelect(dto);
	}
	
	@Override
	public int ris0210Process(List<Ris0210DTO> list) {
		int result = 0;
		List<Ris0210DTO> insertList = new ArrayList<>();
		List<Ris0210DTO> updateList = new ArrayList<>();
		List<Ris0210DTO> deleteList = new ArrayList<>();
		
		for(Ris0210DTO dto : list) {
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
				new IllegalArgumentException("ris0210Process 잘못된 요청입니다.(Ris0201E00Service)");
			}
		};
		
		if(insertList.size()>0) {
			mapper.ris0210Insert(insertList);
		}
		
		if(updateList.size()>0) {
			mapper.ris0210Update(updateList);
		}
		
		if(deleteList.size()>0) {
			mapper.ris0210Delete(deleteList);
		}
		
		return result;
	}

	
	@Override
	public List<Ris0211DTO> ris0211Select(RIS0211RequestDTO dto) {
		return ris0211Mapper.ris0211Select(dto);
	}
	
	
	
	
	@Override
	public int ris0211Process(List<Ris0211DTO> list) {
		int result = 0;
		List<Ris0211DTO> insertList = new ArrayList<>();
		List<Ris0211DTO> updateList = new ArrayList<>();
		List<Ris0211DTO> deleteList = new ArrayList<>();
		
		for(Ris0211DTO dto : list) {
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
				new IllegalArgumentException("ris0211Process 잘못된 요청입니다.(Ris0201E00Service)");
			}
		};
		
		if(insertList.size()>0) {
			ris0211Mapper.ris0211Insert(insertList);
		}
		
		if(updateList.size()>0) {
			ris0211Mapper.ris0211Update(updateList);
		}
		
		if(deleteList.size()>0) {
			ris0211Mapper.ris0211Delete(deleteList);
		}
		
		return result;
	}

	@Override
	public String ris0210FormProcess(Ris0210FormDTO dto) {
		List<String> weekList = new ArrayList<>();
		List<Ris0210FormDTO> list = new ArrayList<>();
		dto.setHsptId("A001");
		if(dto.isWeekBatch()) {
			weekList = List.of("Monday", "Tuesday","Wednesday", "Thursday", "Friday");
		} else {
			weekList = List.of(dto.getDayOfWeek());
		}
		
		
		System.out.println(weekList.toString());
		

		int count = mapper.ris0210Duplicate(dto);
		System.out.println(count);
		switch(dto.getGubun()) {
		
		case "new-create":
			if(count>0) {
			mapper.ris0210DeleteByDate(dto);
			}
			break;
		
		case "addition-create" :
			if(count > 0) {
				System.out.println("duplicate");
				return "duplicate";
			}
			break;
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");

        try {
            LocalTime startTime = LocalTime.parse(dto.getStartTime(), formatter); 
            LocalTime endTime = LocalTime.parse(dto.getEndTime(), formatter);
            LocalTime restStartTime = LocalTime.parse(dto.getRestStartTime(), formatter);
            LocalTime restEndTime = LocalTime.parse(dto.getRestEndTime(), formatter);
            
            long interval = dto.getInterval() * 60; // x분을 초로 변환

            for (LocalTime currentTime = startTime; currentTime.isBefore(endTime); currentTime = currentTime.plusSeconds(interval)) {
        	   if (currentTime.isAfter(restStartTime) && currentTime.isBefore(restEndTime)) {
                       // System.out.println("현재 시간은 "+restStartTime+"에서 "+restEndTime+" 사이입니다.");
                       continue;
        	   } 
        	   
        	   Ris0210FormDTO temp =  Ris0210FormDTO.builder()
					        	   	.hsptId(dto.getHsptId())
					        	   	.imgnRoomCd(dto.getImgnRoomCd())
					        	   	.startTime(currentTime.toString())
					        	   	.endTime(currentTime.plusSeconds(interval).toString())
					        	   	.inPatient(dto.getInPatient())
					        	   	.outPatient(dto.getOutPatient())
					        	   	.healthExamination(dto.getHealthExamination())
					        	   	.weekList(weekList)
					        	   	.build();
        	   list.add(temp);
        	   
        	   
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mapper.ris0210FormInsert(list);
        return "success";
		
	}

	@Override
	public List<RISAppnCalDTO> risappnCalSelect(RISAppnCalRequestDTO dto) {
		return risAppnCommonMapper.risappnCalSelect(dto);
	}

	

	
	


}
