package egovframework.code.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CodeController {
	
	@RequestMapping(value = "/risCodeList.do")
	public String risCodeList(Model model) throws Exception {
		return "main/code/risCodeList";
	}
	
	
}

