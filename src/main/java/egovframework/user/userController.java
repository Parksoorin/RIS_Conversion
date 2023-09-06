package egovframework.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userController {
	@RequestMapping(value = "/user.do")
	public String menu(Model model) throws Exception {
		return ".main/menu/user";
	}
}

