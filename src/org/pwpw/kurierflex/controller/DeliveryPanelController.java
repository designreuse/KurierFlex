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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeliveryPanelController {

	@Autowired
	ParcelService parcelService;

	@Autowired
	UserService userService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = { "/deliveryPanel" }, method = RequestMethod.GET)
	public String mainPage(Model model, Principal principal) {
		model.addAttribute("title", "KurierFlex - panel obsługi przesyłki");
		ArrayList<Parcel> waitingParcels = new ArrayList<Parcel>(
				parcelService.getParcelsExcludeStatus("doręczona"));
		model.addAttribute("allParcels", waitingParcels);
		String username = principal.getName();
		Users user = userService.getUserByUsername(username);
		ArrayList<Parcel> userParcels = new ArrayList<Parcel>(
				parcelService.getUserParcels(user));
		model.addAttribute("userParcels", userParcels);
		return "delivery/deliveryPanel";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = { "/deliveryPanel" }, method = RequestMethod.POST, params = { "assignParcel" })
	public String assignParcel(Model model,
			@RequestParam("parcelId") String parcelId, Principal principal) {

		String username = principal.getName();
		Users user = userService.getUserByUsername(username);
		Parcel parcel = parcelService.getParcelById(Integer.parseInt(parcelId));
		parcel.setCourier(user);
		String status = parcel.getStatus();

		if (status.equals("oczekująca")) {
			parcel.setStatus("6");
		} else if (status.equals("doręczona")) {
			parcel.setStatus("5");
		} else if (status.equals("przekazana kurierowi")) {
			parcel.setStatus("4");
		} else if (status.equals("paczka dotarła do terminala")) {
			parcel.setStatus("3");
		} else if (status.equals("w sortowni")) {
			parcel.setStatus("2");
		} else if (status.equals("odebrana od nadawcy")) {
			parcel.setStatus("1");
		}
		parcelService.updateParcel(parcel);

		return "redirect:/deliveryPanel.htm";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = { "/deliveryPanel" }, method = RequestMethod.POST, params = { "updateParcelStatus" })
	public String updateParcelStatus(Model model,
			@RequestParam("parcelId") String parcelId,
			@RequestParam("statusCode") String statusCode, Principal principal) {
		model.addAttribute("title", "KurierFlex - panel obsługi przesyłki");

		Parcel parcel = parcelService.getParcelById(Integer.parseInt(parcelId));
		parcel.setStatus(statusCode);
		parcelService.updateParcel(parcel);

		return "redirect:/deliveryPanel.htm";
	}

}