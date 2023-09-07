package egovframework.code.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.code.model.Ris0101DTO;
import egovframework.code.service.Ris0101Service;

@Controller
public class CodeController {
	@Resource(name="ris0101Service")
	private Ris0101Service ris0101Service;
	
	@RequestMapping(value = "/risCodeList.do")
	public String risCodeList(Model model) {
		System.out.println("main/code/risCodeList 111 >>>");
		List<Ris0101DTO> list = ris0101Service.findAll();
		System.out.println("list >>>" + list);

		return ".main/code/risCodeList";
	}
	
	@RequestMapping(value = "/risCodeView.do")
	public String risCodeView(Model model) throws Exception {
		System.out.println("main/code/risCodeView 222 >>>");
		
		System.out.println("main/code/risCodeList 111 >>>");
		List<Ris0101DTO> list = ris0101Service.findAll();
		System.out.println("list >>>" + list);
		return ".main/code/risCodeView";
	}

	@RequestMapping(value = "/risCodeInsert.do")
	public String risCodeReg(Model model) throws Exception {
		System.out.println("main/code/risCodeReg 코드등록화면 >>>");
		return ".main/code/risCodeInsert";
	}
	
}

