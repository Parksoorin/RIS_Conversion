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
import egovframework.appn.service.RIS0201E00Service;
import egovframework.appn.service.RisAppnService;

// 예약 기준 관리
@Controller
@RequestMapping("/appn")
public class RIS0201E00Controller {
	
	@Resource(name="RIS0201E00Service")
	private RIS0201E00Service service;
	
	
	/*
	 * 예약 기준 관리 - Controller
	 * GET		/appn/risappn/RIS0201E00.do	
	*/
	@GetMapping("/RIS0201E00.do")
	
	public String risappnGetMapping() {
		System.out.println("/RIS0201E00.do Get Request!!!");
		
		return ".main/appn/RIS0201E00";
	} 
	 
	 /*
	 * 예약 기준 관리 - RESTController
	 * GET		/appn/RIS0201E00/ris0210.do	ris0210 조건에 맞는 조회
	 * POST									ris0210 새로운 Data 저장
	 */
	
	@GetMapping("/RIS0201E00/ris0210.do")
	@ResponseBody
	public ResponseEntity<?> risappnRestGetMapping() {
		System.out.println("/appn/RIS0201E00/ris0210.do	 Get Mapping!!!");

		return ResponseEntity.ok().body("");
	}
	
	
	
	
}
