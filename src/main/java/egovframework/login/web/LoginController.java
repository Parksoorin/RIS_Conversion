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

import egovframework.login.model.RisUserDTO;
import egovframework.login.service.LoginService;
import egovframework.util.Sha256;


@Controller
public class LoginController {
	@Resource(name = "LoginService") // 서비스 선언
	LoginService loginService;
	
	
	// 로그인 페이지
	// index.jsp가 로그인 페이지('/'로 접근)
	
	/* @GetMapping("/login.do")
	public String login() {
		return ".login/LOGIN";
	} */
	
	
	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginId(@RequestBody RisUserDTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		RisUserDTO result = loginService.loginId(dto);

		if (result == null) {
			json.put("result", "none"); // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		} else {
			session.setAttribute("hspt_id", result.getHsptId());
	        session.setAttribute("login_id", result.getLoginId());
	        session.setAttribute("login_name", result.getLoginNm());
	        session.setAttribute("user_grade", result.getUserGrade());
			
			json.put("result", "success");
			//session.setAttribute("login", result);
		}
		return json;
	}
	
	
	// 메인 페이지 이동
	@GetMapping("/RISMAIN.do")
	public String risMainPage() {
		return ".main/RISMAIN";
	}
	
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		// 세션에서 특정 속성을 제거
		session.removeAttribute("hspt_id");
		session.removeAttribute("login_id");
		session.removeAttribute("login_name");
		session.removeAttribute("user_grade");
		
		return "redirect:/?hspt_id=A001";
	}
	

	// 비밀번호 변경 팝업
	@GetMapping("/RISUSERE00.do")
	public String risuserE00() {
		return ".popup/RISUSERE00";
	}
	
	
	// 비밀번호 재설정 로그인, 비밀번호 확인
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
	@ResponseBody public JSONObject userPasswordChange(@RequestParam RisUserDTO dto, HttpSession session, HttpServletRequest request,
		HttpServletResponse response, Model model) throws Exception { 
		System.out.println("-----------변경------------");
		JSONObject json = new JSONObject();
		
		int result = loginService.userPasswordChange(dto);
		
		System.out.println(result);
		json.put("result", result);
		return json;
	}
}
