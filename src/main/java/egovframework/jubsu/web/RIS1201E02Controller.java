package egovframework.jubsu.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.jubsu.model.RIS1201E0301DTO;
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
	
	
//	// 이동 촬영 접수 페이지 데이터
//	@RequestMapping(value = "/jubsu/RIS1201E02.do", method = RequestMethod.POST)
//	public JSONObject RIS1201E02(@RequestParam String type, HttpSession session, HttpServletRequest request,
//			HttpServletResponse response, Model model) throws Exception {
//		
//		JSONObject json = new JSONObject(); 
//		
//		List<RIS1201E0301DTO> ris1201E0301Data = ris1201E02Service.ris1201E0301Data();
//		
//		System.out.println(ris1201E0301Data);
//		
//		json.put("rows", ris1201E0301Data);
//		
//		return json;
//	}
	
	
	
}