package egovframework.pandok.web;

import java.util.ArrayList;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.pandok.model.Ris0102DTO;
import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.model.RisUserDTO;
import egovframework.pandok.service.PandokService;

@Controller
public class RIS0601E00Controller {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris0601List.do")
	public String ris0601ListPage(Model model) throws Exception {
		// 페이지 이동 시 model에 데이터를 넣어서 이동
		
		// 사용자 ID와 권한 (동적으로 변경해야 함)
		model.addAttribute("userName", "admin");
		model.addAttribute("userGrade", "S");
		
		// 촬영구분 리스트
		List<Ris0102DTO> ris0102Data = pandokService.getRis0102List();
		
		ObjectMapper objectMapper = new ObjectMapper();
	    String ris0102ListJson = objectMapper.writeValueAsString(ris0102Data);
	    
	    // 기존 List<DTO> 형태 데이터
	    model.addAttribute("ris0102Data", ris0102Data);
	    // JS에서 사용하기 위한 변환된 JSON 데이터
	    model.addAttribute("ris0102List", ris0102ListJson);
		
	    
	    // 의사 ID 리스트
		List<RisUserDTO> risUserData = pandokService.getRisUserList();
		model.addAttribute("risUserData", risUserData);
		
		return ".main/pandok/RIS0601E00";
	}
	
	@RequestMapping(value = "/pandok/getRis0601List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getRis0601List(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		Map<String, String> param = new HashMap<>();
		
		// 의사ID와 촬영구분 parameter로 설정
		param.put("docId", map.get("docId").toString());
		param.put("imgnDvsn", "%".equals(map.get("imgnDvsn").toString()) ? "all" : map.get("imgnDvsn").toString());
		
		List<Ris0601DTO> ris0601Data = pandokService.getRis0601List(param);

		json.put("ris0601Data", ris0601Data);
		
		return json;
	}
	
	@RequestMapping(value = "/pandok/saveRis0601List.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveRis0601List(@RequestBody List<Ris0601DTO> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		int cnt = 0;
		
		for (Ris0601DTO m : map) {
			// 입력, 수정, 삭제일 경우
			if (m.getFlag() != "") {
				// 입력일 경우만 중복 체크
				if (m.getFlag() == "입력") {
					int duplicateCheck = pandokService.duplicateCheck(m); 
					
					if (duplicateCheck == 1) {					
						json.put("msg", "중복");
						
						return json;
					}				
				}
				
				// 수정, 삭제는 바로 진행
				pandokService.saveRis0601List(m);
				cnt += 1;
			}			
		}
		
		json.put("msg", "success");
		json.put("cnt", cnt);
		
		return json;
	}
}