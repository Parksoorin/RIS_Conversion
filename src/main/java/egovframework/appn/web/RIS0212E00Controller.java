package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.appn.model.Ris0212DTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RIS0212E00Service;
import egovframework.appn.service.RisAppnService;

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
	
	@GetMapping("/RIS0212E00/ris0212.do")
	@ResponseBody
	public ResponseEntity<?> ris0212ListRestGetMapping() {
		System.out.println("/appn/RIS0212E00/ris0212.do Get Mapping!!!");
		List<Ris0212DTO> rows = service.ris0212Select();
		
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/RIS0212E00/ris0212.do")
	@ResponseBody
	public ResponseEntity<?> ris0212ListPostMapping(@Valid @RequestBody List<Ris0212DTO> list){
		System.out.println("/appn/RIS0212E00/ris0212.do Post Mapping!!!");
		return ResponseEntity.ok('2');
	}
	
	
	
}
