package egovframework.stts.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.service.SttsService;

public class RIS1201Q03Controller {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/RisViewDocStts.do")
	public String risViewDocSttsPage(Model model) throws Exception {
		// 촬영 구분 리스트
		List<Ris0102DTO> risDvsnList = sttsService.getRisDvsnList();
		
		model.addAttribute("risDvsnList", risDvsnList);
		
		return ".main/stts/RIS1201Q03";
	}
}
