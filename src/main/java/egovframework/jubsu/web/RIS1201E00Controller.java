package egovframework.jubsu.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.jubsu.service.RIS1201E00Service;
import egovframework.jubsu.service.RIS1201E03Service;

@Controller
public class RIS1201E00Controller {
	
	@Resource(name="RIS1201E00Service")
	private RIS1201E00Service ris1201E00Service;
	
	// 영상 접수 관리 페이지
	@RequestMapping(value = "/jubsu/RIS1201E00.do")
	private String RIS1201E00(Model model) throws Exception {
		return ".main/jubsu/RIS1201E00";
	}	
}



