package org.pwpw.kurierflex.controller;


import org.pwpw.kurierflex.domain.Users;
import org.pwpw.kurierflex.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegistrationController {
	
	@Autowired
	UserService userService;
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = {"/", "/main"}, method = RequestMethod.POST)
	public String Register(Model model, @ModelAttribute("newUser") Users user) {
		userService.createNewUserAccount(user,"ROLE_USER");
		return "redirect:/login.htm";
	}
}
