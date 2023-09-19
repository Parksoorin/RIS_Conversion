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

import egovframework.stts.model.Ris0102DTO;
import egovframework.stts.model.Ris1201DTO;
import egovframework.stts.service.SttsService;

@Controller
public class RIS1201Q02Controller {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/RisEqpmStts.do")
	public String risEqpmSttsPage(Model model) throws Exception {
		System.out.println("장비별 페이지");
		
		// 촬영 구분 리스트
		List<Ris0102DTO> risDvsnList = sttsService.getRisDvsnList();
		// 장비 리스트
		List<Ris0102DTO> risEqpmList = sttsService.getRisEqpmList();
		
		model.addAttribute("risDvsnList", risDvsnList);
		model.addAttribute("risEqpmList", risEqpmList);
		
		System.out.println(risEqpmList);
		
		return ".main/stts/RIS1201Q02";
	}
	

	@RequestMapping(value = "/stts/getEqpmSttsList.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1201Q02(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		// service로 보낼 parameter 생성
		Map<String, String> param = new HashMap<>();
		
		// 현재 년도와 전 년도를 추가
		String yearStr = map.get("year").toString(); // year를 문자열로 변환
		
		param.put("year", yearStr);
		param.put("lastYear", String.valueOf(Integer.parseInt(yearStr) - 1)); // 문자열로 변환하여 다시 put

		// 촬영구분과 촬영실 필터 값을 추가
		param.put("dvsn", "%".equals(map.get("dvsn").toString()) ? "all" : map.get("dvsn").toString());
		param.put("eqpm", "%".equals(map.get("eqpm").toString()) ? "all" : map.get("eqpm").toString());
		
		List<Ris1201DTO> ris1201Data = sttsService.getEqpmSttsList(param);

		json.put("ris1201Data", ris1201Data);
		
		return json;
	}
}
