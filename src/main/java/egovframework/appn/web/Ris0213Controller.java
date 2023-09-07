package egovframework.appn.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.appn.model.Ris0213DTO;
import egovframework.appn.service.Ris0213Service;
import egovframework.code.model.Ris0101DTO;
import egovframework.code.service.Ris0101Service;

@Controller
@RequestMapping("/appn")
public class Ris0213Controller {
	
	@Resource(name="ris0213Service")
	private Ris0213Service ris0213Service;
	
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;
	
	/*
	 * GET		/appn/ris0213List.do	ris0213List Data를 전체 조회
	 * POST								ris0213List 새로운 Data 저장
	 * PATCH							ris0213List 기존 Data 수정
	 * DELETE							ris0213List 기존 Data 삭제
	 */
	
	@GetMapping("/ris0213List.do")
	public String ris0213ListGetMapping() {
		System.out.println("/ris0213List.do Get Request!!!");
		List<Ris0213DTO> list = ris0213Service.findAll();
//		List<Ris0101DTO> list = ris0101Service.findAll();
		System.out.println("list >>>" + list);
		
//		for(Ris0101DTO dto : list) {
//			System.out.println(dto.getHsptId());
//		}
		
		return ".main/test";
	}
	
	
}
