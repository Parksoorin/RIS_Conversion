package egovframework.appn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.model.Ris0213RequestDTO;
import egovframework.appn.service.RIS0213E00Service;
import egovframework.appn.service.RISAppnCommonService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/appn")
public class RIS0213E00Controller {
	
	@Resource(name="RIS0213E00Service")
	private RIS0213E00Service service;
	
	@Resource(name="RISAppnCommonService")
	private RISAppnCommonService risAppnCommonService;
	
	/*
	 * 예외 기준 관리 - Controller
	 * GET		/appn/RIS0213E00.do	WEB-INF/appn/RIS0213E00.jsp forward
	 */
	
	@GetMapping("/RIS0213E00.do")
	public String ris0213ListGetMapping(Model model) throws JsonProcessingException {
		System.out.println("/RIS0213E00.do Get Request!!!");
		List<ImagingDTO> imagingList = risAppnCommonService.imagingSelect();
		  ObjectMapper objectMapper = new ObjectMapper();
		  String jsonImagingList =  objectMapper.writeValueAsString(imagingList);

		model.addAttribute("imagingList", imagingList);
		model.addAttribute("jsonImagingList", jsonImagingList);
		return ".main/appn/RIS0213E00";
	}
	
	
	
	/*
	 * 예외 기준 관리 - RestController
	 * GET		/appn/ris0213List/ris0213.do	ris0213 조건에 맞는 조회
	 * POST		/appn/ris0213List/ris0213.do	ris0213 모든 변경사항 저장
	 */
	

	@PostMapping("/RIS0213E00/ris0213Search.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListRestGetMapping(@RequestParam Map<String, Object> map) {
		System.out.println("/appn/RIS0213E00/ris0213.do Get Mapping!!!");
		System.out.println("--------");
		for(String key : map.keySet()) {
			//log.debug("{} key : {} ----------", key, map.get(key));
			System.out.println(key);
			System.out.println(map.get(key));
		}
		
		Ris0213RequestDTO dto = Ris0213RequestDTO.builder()
				.strtDate(String.valueOf(map.get("strtDate")))
				.endDate(String.valueOf(map.get("endDate")))
				.imgnRoomCd(String.valueOf(map.get("imgnRoomCd")))				
				.build();
		List<Ris0213DTO> rows = service.ris0213Select(dto);
		
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/RIS0213E00/ris0213.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListPostMapping(@RequestBody List<Ris0213DTO> list){
		System.out.println("/appn/RIS0213E00/ris0213.do Post Mapping!!!");
		for(Ris0213DTO mo : list) {
			mo.setHsptId("A001");
			System.out.println(mo.toString());
		
		}
		
		int result = service.ris0213Process(list);
		return ResponseEntity.ok().body(result);
	}
	
	
	
	
}
