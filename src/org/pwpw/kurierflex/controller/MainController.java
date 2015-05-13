package org.pwpw.kurierflex.controller;

import org.pwpw.kurierflex.domain.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	 
	@RequestMapping(value = { "/", "/main" }, method = RequestMethod.GET)
	public String MainPage(Model model) {
	       model.addAttribute("title", "KurierFlex");
	       model.addAttribute("newUser", new Users());
	       return "main";
	   }
}
