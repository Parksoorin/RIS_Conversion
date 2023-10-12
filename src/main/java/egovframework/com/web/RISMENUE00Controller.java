package egovframework.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisUrmnDTO;
import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;

@Controller
public class RISMENUE00Controller {
	
	@Resource(name="ComService")
	private ComService comService;
	
	@RequestMapping(value = "/RISMENUE00.do")
	public String menu(Model model) throws Exception {
		return ".main/com/RISMENUE00";
	}
	
	// 그리드2 팝업창
	@RequestMapping(value = "/RISMENUE00_POP.do")
	public String menugruppopup(Model model) throws Exception {
		return ".popup/RISMENUE00_POP";
	}
	
	// 그리드1 불러오기
	@RequestMapping(value = "/RISMENUE00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISMENUE00(@RequestParam String hsptId, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISMENUE00.do POST!!!!");
		System.out.println(hsptId);
		JSONObject json = new JSONObject(); 
		List<RisGrupDTO> data =comService.RisGrupList(hsptId); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
	
	
	// 그리드2 불러오기
	@RequestMapping(value = "/RISMENUE002.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISMENUE002(@RequestParam String menuGroupId, String hsptId, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISMENUE002.do POST!!!!");
		
		JSONObject json = new JSONObject(); 
		Map<String, String> params = new HashMap<>();
        params.put("menuGroupId", menuGroupId);
        params.put("hsptId", hsptId);
		List<RisGrmuDTO> data =comService.RisGrmuList(params); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
	
	
	// 저장
	@RequestMapping(value = "/rismenuSavaData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveBtn(@RequestBody List<RisGrupDTO> dtos, HttpSession session, HttpServletRequest request,
	                           HttpServletResponse response, Model model) throws Exception {
		
	    JSONObject json = new JSONObject();
	    for (RisGrupDTO dto : dtos) {
	        String flag = dto.getFlag();
	        System.out.println("-----------------------");
	        System.out.println(flag);
	        System.out.println(dto);
	        int result = 0;
	        switch (flag) {
	            case "U":
	                result = comService.updateMenuData(dto);
	                break;
	            case "I":
	                result = comService.addMenuData(dto);
	                break;
                default:
                	continue;
	        }
	        if (result < 1) {
	            json.put("result", "error");
	            return json;
	        }
	    }
	    json.put("result", "success");
	    return json;
	}
	
	// 팝업
	@RequestMapping(value = "/RISMENUE00_POP.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISMENUE00_POP(@RequestParam String hsptId, HttpSession session, HttpServletRequest request,
	        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISMENUE00_POP.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisGrmuDTO> data =comService.popupGrmuList(hsptId); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}

	
}

