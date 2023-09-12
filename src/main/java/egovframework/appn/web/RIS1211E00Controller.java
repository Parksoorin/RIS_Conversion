package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.ImagingDivisionPatientDTO;
import egovframework.appn.service.RIS1211E00Service;
import egovframework.appn.service.RISAppnCommonService;

@Controller
@RequestMapping("/appn")
public class RIS1211E00Controller {
	
	@Resource(name="RIS1211E00Service")
	private RIS1211E00Service service;
	
	@Resource(name="RISAppnCommonService")
	private RISAppnCommonService risAppnCommonService;
	
	/*
	 * 예약 관리 - Controller
	 * GET		/appn/RIS1211E00.do	WEB-INF/appn/RIS1211E00.jsp forward
	 */
	
	@GetMapping("/RIS1211E00.do")
	public String ris1211e00GetMapping(Model model) {
		System.out.println("/RIS1211E00.do Get Mapping!!!");
		List<ImagingDTO> imagingList = risAppnCommonService.imagingSelect();
		List<ImagingDivisionPatientDTO> imagingDivisionPatientList = risAppnCommonService.imagingDivisionPatientSelect();
		model.addAttribute("imagingList", imagingList);
		model.addAttribute("imagingDivisionPatientList", imagingDivisionPatientList);
		return ".main/appn/RIS1211E00";
	}
	
	/*
	 * 예약 관리 페이지 - RestController
	 * GET		/appn/ris1211e00/ris0211.do		ris0211 조건에 맞는 조회
	 * POST										ris0211 새로운 Data 저장
	 */
	
	@GetMapping("/RIS1211E00/ris0211.do")
	public ResponseEntity<?> ris1211e00RestGetMapping() {
		System.out.println("appn/RIS1211E00/ris0211.do Get Mapping!!!");
		return ResponseEntity.ok().body("");
	}
	
}
