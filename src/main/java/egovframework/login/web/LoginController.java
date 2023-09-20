package egovframework.login.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.exam.mapper.TestsMapper;



@Controller
public class LoginController {
	@GetMapping("/login.do")
	public String login() {
		return ".login/login";
	}
	@GetMapping("/RISUSERE00.do")
	public String risuserE00() {
		return ".popup/RISUSERE00";
	}
	
	/*
	 * @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public JSONObject login(@RequestParam Map<String, Object> map,
	 * HttpSession session, HttpServletRequest request, HttpServletResponse
	 * response, Model model) throws Exception {
	 * 
	 * JSONObject json = new JSONObject(); UserCDTO dto = new UserCDTO(); String pw
	 * = Sha256.encrypt(map.get("password").toString());
	 * dto.setId(map.get("id").toString()); dto.setPassword(pw);
	 * 
	 * UserCDTO result = cService.loginID(dto); // boolean도 사용 가능. true or false
	 * 
	 * if (result == null) { json.put("result", "none"); // 서비스에서 가져온걸 리턴. 거의 값 전달만
	 * 해줌. } else { json.put("result", "success"); // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌. }
	 * 
	 * return json; }
	 */
}
