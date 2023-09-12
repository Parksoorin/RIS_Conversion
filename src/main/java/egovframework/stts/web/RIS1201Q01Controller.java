package egovframework.stts.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/stts/getRis1201Q01List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1201Q01(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int year = Integer.parseInt(map.get("year").toString());
		Map<String, Integer> param = new HashMap<>();
		
		param.put("year", year);
		param.put("lastYear", year - 1);
		
		List<Ris1201DTO> ris1201Data = sttsService.getRis1201List(param);

		json.put("ris1201Data", ris1201Data);
		
		return json;
	}
}
