package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RIS0213E00Service;
import egovframework.appn.service.RISAppnCommonService;

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
	public String ris0213ListGetMapping(Model model) {
		System.out.println("/RIS0213E00.do Get Request!!!");
		List<ImagingDTO> imagingList = risAppnCommonService.imagingSelect();
		model.addAttribute("imagingList", imagingList);
		
		return ".main/appn/RIS0213E00";
	}
	
	/*
	 * 예외 기준 관리 - RestController
	 * GET		/appn/ris0213List/ris0213.do	ris0213 조건에 맞는 조회
	 * POST		/appn/ris0213List/ris0213.do	ris0213 모든 변경사항 저장
	 */
	
	@GetMapping("/RIS0213E00/ris0213.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListRestGetMapping() {
		System.out.println("/appn/RIS0213E00/ris0213.do Get Mapping!!!");
		List<Ris0213DTO> rows = service.ris0213Select();
		
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/RIS0213E00/ris0213.do")
	@ResponseBody
	public ResponseEntity<?> ris0213ListPostMapping(@RequestBody List<Ris0213DTO> list){
		System.out.println("/appn/RIS0213E00/ris0213.do Post Mapping!!!");
		int result = service.ris0213Process(list);
		return ResponseEntity.ok().body(result);
	}
	
	
	
	
}
