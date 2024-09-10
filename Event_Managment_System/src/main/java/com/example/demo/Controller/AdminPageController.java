package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Respo.RespoBookEvent;
import com.example.demo.Respo.Respoeventdata;
import com.example.demo.Respo.responseuserdata;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminPageController {
	//Event
	@Autowired
	private Respoeventdata eventobj;
	
	//User
	@Autowired
	private responseuserdata userobj;
	
	//Book
	@Autowired
	private RespoBookEvent bookobj;
	
	//Home
	@RequestMapping("/AdminHome")
	public String AdmimHome(Model m,HttpSession session) {
		 session.setAttribute("count",eventobj.count() );
         session.setAttribute("usercount",userobj.count() );
         session.setAttribute("userBooking",bookobj.userBooking() );
         session.setAttribute("userAttend",bookobj.userattended() );
	 m.addAttribute("Eventdata", eventobj.findLimitedData());
     return "Admin/AdminHome.jsp?message=null";
	}

	//createEventPage
	@RequestMapping("/AdminEventAdd")
	public String AdmimEventAdd(HttpSession session) {
		 session.setAttribute("count",eventobj.count() );

    return "Admin/AdminEvent.jsp";
	}
	@RequestMapping("/Adminprofile")
	public String Adminprofile(HttpSession session) {
      return "Admin/AdminProfile.jsp";
	}
	
	//Logout Session
	@GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        if (request.getCookies() != null) {
            for (var cookie : request.getCookies()) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return "redirect:/index.jsp"; 
    }
}
