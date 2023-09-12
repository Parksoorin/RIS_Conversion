package egovframework.stts.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.stts.model.Ris1201DTO;
import egovframework.stts.service.SttsService;

@Controller
public class RIS1201Q01Controller {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/risImgnStts.do")
	public String risImgnSttsPage(Model model) throws Exception {
		return ".main/stts/RIS1201Q01";
	}
	
	@RequestMapping(value = "/stts/RIS1201Q01.do")
	@ResponseBody
	public JSONObject getRis1201Q01(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		System.out.println("ris1201");
		List<Ris1201DTO> ris1201Data = sttsService.getRis1201Q01();
		
		System.out.println(ris1201Data);

		json.put("ris1201Data", ris1201Data);
		
		return json;
	}
}
