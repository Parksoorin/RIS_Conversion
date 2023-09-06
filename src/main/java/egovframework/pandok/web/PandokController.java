package egovframework.pandok.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.pandok.service.PandokService;

@Controller
public class PandokController {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris0601List.do")
	public String ris0601ListPage(Model model) throws Exception {
		// 페이지 이동 시 model에 데이터를 넣어서 이동
//		int ris0601Data = pandokService.getRis0601List();
//		
//		model.addAttribute("ris0601Data", ris0601Data);
//		
//		System.out.println(model);
		
		return ".main/pandok/ris0601List";
	}
}