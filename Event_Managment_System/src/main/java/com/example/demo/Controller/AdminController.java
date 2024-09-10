package com.example.demo.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.Model.Event;
import com.example.demo.Model.EventBook;
import com.example.demo.Model.Userdata;
import com.example.demo.Model.admin;
import com.example.demo.Respo.RespoBookEvent;
import com.example.demo.Respo.Respoeventdata;
import com.example.demo.Respo.respoadmindata;
import com.example.demo.Respo.responseuserdata;


@Controller
public class AdminController {
    //this is created for a Event Table
	@Autowired
	private Respoeventdata eventobj;
	
    //this is created for a Admin Table
	@Autowired
	private respoadmindata objAdmin;
	
    //this is created for a User Table
	@Autowired
	private responseuserdata obUser;
	
    //this is created for a BookEvent Table
	@Autowired
	private RespoBookEvent obBook;

	
	//Create Event Here
    private final String uploadDir = "C:/Users/omiya/OneDrive/Desktop/April/Oops/spring/Event_Managment_System/src/main/webapp/image/";

    @RequestMapping("/createEvent")
    public ModelAndView uploadEvent(
            @RequestParam("eventName") String eventName,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("location") String location,
            @RequestParam("name") String organizerName,
            @RequestParam("profileImg") MultipartFile profileImgFile,
            @RequestParam("eventImg") MultipartFile eventImgFile,
            @RequestParam("email") String email,
            @RequestParam("eventType") String eventType,
            @RequestParam("status") String status,
            @RequestParam("description") String description) {
            String message;
            if (profileImgFile.isEmpty() || eventImgFile.isEmpty()) {
                message = "Profile or Event Image is Empty!!!";
            } else {
                String profileImgName = profileImgFile.getOriginalFilename();
                String eventImgName = eventImgFile.getOriginalFilename();

                if (profileImgName != null && isImageFile(profileImgName) &&
                    eventImgName != null && isImageFile(eventImgName)) {

                    try {
                        File profileDestinationFile = new File(uploadDir + profileImgName);
                        File eventDestinationFile = new File(uploadDir + eventImgName);

                        profileImgFile.transferTo(profileDestinationFile);
                        eventImgFile.transferTo(eventDestinationFile);

                        Event newEvent = new Event();
                        newEvent.setEventName(eventName);
                        newEvent.setStartDate(startDate);
                        newEvent.setEndDate(endDate);
                        newEvent.setLocation(location);
                        newEvent.setName(organizerName);
                        newEvent.setProfileImg(profileImgName);
                        newEvent.setEventImg(eventImgName);
                        newEvent.setEmail(email);
                        newEvent.setEventType(eventType);
                        newEvent.setStatus(status);
                        newEvent.setDescription(description);
                        

                        eventobj.save(newEvent);
                        message = "Event Registered Successfully!!!";
                    } catch (IOException e) {
                        e.printStackTrace();
                        message = "Event Registration Failed!!!";
                    }
                } else {
                    message = "Only image files are allowed (jpg, jpeg, png, gif)";
                }
            }
            return new ModelAndView("/AdminEventAdd?message="+message);
    }
    
    private boolean isImageFile(String fileName) {
        String[] allowedExtensions = {"jpg", "jpeg", "png", "gif"};
        String fileExtension = getFileExtension(fileName);
        for (String ext : allowedExtensions) {
            if (fileExtension.equalsIgnoreCase(ext)) {
                return true;
            }
        }
        return false;
     }

    private String getFileExtension(String fileName) {
        int lastIndexOfDot = fileName.lastIndexOf('.');
        return (lastIndexOfDot == -1) ? "" : fileName.substring(lastIndexOfDot + 1);
    }
    
    
    //Show All UserData
    @RequestMapping("/ShowUsersAll")
    public String ShowUsersAll(Model m,HttpSession session) {
    	 session.setAttribute("userCount",obUser.count());
         session.setAttribute("userBlockCount",obUser.user_blockCount());
         session.setAttribute("userUnBlockCount",obUser.user_unBlockCount());
    	List<Userdata> eventdata=obUser.findAll();
    	m.addAttribute("user", eventdata);
    	return "Admin/AdminUsers.jsp";
     }
    
