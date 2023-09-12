package egovframework.jubsu.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RIS1201E00Controller {
	
	// 영상 접수 관리 페이지
	@RequestMapping(value = "/jubsu/RIS1201E00.do")
	private String RIS1201E00(Model model) throws Exception {
		return ".main/jubsu/RIS1201E00";
	}	
}



