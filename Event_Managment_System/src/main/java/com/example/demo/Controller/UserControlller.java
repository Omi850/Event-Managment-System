package com.example.demo.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.Model.Event;
import com.example.demo.Model.EventBook;
import com.example.demo.Model.Userdata;
import com.example.demo.Respo.RespoBookEvent;
import com.example.demo.Respo.Respoeventdata;
import com.example.demo.Respo.respoadmindata;
import com.example.demo.Respo.responseuserdata;
import com.mysql.cj.Session;

@Controller
public class UserControlller {
	//Event
	@Autowired
	private Respoeventdata eventobj;
	//Admin
	@Autowired
	private respoadmindata objAdmin;
	//User
	@Autowired
	private responseuserdata obUser;
	//BookEvent
	@Autowired
	private RespoBookEvent obbook;

	//Gmail
    @Autowired
    private JavaMailSender mailSender;
    
    
	//BookEvent Table for User
    @RequestMapping("/BookEvent")
    public String ShowEvent(Model m,HttpSession Session) {
    	List<Event> eventdata=eventobj.Eventdata();
    	m.addAttribute("event", eventdata);
    	return "User/BookEvent.jsp";
    }
    
   //Request for for Join Using Gmail
    @PostMapping("/requestJoinEvent")
    public String requestJoinEvent(Model m, 
    		@RequestParam("eventId") int eventId,
    		@RequestParam("email") String email,
            @RequestParam("userId") int userId) {
    	   EventBook obj=obbook.Alldata(eventId,email);
    	   if(obj==null) {
    	  SimpleMailMessage message = new SimpleMailMessage();
    	    message.setFrom("eventmanage710@gmail.com");
    	    message.setTo("omiyadav710@gmail.com");
    	    message.setSubject("Event verification Code");
    	    Random random = new Random();
    	    int code = 1000 + random.nextInt(9000);
    	    m.addAttribute("code", code);
    	    message.setText("Your Code:->"+code);
    	    m.addAttribute("eventId", eventId);
    	    m.addAttribute("userId", userId);
    	    mailSender.send(message);
    	    return "User/Userverification.jsp";
    	   }else {
    		   return "redirect:/BookEvent?message=Already+requested+to+join+this+event";
    	    }
    }
    
    //verification For Gmail
    @RequestMapping("/verification")
    public String verification(@RequestParam int number,@RequestParam int verificationCode,Model m, 
    		@RequestParam("eventId") int eventId,
            @RequestParam("userId") int userId){
    	if(number==verificationCode) {
    		System.out.println("Verification Done");
       	    m.addAttribute("eventId", eventId);
    	    m.addAttribute("userId", userId);
        	return "/sentRequest";	

    	}else {
    		System.out.println("Verification failed");
        	return "/sentRequest";	

    	}
    }
    
     // Request Accept Here
     @RequestMapping("/sentRequest")
     public String sentReqest(
    		 @RequestParam("eventId") int eventId,
             @RequestParam("userId") int userId
              )
    		 {
             EventBook ob=new EventBook();
             ob.setEventid(eventId);
             ob.setUser_id(userId);
             ob.setStatues("pending");
             ob.setQr_data("disabled");
             ob.setAttend("not_attend");
             
             Event obj=eventobj.findById(eventId).orElse(null);
             ob.setEventName(obj.getEventName());
             ob.setStartDate(obj.getStartDate());
             ob.setEmail(obj.getEmail());
             ob.setName(obj.getName());
             ob.setProfileImg(obj.getProfileImg());
             ob.setLocation(obj.getLocation());
             
             
             Userdata obuser=obUser.findById(userId).orElse(null);
             ob.setUser_name(obuser.getUser());
             ob.setUser_img(obuser.getImg());
             ob.setUser_email(obuser.getEmail());
             ob.setUser_address(obuser.getAddress());
             ob.setUser_mobile(obuser.getMobile());
             obbook.save(ob);
             return "redirect:/MyEvent";
             }
     
     
     
     
     
