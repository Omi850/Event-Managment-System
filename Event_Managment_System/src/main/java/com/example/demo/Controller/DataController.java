package com.example.demo.Controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Model.EventBook;
import com.example.demo.Model.Userdata;
import com.example.demo.Model.admin;
import com.example.demo.Respo.RespoBookEvent;
import com.example.demo.Respo.Respoeventdata;
import com.example.demo.Respo.respoadmindata;
import com.example.demo.Respo.responseuserdata;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import javax.servlet.http.HttpSession;
@Controller
public class DataController {
    //User
    @Autowired
    private responseuserdata userobj;
    //admin
    @Autowired
    private respoadmindata adminobj;
    //Event
    @Autowired
    private Respoeventdata eventobj; 
    //BookEvent
	@Autowired
	private RespoBookEvent obBookEvent;

    private final String uploadDir = "C:/Users/omiya/OneDrive/Desktop/April/Oops/spring/Event_Managment_System/src/main/webapp/image/";

    //Index Page
    @RequestMapping("/")
    public String index() {
        return "index.jsp";
    }

    //User Register
    @RequestMapping("/userinsert")
    public ModelAndView uploadImage(
            @RequestParam("user") String username,
            @RequestParam("mobile") String mobile,
            @RequestParam("email") String email,
            @RequestParam("address") String address,
            @RequestParam("password") String password,
            @RequestParam("img") MultipartFile file) {
   
        Userdata obj = userobj.findByEmail(email);
        if (obj == null) {
            String message;

            if (file.isEmpty()) {
                message = "Image is Empty!!!";
            } else {
                String fileName = file.getOriginalFilename();
                if (fileName != null && isImageFile(fileName)) {
                    try {
                        File destinationFile = new File(uploadDir + fileName);
                        file.transferTo(destinationFile);
                        Userdata newUser = new Userdata();
                        newUser.setUser(username);
                        newUser.setEmail(email);
                        newUser.setMobile(mobile);
                        newUser.setPassword(password); // Ensure this is securely handled
                        newUser.setImg(fileName);
                        newUser.setAddress(address);
                        newUser.setBlock_Unblock("unblock");
                        userobj.save(newUser);
                        message = "User Registered Successfully!!!";
                    } catch (IOException e) {
                        e.printStackTrace();
                        message = "User Registration Failed!!!";
                    }
                } else {
                    message = "Only image files are allowed (jpg, jpeg, png, gif)";
                }
            }
            return new ModelAndView("redirect:/index.jsp?message=" + message);
        } else {
            String msg = "User Already Exists!!!";
            return new ModelAndView("redirect:/index.jsp?message=" + msg);
        }
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

    @RequestMapping("/loginuser")
    public String login(@RequestParam String email, @RequestParam String password ,Model m,HttpSession session) {
        Userdata obj = userobj.findByEmail(email);
        if (obj != null && obj.getEmail().equalsIgnoreCase(email) && obj.getPassword().equalsIgnoreCase(password)) {
        	if(!obj.getBlock_Unblock().equalsIgnoreCase("block")) {
             // Add the total event count to the model
            String msg = "Login Successful!!!";
            session.setAttribute("userId", obj.getId());
            session.setAttribute("userNameData", obj.getUser());
            session.setAttribute("userImagedata", obj.getImg());  
            session.setAttribute("BookCount", obBookEvent.count());
            session.setAttribute("upcoming", eventobj.Event_upCount());
            session.setAttribute("attend", obBookEvent.userAttendedCountByUserId(obj.getId()));
            session.setAttribute("pending", obBookEvent.pendingCountByUserId(obj.getId()));
            session.setAttribute("accepted", obBookEvent.acceptedCountByUserId(obj.getId()));
            m.addAttribute("userEvents",obBookEvent.userAcceptedData(obj.getId()));
            return "User/UserHome.jsp?message=" + msg;
        	}else {
            	 String msg = "You Blocked By Admin Contact Us!!!";
                 return "index.jsp?message=" + msg;
            }
        } else {
            String msg = "Incorrect Email or Password!!!";
            return "index.jsp?message=" + msg;
        }
    }
    
    //Admin Login
    @RequestMapping("/LoginAdmin")
    public String loginAdmin(@RequestParam String email, @RequestParam String password,HttpSession session,Model m) {
       admin obj = adminobj.findByEmail(email);
  	     m.addAttribute("Eventdata", eventobj.findLimitedData());
        if (obj != null && obj.getEmail().equalsIgnoreCase(email) && obj.getPassword().equalsIgnoreCase(password)) {
            String msg = "Login Successful!!!";
            session.setAttribute("count",eventobj.count() );
            session.setAttribute("usercount",userobj.count() );
            System.out.println(session.getAttribute("count"));
   		    session.setAttribute("adminEmail",email);
   		    session.setAttribute("adminpass",password);
            session.setAttribute("userBooking",obBookEvent.userBooking() );
            session.setAttribute("userAttend",obBookEvent.userattended() );
            return "Admin/AdminHome.jsp?message=" + msg;
        } else {
            String msg = "Incorrect Email or Password!!!";
            return "AdminLogin.jsp?message=" + msg;
        }
    }

    //Qr Code Genrate
    @RequestMapping("/Qr")
    public String generateQrCode(Model model,@RequestParam int id) {
    	 EventBook ob=obBookEvent.findById(id).orElse(null);
    	 
    	 String text = "**************************************************\n"
                 + "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tEvent Details\n"
                 + "**************************************************\n"
                 + String.format("%-2s: %s\n", "Organizer Name", ob.getName())
                 + String.format("%-2s: %s\n", "Organizer Email", ob.getEmail())
                 + String.format("%-20s: %s\n", "Event Name", ob.getEventName())
                 + String.format("%-20s: %s\n", "Location", ob.getLocation())
                 + String.format("%-20s: %s\n", "Start Date", ob.getStartDate())
                 + "**************************************************\n"
                 + "\t\t\t\t\t\t\t\t\t\t\t\t\t\tInvitee Details\n"
                 + "**************************************************\n"
                 + String.format("%-20s: %s\n", "Invitee Name", ob.getUser_name())
                 + String.format("%-20s: %s\n", "Email", ob.getUser_email())
                 + String.format("%-20s: %s\n", "Mobile", ob.getUser_mobile())
                 + "**************************************************";

        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 250, 250);

            ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
            byte[] qrCodeImage = pngOutputStream.toByteArray();

            String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCodeImage);
            model.addAttribute("organizerName", ob.getName());
            model.addAttribute("organizerEmail", ob.getEmail());
            model.addAttribute("eventName", ob.getEventName());
            model.addAttribute("location",ob.getLocation());
            model.addAttribute("startDate", ob.getStartDate());

            model.addAttribute("inviteeName", ob.getUser_name());
            model.addAttribute("email",ob.getUser_email());
            model.addAttribute("mobile", ob.getUser_email());
            model.addAttribute("qrCode", qrCodeBase64); 

            return "QrcodeView.jsp";
        } catch (WriterException | IOException e) {
            model.addAttribute("error", "Could not generate QR Code");
            return "QrcodeView.jsp";
        }
    }
}
