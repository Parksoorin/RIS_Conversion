package egovframework.pandok.web;

import java.util.List;
import java.util.Map;

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

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris1301DTO;
import egovframework.pandok.service.PandokService;

@Controller
public class RIS1301E00Controller {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris1301List.do")
	public String ris1301ListPage(Model model) throws Exception {
		List<Ris0102DTO> ris0102Data = pandokService.getRis0102List();
		
		model.addAttribute("ris0102Data", ris0102Data);
		
		return ".main/pandok/RIS1301E00";
	}
	
	@RequestMapping(value = "/pandok/ris1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1301List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		List<Ris1301DTO> ris1301Data = pandokService.getRis1301List();
		
		json.put("ris1301Data", ris1301Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/PatientPopup.do")
	public String risPatientPopup(Model model) throws Exception {
		
		return ".popup/RIS1301E00_POP";
	}
}