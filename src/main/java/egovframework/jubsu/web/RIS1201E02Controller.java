package egovframework.jubsu.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.jubsu.service.RIS1201E02Service;

@Controller
public class RIS1201E02Controller {
	
	@Resource(name="RIS1201E02Service")
	private RIS1201E02Service ris1201E02Service;
	
	// 이동 촬영 접수 페이지
	@RequestMapping(value = "/jubsu/RIS1201E02.do")
	private String RIS1201E02(Model model) throws Exception {
		return ".main/jubsu/RIS1201E02";
	}
}