package egovframework.jubsu.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RIS1201E02Controller {
	
	// 이동 촬영 접수 페이지
	@RequestMapping(value = "/jubsu/RIS1201E02.do")
	private String RIS1201E02(Model model) throws Exception {
		return ".main/jubsu/RIS1201E02";
	}
}