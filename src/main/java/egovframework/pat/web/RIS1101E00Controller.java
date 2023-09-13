package egovframework.pat.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.pat.model.RIS1101DTO;
import egovframework.pat.service.RIS1101E00Service;

@Controller
public class RIS1101E00Controller {
	
	@Resource(name="RIS1101E00Service")
	private RIS1101E00Service ris1101E00Service;
	
	// 환자 정보 관리 페이지
	@RequestMapping(value = "/pat/RIS1101E00.do")
	private String patientSearch(Model model) throws Exception {
		
		return ".main/pat/RIS1101E00";
	}

	@RequestMapping(value = "/pat/RIS1101E00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RIS1101E00(@RequestParam String type, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		
		JSONObject json = new JSONObject(); 
		System.out.println("123");
		
		try {
			List<RIS1101DTO> ris1101Data = ris1101E00Service.RIS1101List();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("456");
		//System.out.println(ris1101Data);
		
		//json.put("rows", ris1101Data);
		System.out.println("789");
		
		return json;
	}

}