    //Show All Block User Data Here
    @RequestMapping("/ShowUsersBlock")
    public String ShowUsersBlock(Model m,HttpSession session) {
    	 session.setAttribute("userCount",obUser.count());
         session.setAttribute("userBlockCount",obUser.user_blockCount());
         session.setAttribute("userUnBlockCount",obUser.user_unBlockCount());
    	List<Userdata> eventdata=obUser.userBlock();
    	m.addAttribute("user", eventdata);
    	return "Admin/AdminUsersBlock.jsp";
     }
    
    //Show All UserUnBlock Data Here
    @RequestMapping("/ShowUsersUnBlock")
    public String ShowUsersUnBlock(Model m,HttpSession session) {
    	 session.setAttribute("userCount",obUser.count());
         session.setAttribute("userBlockCount",obUser.user_blockCount());
         session.setAttribute("userUnBlockCount",obUser.user_unBlockCount());
    	List<Userdata> eventdata=obUser.userUnblock();
    	m.addAttribute("user", eventdata);
    	return "Admin/AdminUsers.jsp";
     }
   
    
    //<----------------------------------------------------------------------------------------------------->
    //<----------------------------------------Event Section Here------------------------------------------->
    //<----------------------------------------------------------------------------------------------------->
    //Show All Event Here
    @RequestMapping("/ShowEvent")
    public String ShowEvent(Model m) {
    	List<Event> eventdata=eventobj.Eventdata();
    	m.addAttribute("event", eventdata);
    	return "Admin/Event.jsp";
    }
    
    //Show All Event About Upcoming Status
    @RequestMapping("/ShowEventup")
    public String ShowEventup(Model m,HttpSession session) {
   	   session.setAttribute("Eventcount",eventobj.count());
       session.setAttribute("Event_upCount",eventobj.Event_upCount());
       session.setAttribute("Event_comCount",eventobj.Event_comCount());
    	List<Event> eventdata=eventobj.Eventdata();
    	m.addAttribute("event", eventdata);
    	return "Admin/EventData.jsp";
    }
    
    //Show All Event About Completed Status
    @RequestMapping("/ShowEventcom")
    public String ShowEventcom(Model m,HttpSession session) {
    	 session.setAttribute("Eventcount",eventobj.count());
         session.setAttribute("Event_upCount",eventobj.Event_upCount());
         session.setAttribute("Event_comCount",eventobj.Event_comCount());
    	List<Event> eventdata=eventobj.Eventdatacom();
    	m.addAttribute("event", eventdata);
    	return "Admin/EventData.jsp";
     }
    
    //Show All Event About Completed Status
    @RequestMapping("/ShowEventcomAll")
    public String ShowEventAll(Model m,HttpSession session) {
    	 session.setAttribute("Eventcount",eventobj.count());
         session.setAttribute("Event_upCount",eventobj.Event_upCount());
         session.setAttribute("Event_comCount",eventobj.Event_comCount());
    	List<Event> eventdata=eventobj.findAll();
    	m.addAttribute("event", eventdata);
    	return "Admin/EventData.jsp";
     }
    
    //Delete UserData
    @RequestMapping("/deleteUserdatadata")
    public String deleteUserdata(@RequestParam String id) {
    	System.out.println(id);
    	obUser.deleteById(Integer.parseInt(id));
    	return "redirect:/ShowUsersAll";
    }
    
    //Delete EventData
    @RequestMapping("/deleteEventdata")
    public String deleteEventdata(@RequestParam String id) {
    	eventobj.deleteById(Integer.parseInt(id));
    	return "redirect:/ShowEventcomAll";
    }

    //Update EventData
    @RequestMapping("/fetchEventdataUpdate")
    public String fetchEventdataUpdate( @RequestParam String id,Model m) {
    	Event ob=eventobj.findById(Integer.parseInt(id)).orElse(null);
    	m.addAttribute("Event",ob);
    	return "Admin/EventUpdate.jsp";
    }
    
