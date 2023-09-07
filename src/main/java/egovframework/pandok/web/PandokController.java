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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.pandok.model.Ris0601DTO;
import egovframework.pandok.service.PandokService;

@Controller
public class PandokController {
	@Resource(name="PandokService")
	PandokService pandokService;
	
	@RequestMapping(value = "/pandok/ris0601List.do")
	public String ris0601ListPage(Model model) throws Exception {
		// 페이지 이동 시 model에 데이터를 넣어서 이동
		return ".main/pandok/ris0601List";
	}
	
	@RequestMapping(value = "/pandok/getRis0601List.do")
	@ResponseBody
	public JSONObject getRis0601List(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println("test");
		JSONObject json = new JSONObject();
		
		List<Ris0601DTO> ris0601Data = pandokService.getRis0601List();
		
		System.out.println(ris0601Data);

		json.put("ris0601Data", ris0601Data);
		
		return json;
	}
}