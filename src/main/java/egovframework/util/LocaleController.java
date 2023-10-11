package egovframework.util;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
public class LocaleController {

	@PostMapping("/util/locale.do")
	@ResponseBody
	public ResponseEntity<?> localeChange(@RequestBody Map<String, Object> map, HttpServletRequest request){
		System.out.println("로케일컨트롤러 호출!!!");
		String lang  = map.get("lang").toString();
		System.out.println(lang);
		HttpSession session = request.getSession();
		Locale locale = new Locale(lang);
		session.setAttribute("lang", lang);
		session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
		return ResponseEntity.ok("로케일 변경완료");
	}
	
}
