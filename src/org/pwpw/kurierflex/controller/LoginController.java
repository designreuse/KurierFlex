package org.pwpw.kurierflex.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String LoginPage(Model model) {
		model.addAttribute("title", "KurierFlex - logowanie");
		return "login";
	}
}

