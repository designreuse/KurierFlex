package org.pwpw.kurierflex.controller;


import java.security.Principal;
import java.util.ArrayList;

import org.pwpw.kurierflex.domain.Parcel;
import org.pwpw.kurierflex.domain.Users;
import org.pwpw.kurierflex.services.ParcelService;
import org.pwpw.kurierflex.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserPanelController {
	
	@Autowired
	ParcelService parcelService;
	
	@Autowired
	UserService userService;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = { "/userPanel" }, method = RequestMethod.GET)
	public String mainPage(Model model) {
	       model.addAttribute("title", "KurierFlex - panel użytkownika");
	       return "user/userPanel";
	   }
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = { "userPanel/newOrder" }, method = RequestMethod.GET)
	public String newOrderPage(Model model) {
	       model.addAttribute("title", "KurierFlex - panel użytkownika - zamów kuriera");
	       model.addAttribute("newOrder", new Parcel());
	       return "user/newOrder";
	   }
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = { "userPanel/newOrder" }, method = RequestMethod.POST)
	public String addOrder(Model model, @ModelAttribute("newOrder") Parcel parcel) {
	       Integer result = parcelService.createNewParcel(parcel);
	       model.addAttribute("orderResult",result);
	       
	       return "user/newOrder";
	   }
	
	@RequestMapping(value = { "userPanel/history" }, method = RequestMethod.GET)
	public String orderHistoryPage(Model model, Principal principal) {
	       model.addAttribute("title", "KurierFlex - panel użytkownika - historia przesyłek");
	       String username = principal.getName();
	       Users user = userService.getUserByUsername(username); 
	       ArrayList<Parcel> userParcels = new ArrayList<Parcel>(parcelService.getUserParcels(user));
	       model.addAttribute("userParcels", userParcels);
	       return "user/orderHistory";
	   }

}
