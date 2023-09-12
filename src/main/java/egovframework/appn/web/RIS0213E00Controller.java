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
import egovframework.appn.service.RIS0213E00Service;
import egovframework.appn.service.RisAppnService;

@Controller
@RequestMapping("/appn")
public class RIS0213E00Controller {
	
	@Resource(name="RIS0213E00Service")
	private RIS0213E00Service service;
	
	
	/*
	 * 예외 기준 관리 - Controller
	 * GET		/appn/ris0213List.do	WEB-INF/appn/RIS0213E00.jsp forward
	 */
	
	@GetMapping("/ris0213List.do")
	public String ris0213ListGetMapping() {
		System.out.println("/ris0213List.do Get Request!!!");
		return ".main/appn/RIS0213E00";
	}
	
	/*
	 * 예외 기준 관리 - RestController
	 * GET		/appn/ris0213List/ris0213.do	ris0213 조건에 맞는 조회
	 * POST		/appn/ris0213List/ris0213.do	ris0213 모든 변경사항 저장
	 */
	
	@GetMapping("/ris0213List/ris0213.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListRestGetMapping() {
		System.out.println("/appn/ris0213List/ris0213.do Get Mapping!!!");
		List<Ris0213DTO> rows = service.ris0213Select();
		
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/ris0213List/ris0213.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListPostMapping(@Valid @RequestBody List<Ris0213DTO> list){
		System.out.println("/appn/ris0213List/ris0213.do Post Mapping!!!");
		int result = service.ris0213Process(list);
		return ResponseEntity.ok().body(result);
	}
	
	
	
	
}
