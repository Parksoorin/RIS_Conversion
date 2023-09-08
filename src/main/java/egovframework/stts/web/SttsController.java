package egovframework.stts.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.stts.service.SttsService;

@Controller
public class SttsController {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/risImgnStts.do")
	public String risImgnSttsPage(Model model) throws Exception {
		return ".main/stts/RIS1201Q01";
	}
}
