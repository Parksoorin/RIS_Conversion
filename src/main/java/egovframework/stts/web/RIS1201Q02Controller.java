package egovframework.stts.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.service.SttsService;

public class RIS1201Q02Controller {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/RisEqpmStts.do")
	public String risEqpmSttsPage(Model model) throws Exception {
		System.out.println("장비별 페이지");
		
		// 촬영 구분 리스트
		List<Ris0102DTO> risDvsnList = sttsService.getRisDvsnList();
		// 장비 리스트
		List<Ris0102DTO> risEqpmList = sttsService.getRisEqpmList();
		
		model.addAttribute("risDvsnList", risDvsnList);
		model.addAttribute("risEqpmList", risEqpmList);
		
		System.out.println(risEqpmList);
		
		return ".main/stts/RIS1201Q02";
	}
}
