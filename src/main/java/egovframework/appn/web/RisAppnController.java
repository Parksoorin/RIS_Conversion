package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.RisAppnService;

@Controller
@RequestMapping("/appn")
public class RisAppnController {
	
	@Resource(name="risAppnService")
	private RisAppnService risAppnService;
	
	/*
	 * GET		/appn/risappn.do	risappn Data를 전체 조회
	 * POST								risappn 새로운 Data 저장
	 * PATCH							risappn 기존 Data 수정
	 * DELETE							risappn 기존 Data 삭제
	 */
	
	@GetMapping("/risappn.do")
	public String risappnGetMapping() {
		System.out.println("/risappn.do Get Request!!!");
		
		
		return ".main/appn/risappn";
	}
	
	
	/*
	 * GET		/appn/ris0213List.do	ris0213List Data를 전체 조회
	 * POST								ris0213List 새로운 Data 저장
	 * PATCH							ris0213List 기존 Data 수정
	 * DELETE							ris0213List 기존 Data 삭제
	 */
	
	@GetMapping("/ris0213List.do")
	public String ris0213ListGetMapping() {
		System.out.println("/ris0213List.do Get Request!!!");
		List<Ris0213DTO> list = risAppnService.ris0213FindAll();
		
		for(Ris0213DTO dto : list) {
			System.out.println(dto.getHsptId());
		}
		
		return ".main/appn/ris0213List";
	}
	
	
	/*
	 * GET		/appn/ris0212List.do	ris0212List Data를 전체 조회
	 * POST								ris0212List 새로운 Data 저장
	 * PATCH							ris0212List 기존 Data 수정
	 * DELETE							ris0212List 기존 Data 삭제
	 */
	
	@GetMapping("/ris0212List.do")
	public String ris0212ListGetMapping() {
		System.out.println("ris0212List.do Get Request!!!");
		
		
		return ".main/appn/ris0212List";
	}
	
	/*
	 * GET		/appn/RIS1211E00.do	ris0213List Data를 전체 조회
	 * POST								ris0213List 새로운 Data 저장
	 * PATCH							ris0213List 기존 Data 수정
	 * DELETE							ris0213List 기존 Data 삭제
	 */
	
	@GetMapping("/ris1211e00.do")
	public String ris1211e00GetMapping() {
		System.out.println("/ris1211e00.do Get Request!!!");
		
		return ".main/appn/ris1211E00";
	}
	
	
	
}
