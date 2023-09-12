package egovframework.pat.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RIS1101E00Controller {
	
	// 환자 정보 관리 페이지
	@RequestMapping(value = "/pat/RIS1101E00.do")
	private String patientSearch(Model model) throws Exception {
		return ".main/pat/RIS1101E00";
	}

	
}