     //<--------------------------------------------------------------------------------------------------------------->
     //<---------------------------------MyEvent(Booked,pending,Accepted,Attended)------------------------------------->
     //<--------------------------------------------------------------------------------------------------------------->

     @RequestMapping("/MyEvent")
     public String MyEvent(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("BookCount", obbook.count());
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("pending", obbook.pendingCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	     session.setAttribute("rejected", obbook.rejectedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userAllData((int)data));
    	 return "User/UserEventData.jsp";
     }
     
     
     @RequestMapping("/MyEventBooked")
     public String MyEventBooked(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("BookCount", obbook.count());
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("pending", obbook.pendingCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	     session.setAttribute("rejected", obbook.rejectedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userAcceptedByUserId((int)data));
    	 return "User/UserEventData.jsp";
     }
     
     @RequestMapping("/MyEventattend")
     public String MyEventattend(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("BookCount", obbook.CountAll((int)data));
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("pending", obbook.pendingCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	     session.setAttribute("rejected", obbook.rejectedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userAttendedByUserId((int)data));
    	 return "User/UserEventData.jsp";
     }
     
     @RequestMapping("/MyEventpending")
     public String MyEventpending(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
	         session.setAttribute("BookCount", obbook.CountAll((int)data));
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("pending", obbook.pendingCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	     session.setAttribute("rejected", obbook.rejectedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userPendingByUserId((int)data));
    	 return "User/UserEventData.jsp";
     }
     
     
     @RequestMapping("/MyEventRejected")
     public String MyEventRejected(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("BookCount", obbook.count());
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("pending", obbook.pendingCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	     session.setAttribute("rejected", obbook.rejectedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userRejectedByUserId((int)data));
    	 return "User/UserEventData.jsp";
     }
   
     //<---------------------Profile Update And Qr Genrate----------------------------------------->
     @RequestMapping("/MyEventQrCode")
     public String MyEventQrCode(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("BookCount", obbook.count());
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	 m.addAttribute("event", obbook.userAcceptedByUserId((int)data));
    	 return "User/Qrcode.jsp";
     }
     
     @RequestMapping("/MyEventattendQrcode")
     public String MyEventattendQrcode(Model m,HttpSession session) {
    	 Object data = session.getAttribute("userId");
    	     session.setAttribute("attend", obbook.userAttendedCountByUserId((int)data));
    	     session.setAttribute("accepted", obbook.acceptedCountByUserId((int)data));
    	    m.addAttribute("event", obbook.userAttendedByUserId((int)data));
    	 return "User/Qrcode.jsp";
     }
     
     @RequestMapping("/profile")
     public String Profile(HttpSession session,Model m) {
    	 Object data = session.getAttribute("userId");
    	 Userdata ob=obUser.findById((int)data).orElse(null);
    	 m.addAttribute("data", ob);
    	 return "User/UserProfile.jsp";
     }
     
     private final String uploadDir = "C:/Users/omiya/OneDrive/Desktop/April/Oops/spring/Event_Managment_System/src/main/webapp/image/";
     
     @RequestMapping("/UpdateUserProfile")
     public String UpdateProfile(
    		 
    		 @RequestParam String email,
    		 @RequestParam String mobile,
    		 @RequestParam String address,
    		 @RequestParam String password,
    		 @RequestParam("img") MultipartFile file,
    		 HttpSession session
    		 ) throws IllegalStateException, IOException {

    	 Object data = session.getAttribute("userId");
    	 Userdata ob=obUser.findById((int)data).orElse(null);
    	 if(!file.isEmpty()) {
    		 String fileName = file.getOriginalFilename();
        	 File destinationFile = new File(uploadDir + fileName);
             file.transferTo(destinationFile);
             ob.setImg(fileName);
    	 }
    	 ob.setEmail(email);
    	 ob.setMobile(mobile);
    	 ob.setPassword(password);
    	 ob.setAddress(address);
    	 obUser.save(ob);
         session.setAttribute("userImagedata", ob.getImg());  
    	 return "/profile?message=Your profile has been successfully updated.";
     }

}