    //Update EventData
    @RequestMapping("/updateEvent")
    public String EventdataUpdate(
            @RequestParam("id") int id, // Assume 'id' is an integer
            @RequestParam("eventName") String eventName,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("location") String location,
            @RequestParam("name") String organizerName,
            @RequestParam("profileImg") MultipartFile profileImgFile,
            @RequestParam("eventImg") MultipartFile eventImgFile,
            @RequestParam("email") String email,
            @RequestParam("eventType") String eventType,
            @RequestParam("status") String status,
            @RequestParam("description") String description) throws IllegalStateException, IOException {

        Event existingEvent = eventobj.findById(id).orElse(null);

        if (existingEvent == null) {
            return "redirect:/errorPage"; 
        }
        existingEvent.setEventName(eventName);
        existingEvent.setStartDate(startDate);
        existingEvent.setEndDate(endDate);
        existingEvent.setLocation(location);
        existingEvent.setName(organizerName);

        if (!profileImgFile.isEmpty()) {
      		 String fileName = profileImgFile.getOriginalFilename();
        	 File destinationFile = new File(uploadDir + fileName);
        	 profileImgFile.transferTo(destinationFile);
             existingEvent.setProfileImg(profileImgFile.getOriginalFilename());
        }
        if (!eventImgFile.isEmpty()) {
     		 String fileName = eventImgFile.getOriginalFilename();
        	 File destinationFile = new File(uploadDir + fileName);
        	 eventImgFile.transferTo(destinationFile);
            existingEvent.setEventImg(eventImgFile.getOriginalFilename());
        }
        existingEvent.setEmail(email);
        existingEvent.setEventType(eventType);
        existingEvent.setStatus(status);
        existingEvent.setDescription(description);

        eventobj.save(existingEvent);
        return "redirect:/ShowEventcomAll"; 
    }
    
    
    //<----------------------------------------- User Section Here---------------------------------------------->
    //UserBlock Here
    @RequestMapping("/UserBlock")
    public String UserBlock(@RequestParam int id) {
    	Userdata existinguser = obUser.findById(id).orElse(null);
    	existinguser.setBlock_Unblock("block");
    	obUser.save(existinguser);
    	return "redirect:/ShowUsersAll"; 
    }
    //User Unblock Here
    @RequestMapping("/UserUnBlock")
    public String UserUnBlock(@RequestParam int id) {
    	Userdata existinguser = obUser.findById(id).orElse(null);
    	existinguser.setBlock_Unblock("unblock");
    	obUser.save(existinguser);
    	return "redirect:/ShowUsersAll"; 
    }
     //Reset Password Here
    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam("newPassword") String pass, 
                                @RequestParam("confirmPassword") String newPass, 
                                @RequestParam("username") String username) {
        if (pass.equals(newPass)) {
            admin ob = objAdmin.findByEmail(username);
            ob.setPassword(pass);
            objAdmin.save(ob);
            return "redirect:/logout"; 
        } else {
            return "Adminprofile"; 
        }
    } 
    
    
   //<----------------------------------- Show Event(pending,accepted,Rejected,Attended,pending------------------------->
    @RequestMapping("/ShowEventBook")
    public String ShowEventBook(Model m,HttpSession session,@RequestParam int id) {
     	 session.setAttribute("Allcount",obBook.AllDataBookCount(id));
         session.setAttribute("AcceptCount",obBook.findAllAcceptedBooksByEventIdCount(id));
         session.setAttribute("RejectCount",obBook.findAllRejectedBooksByEventIdCount(id));
         session.setAttribute("PendingCount",obBook.findAllPendingBooksByEventIdCount(id));
         session.setAttribute("attendedCount",obBook.findAllattendedBooksByEventIdCount(id));
         session.setAttribute("Eventid",id);
    	 List<EventBook> eventdata=obBook.AllDataBook(id);
    	 m.addAttribute("eventBook", eventdata);
    	return "Admin/AdminInvitee.jsp";
     }
    
    @RequestMapping("/ShowRejected")
    public String ShowRejected(Model m,HttpSession session,@RequestParam int id){
     	 session.setAttribute("Allcount",obBook.AllDataBookCount(id));
         session.setAttribute("AcceptCount",obBook.findAllAcceptedBooksByEventIdCount(id));
         session.setAttribute("RejectCount",obBook.findAllRejectedBooksByEventIdCount(id));
         session.setAttribute("PendingCount",obBook.findAllPendingBooksByEventIdCount(id));
         session.setAttribute("attendedCount",obBook.findAllattendedBooksByEventIdCount(id));
         session.setAttribute("Eventid",id);
    	List<EventBook> eventdata=obBook.findAllRejectedBooksByEventId(id);
    	m.addAttribute("eventBook", eventdata);
    	return "Admin/AdminInvitee.jsp";
    }
    
    @RequestMapping("/ShowAccepted")
    public String ShowAccepted(Model m,HttpSession session,@RequestParam int id){
      	 session.setAttribute("Allcount",obBook.AllDataBookCount(id));
         session.setAttribute("AcceptCount",obBook.findAllAcceptedBooksByEventIdCount(id));
         session.setAttribute("RejectCount",obBook.findAllRejectedBooksByEventIdCount(id));
         session.setAttribute("PendingCount",obBook.findAllPendingBooksByEventIdCount(id));
         session.setAttribute("attendedCount",obBook.findAllattendedBooksByEventIdCount(id));
         session.setAttribute("Eventid",id);
    	List<EventBook> eventdata=obBook.findAllAcceptedBooksByEventId(id);
    	m.addAttribute("eventBook", eventdata);
    	return "Admin/AdminInvitee.jsp";
    }
    
     @RequestMapping("/ShowPending")
     public String ShowPending(Model m,HttpSession session,@RequestParam int id){
      	 session.setAttribute("Allcount",obBook.AllDataBookCount(id));
         session.setAttribute("AcceptCount",obBook.findAllAcceptedBooksByEventIdCount(id));
         session.setAttribute("RejectCount",obBook.findAllRejectedBooksByEventIdCount(id));
         session.setAttribute("PendingCount",obBook.findAllPendingBooksByEventIdCount(id));
         session.setAttribute("attendedCount",obBook.findAllattendedBooksByEventIdCount(id));
    	 session.setAttribute("Eventid",id);
    	 List<EventBook> eventdata=obBook.findAllPendingBooksByEventId(id);
    	 m.addAttribute("eventBook", eventdata);
    	 return "Admin/AdminInvitee.jsp";
     }
     
     @RequestMapping("/ShowAttended")
     public String ShowAttended(Model m,HttpSession session,@RequestParam int id){
      	 session.setAttribute("Allcount",obBook.AllDataBookCount(id));
         session.setAttribute("AcceptCount",obBook.findAllAcceptedBooksByEventIdCount(id));
         session.setAttribute("RejectCount",obBook.findAllRejectedBooksByEventIdCount(id));
         session.setAttribute("PendingCount",obBook.findAllPendingBooksByEventIdCount(id));
         session.setAttribute("attendedCount",obBook.findAllattendedBooksByEventIdCount(id));
    	 session.setAttribute("Eventid",id);
    	 List<EventBook> eventdata=obBook.findAllattendedBooksByEventId(id);
    	 m.addAttribute("eventBook", eventdata);
    	 return "Admin/AdminInvitee.jsp";
     } 
     
     
     @RequestMapping("/updateAcceptData")
     public String updateAcceptData(@RequestParam int id,HttpSession session) {
    	 EventBook ob=obBook.findById(id).orElse(null);
    	 ob.setStatues("accepted");
    	 obBook.save(ob);
    	 Object data = session.getAttribute("Eventid");
    	 return "redirect:/ShowEventBook?id="+(int)data;    
    }
     
     @RequestMapping("/updateRejected")
     public String updateRejected(@RequestParam int id,HttpSession session) {
    	 EventBook ob=obBook.findById(id).orElse(null);
    	 ob.setStatues("Rejected");
    	 obBook.save(ob);
    	 Object data = session.getAttribute("Eventid");
    	 return "redirect:/ShowEventBook?id="+(int)data;    
    }
    
     
     @RequestMapping("/updatePresent")
     public String updatePresent(@RequestParam int id,HttpSession session) {
    	 EventBook ob=obBook.findById(id).orElse(null);
    	 ob.setStatues("attended");
    	 obBook.save(ob);
    	 Object data = session.getAttribute("Eventid");
    	 return "redirect:/ShowEventBook?id="+(int)data;    
    }
}
