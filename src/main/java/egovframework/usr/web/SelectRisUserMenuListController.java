package egovframework.usr.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SelectRisUserMenuListController {
	@RequestMapping(value = "/SelectRisUserMenuList.do")
	public String menu(Model model) throws Exception {
		return ".main/usr/SelectRisUserMenuList";
	}
}

