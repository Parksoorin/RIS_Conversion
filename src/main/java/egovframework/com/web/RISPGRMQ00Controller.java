package egovframework.com.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;

@Controller
public class RISPGRMQ00Controller {
	
	@Resource(name="ComService")
	private ComService comService;
	
	@RequestMapping(value = "/RISPGRMQ00.do")
	public String menu(Model model) throws Exception {
		return ".main/com/RISPGRMQ00";
	}
	
	// 그리드 불러오기
	@RequestMapping(value = "/RISPGRMQ00.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject RISPGRMQ00(@RequestParam String hsptId, HttpSession session, HttpServletRequest request,
        HttpServletResponse response, Model model) throws Exception {
		
		System.out.println("/RISPGRMQ00.do POST!!!!");
		JSONObject json = new JSONObject(); 
		List<RisPgrmDTO> data =comService.RisPgrmList(hsptId); 
		  
		JSONArray rowsArray = new JSONArray(); 
		JSONObject row = new JSONObject(); 
		  
		json.put("rows", data);

		return json;
	}
	
	// 저장
	@RequestMapping(value = "/rispgrmSavaData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveBtn(@RequestBody List<RisPgrmDTO> dtos, HttpSession session, HttpServletRequest request,
	                           HttpServletResponse response, Model model) throws Exception {
		
	    JSONObject json = new JSONObject();
	    
	    for (RisPgrmDTO dto : dtos) {
	        String flag = dto.getFlag();
	        // 화면유형 변환
	        String pgrmType = dto.getPgrmType(); 
	        if ("등록".equals(pgrmType)) {
	        	dto.setPgrmType("W");
	        } else if ("메뉴".equals(pgrmType)) {
	        	dto.setPgrmType("M");
	        } else if ("조회".equals(pgrmType)) {
	        	dto.setPgrmType("Q");
	        }
	        // 호출방식 변환
	        String pgrmInfo = dto.getPgrmInfo(); 
	        if ("메인화면".equals(pgrmInfo)) {
	        	dto.setPgrmInfo("W");
	        } else if ("팝업화면".equals(pgrmInfo)) {
	        	dto.setPgrmInfo("P");
	        } else if ("메뉴헤더".equals(pgrmInfo)) {
	        	dto.setPgrmInfo("Z");
	        }

	        System.out.println("-----------------------");
	        System.out.println(flag);
	        int result = 0;
	        switch (flag) {
	            case "U":
	                result = comService.updatePgrmData(dto);
	                break;
	            case "I":
	                result = comService.addPgrmData(dto);
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
	
	// 삭제
	@RequestMapping(value = "/rispgrmDeleteData.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteBtn(@RequestBody RisPgrmDTO dto, HttpSession session, HttpServletRequest request,
	                           HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();

        // dto 객체를 사용하여 작업 수행
        int result = comService.deletePgrmData(dto);

        if (result < 1) {
            json.put("result", "error");
            return json;
        }

		json.put("result", "success");
	    return json;
	}
	
}

