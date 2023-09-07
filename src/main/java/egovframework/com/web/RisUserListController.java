package egovframework.com.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RisUserListController {
	@RequestMapping(value = "/RisUserList.do")
	public String menu(Model model) throws Exception {
		return ".main/com/RisUserList";
	}
}

