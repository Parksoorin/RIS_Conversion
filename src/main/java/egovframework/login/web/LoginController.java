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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.model.RisUserDTO;
import egovframework.login.service.LoginService;
import egovframework.util.Sha256;




@Controller
public class LoginController {
	

	@Resource(name = "LoginService") // 서비스 선언
	LoginService loginService;
	
	
	//@RequestParam String hspt_id 
	@GetMapping("/login.do")
	public String login() {
		return ".login/login";
	}
	@GetMapping("/RISUSERE00.do")
	public String risuserE00() {
		return ".popup/RISUSERE00";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginId(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		RisUserDTO dto = new RisUserDTO();
		//String pw = Sha256.encrypt(map.get("password").toString());
		String pw = map.get("password").toString();
		dto.setLoginId(map.get("id").toString());
		dto.setLoginPwd(pw);
		RisUserDTO result = loginService.loginId(dto);

		if (result == null) {
			json.put("result", "none"); // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		} else {
			json.put("result", "success");
			//session.setAttribute("login", result);
		}
		return json;
	}
	
	// 로그인, 비밀번호 확인
	@RequestMapping(value = "/userPasswordChk.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userPasswordChk(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		RisUserDTO dto = new RisUserDTO();
		//String pw = Sha256.encrypt(map.get("password").toString());	
		dto.setLoginId(map.get("loginId").toString());
		dto.setLoginPwd(map.get("loginPwd").toString());
		System.out.println(dto.toString());
		System.out.println("----------체크-------------");
		RisUserDTO result = loginService.userPasswordChk(dto);
		System.out.println("-----------체크222------------");
		if (result == null) {
			json.put("result", "none"); // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		} else {
			json.put("result", "success");
			//session.setAttribute("login", result);
		}
		return json;
	}
	
	
	// 비밀번호 재설정
	@RequestMapping(value = "/userPasswordChange.do", method = RequestMethod.POST)
	@ResponseBody public JSONObject userPasswordChange(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
		HttpServletResponse response, Model model) throws Exception { 
		System.out.println("-----------변경------------");
		JSONObject json = new JSONObject();
		RisUserDTO dtos = RisUserDTO.builder()
							.loginId(map.get("loginId").toString())
							.loginPwd(map.get("loginPwd").toString())
						.build();
		int result = loginService.userPasswordChange(dtos);
		System.out.println(result);
		json.put("result", result);
		return json;
	}
	
	
	
}
