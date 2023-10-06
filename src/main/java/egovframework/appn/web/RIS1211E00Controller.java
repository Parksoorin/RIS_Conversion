package egovframework.appn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.ImagingDivisionPatientDTO;
import egovframework.appn.model.ImagingRequestDTO;
import egovframework.appn.model.RIS0210RequestDTO;
import egovframework.appn.model.RIS0211RequestDTO;
import egovframework.appn.model.Ris0210DTO;
import egovframework.appn.model.Ris1211DTO;
import egovframework.appn.model.Ris1211List2DTO;
import egovframework.appn.model.Ris1211List2RequestDTO;
import egovframework.appn.model.Ris1211List3DTO;
import egovframework.appn.model.Ris1211List3RequestDTO;
import egovframework.appn.model.Ris1211RequestDTO;
import egovframework.appn.service.RIS1211E00Service;
import egovframework.appn.service.RISAppnCommonService;

import egovframework.pandok.model.Ris1101DTO;
import egovframework.pandok.service.PandokService;

@Controller
@RequestMapping("/appn")
public class RIS1211E00Controller {
	
	@Resource(name="RIS1211E00Service")
	private RIS1211E00Service service;
	
	@Resource(name="RISAppnCommonService")
	private RISAppnCommonService risAppnCommonService;
	
	@Resource(name="PandokService")
	private PandokService pandokService;
	
	
	
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
	
	
	@RequestMapping(value = "/getImagingRoom.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject findQcCode(@RequestBody ImagingRequestDTO dto, Model model) throws Exception {
		JSONObject json = new JSONObject();

		List<ImagingDTO> imagingList = risAppnCommonService.imagingSelectSearch(dto);

		json.put("success", "성공");
		json.put("imagingList", imagingList);
		model.addAttribute("imagingList", imagingList);
		return json;
	}
	
	@GetMapping("/RIS1211E00_POP.do")
	public String RIS1211E00_POPGetMapping() {
		return ".popup/RIS1211E00_POP";
	}
	/*
	 * 예약 관리 페이지 - RestController
	 * GET		/appn/ris1211e00/ris0211.do		ris0211 조건에 맞는 조회
	 * POST										ris0211 새로운 Data 저장
	 */
	
	
	@GetMapping("/getRis1101List.do")
	@ResponseBody
	public JSONObject getRis1101List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		List<Ris1101DTO> ris1101Data = pandokService.getRis1101List();
		json.put("ris1101Data", ris1101Data);
		return json;
	}
	
	
	@PostMapping("/RIS1211E00/ris0211Search.do")
	@ResponseBody
	public ResponseEntity<?> ris1211e00RestGetMapping(@RequestBody Ris1211RequestDTO dto) {
		System.out.println("appn/RIS1211E00/ris0211.do Get Mapping!!!");
		List<Ris1211DTO> rows = service.ris1211Select(dto);
		return ResponseEntity.ok().body(rows);
	}
	
	
	@PostMapping("/RIS1211E00/ris0211List2Search.do")
	@ResponseBody
	public ResponseEntity<?> ris1211e00List2RestGetMapping(@RequestBody Ris1211List2RequestDTO dto) {
		System.out.println("appn/RIS1211E00/ris0211.do Get Mapping!!!");
		List<Ris1211List2DTO> rows = service.ris1211SelectList2(dto);
		return ResponseEntity.ok().body(rows);
	}
	
	@PostMapping("/RIS1211E00/ris0211List3Search.do")
	@ResponseBody
	public ResponseEntity<?> ris1211e00List3RestGetMapping(@RequestBody Ris1211List3RequestDTO dto) {
		System.out.println("appn/RIS1211E00/ris0211.do Get Mapping!!!");
		List<Ris1211List3DTO> rows = service.ris1211SelectList3(dto);
		return ResponseEntity.ok().body(rows);
	}
	
}
