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
		System.out.println("main/code/risCodeList 111 >>>");
		return "main/code/risCodeList";
	}
	
	@RequestMapping(value = "/risCodeView.do")
	public String risCodeView(Model model) throws Exception {
		System.out.println("main/code/risCodeView 222 >>>");
		return "main/code/risCodeView";
	}

	@RequestMapping(value = "/risCodeReg.do")
	public String risCodeReg(Model model) throws Exception {
		System.out.println("main/code/risCodeReg 코드등록화면 >>>");
		return "main/code/risCodeReg";
	}
	
}

