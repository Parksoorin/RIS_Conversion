package egovframework.appn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0212RequestDTO;
import egovframework.appn.service.RIS0212E00Service;

@Controller
@RequestMapping("/appn")
public class RIS0212E00Controller {
	
	@Resource(name="RIS0212E00Service")
	private RIS0212E00Service service;
	
	
	/*
	 * 휴일 기준 관리 - Controller
	 * GET		/appn/RIS0212E00.do	WEB-INF/appn/RIS0212E00.jsp forward
	 */
	
	@GetMapping("/RIS0212E00.do")
	public String ris0212ListGetMapping() {
		System.out.println("RIS0212E00.do Get Mapping!!!");		
		return ".main/appn/RIS0212E00";
	}
	
	/*
	 * 휴일 기준 관리 - RestController
	 * GET		/appn/RIS0212E00/ris0212.do	ris0212 Data를 전체 조회
	 * POST		/appn/RIS0212E00/ris0212.do	ris0212List 모든 변경사항 저장
	 */
	
	@PostMapping("/RIS0212E00/ris0212Search.do")
	@ResponseBody
	public ResponseEntity<?> ris0212ListRestGetMapping(@RequestParam Map<String, Object> map) {
		System.out.println("/appn/RIS0212E00/ris0212.do Get Mapping!!!");

		for(String key : map.keySet()) {
			//log.debug("{} key : {} ----------", key, map.get(key));
			System.out.println(key);
			System.out.println(map.get(key));
		}
		
		
		Ris0212RequestDTO dto = Ris0212RequestDTO.builder()
				.strtDate(String.valueOf(map.get("strtDate")))
				.endDate(String.valueOf(map.get("endDate")))				
				.build();
		
		List<Ris0212DTO> rows = service.ris0212Select(dto);
		
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/RIS0212E00/ris0212.do")
	@ResponseBody
	public ResponseEntity<?> ris0212ListPostMapping(@Valid @RequestBody List<Ris0212DTO> list){
		System.out.println("/appn/RIS0212E00/ris0212.do Post Mapping!!!");
		for(Ris0212DTO mo : list) {
			mo.setHsptId("A001");
			System.out.println(mo.toString());
		
		}
		int result = service.ris0212Process(list);
		return ResponseEntity.ok().body(result);
	}
	
	
	
}
