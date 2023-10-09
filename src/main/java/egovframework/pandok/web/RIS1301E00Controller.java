package egovframework.pandok.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris1101DTO;
import egovframework.pandok.model.Ris1301DTO;
import egovframework.pandok.service.PandokService;

@Controller
public class RIS1301E00Controller {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris1301List.do")
	public String ris1301ListPage(HttpSession session, Model model) throws Exception {
		String hsptId = session.getAttribute("hspt_id").toString();
		
		List<Ris0102DTO> ris0102Data = pandokService.getRis0102List(hsptId);
		
		model.addAttribute("ris0102Data", ris0102Data);
		
		return ".main/pandok/RIS1301E00";
	}
	
	@RequestMapping(value = "/pandok/ris1301List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1301List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		Map<String, String> param = new HashMap<>();
		
		param.put("viewYn", map.get("viewYn").toString());
		param.put("voicViewYn", map.get("voicViewYn").toString());
		param.put("startDate", map.get("startDate").toString());
		param.put("endDate", map.get("endDate").toString());
		param.put("ris1301Dvsn", "%".equals(map.get("ris1301Dvsn").toString()) ? "all" : map.get("ris1301Dvsn").toString());
		param.put("ptntName", map.get("ptntName").toString());
		
		List<Ris1301DTO> ris1301Data = pandokService.getRis1301List(param);
		
		json.put("ris1301Data", ris1301Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/PatientPopup.do")
	public String risPatientPopup(Model model) throws Exception {
		
		return ".popup/RIS1301E00_POP";
	}
	
	@RequestMapping(value = "/pandok/getRis1101List.do")
	@ResponseBody
	public JSONObject getRis1101List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		List<Ris1101DTO> ris1101Data = pandokService.getRis1101List();
		
		json.put("ris1101Data", ris1101Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/filePopup.do")
	public String filePopup(Model model) throws Exception {
		
		return ".popup/RIS1301E00_POP2";
	}
	
	
	@RequestMapping(value = "/pandok/saveTempRis1301List.do")
	@ResponseBody
	public JSONObject saveTempRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		Map<String, Object> param = new HashMap<>();
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));
		
		param.put("pkRis1201", pkRis1201);
		param.put("ordrFk", dto.getOrdrFk().toString());
		
		int ris1301Data = pandokService.saveTempRis1301List(dto);
		int ris1201Data = pandokService.saveTempRis1201List(param);
		
		if (ris1301Data * ris1201Data == 1) {			
			cnt += 1;
		}
		
		json.put("cnt", cnt);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/finishRis1301List.do")
	@ResponseBody
	public JSONObject finishRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		Map<String, Object> param = new HashMap<>();
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));
		
		param.put("pkRis1201", pkRis1201);
		param.put("ordrFk", dto.getOrdrFk().toString());
		
		int ris1301Data = pandokService.saveTempRis1301List(dto);
		int ris1201Data = pandokService.saveTempRis1201List(param);
		
		if (ris1301Data * ris1201Data == 1) {			
			cnt += 1;
		}
		
		json.put("cnt", cnt);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/deleteRis1301List.do")
	@ResponseBody
	public JSONObject deleteRis1301List(@RequestBody Ris1301DTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		Map<String, Object> param = new HashMap<>();
		int pkRis1201 = Integer.parseInt(dto.getOrdrFk().toString().substring(3));
		
		param.put("pkRis1201", pkRis1201);
		param.put("ordrFk", dto.getOrdrFk().toString());
		
		int ris1301Data = pandokService.saveTempRis1301List(dto);
		int ris1201Data = pandokService.saveTempRis1201List(param);
		
		if (ris1301Data * ris1201Data == 1) {			
			cnt += 1;
		}
		
		json.put("cnt", cnt);
		
		return json;
	}
}