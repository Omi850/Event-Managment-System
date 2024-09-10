package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Respo.RespoBookEvent;
import com.example.demo.Respo.Respoeventdata;
import com.example.demo.Respo.respoadmindata;
import com.example.demo.Respo.responseuserdata;

@Controller
public class UserPageController {
	//Event
	@Autowired
	private Respoeventdata eventobj;
	//Admin
	@Autowired
	private respoadmindata objAdmin;
	//obuser
	@Autowired
	private responseuserdata obUser;
	//BookEvent
	@Autowired
	private RespoBookEvent obBookEvent;
	//UserHomePage Here
	@RequestMapping("/UserHome")
	public String AdmimHome(Model m,HttpSession session) {
	 Object data = session.getAttribute("userId");
     session.setAttribute("BookCount", obBookEvent.count());
     session.setAttribute("upcoming", eventobj.Event_upCount());
     session.setAttribute("attend", obBookEvent.userAttendedCountByUserId((int)data));
     session.setAttribute("pending", obBookEvent.pendingCountByUserId((int)data));
     session.setAttribute("accepted", obBookEvent.acceptedCountByUserId((int)data));
     m.addAttribute("userEvents",obBookEvent.userAcceptedData((int)data));
     
     return "User/UserHome.jsp?message=null";
	}

}
