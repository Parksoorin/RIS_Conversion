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
import egovframework.stts.model.RisViewDocDTO;
import egovframework.stts.service.SttsService;

@Controller
public class RIS1201Q03Controller {
	@Resource(name="SttsService")
	SttsService sttsService;
	
	@RequestMapping(value = "/stts/RisViewDocStts.do")
	public String risViewDocSttsPage(Model model) throws Exception {
		// 촬영 구분 리스트
		List<Ris0102DTO> risDvsnList = sttsService.getRisDvsnList();
		// 판독의 리스트
		List<RisViewDocDTO> risViewDocList = sttsService.getRisViewDocList();
		
		model.addAttribute("risDvsnList", risDvsnList);
		model.addAttribute("risViewDocList", risViewDocList);
		
		return ".main/stts/RIS1201Q03";
	}
	

	@RequestMapping(value = "/stts/getViewDocSttsList.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis1201Q03(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
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
		param.put("viewDoc", map.get("viewDoc").toString());
		
		System.out.println(param);
		
		List<Ris1201DTO> ris1201Data = sttsService.getViewDocSttsList(param);
		
		System.out.println(ris1201Data);

		json.put("ris1201Data", ris1201Data);
		
		return json;
	}
}
