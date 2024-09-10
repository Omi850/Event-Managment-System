package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EventBook {
	  //<-----Id Manage Data-------->>
	  @Id
	  @GeneratedValue(strategy = GenerationType.AUTO) 
	  private int id;
	  private String statues;
	  private String qr_data;
	  private String Attend;
	  
	  //<-----User Data-------->>
	  private int user_id;
	  private String user_name;
	  private String user_mobile;
	  private String User_email;
	  private String User_address;
	  private String User_img;

	  //<-----Event Data-------->>
	  private int Eventid;
	  private String eventName;
	  private String startDate;
	  private String location;
	  private String name;
	  private String profileImg;
	  private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStatues() {
		return statues;
	}
	public void setStatues(String statues) {
		this.statues = statues;
	}
	public String getQr_data() {
		return qr_data;
	}
	public void setQr_data(String qr_data) {
		this.qr_data = qr_data;
	}
	public String getAttend() {
		return Attend;
	}
	public void setAttend(String attend) {
		Attend = attend;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getUser_email() {
		return User_email;
	}
	public void setUser_email(String user_email) {
		User_email = user_email;
	}
	public String getUser_address() {
		return User_address;
	}
	public void setUser_address(String user_address) {
		User_address = user_address;
	}
	public String getUser_img() {
		return User_img;
	}
	public void setUser_img(String user_img) {
		User_img = user_img;
	}
	public int getEventid() {
		return Eventid;
	}
	public void setEventid(int eventid) {
		Eventid = eventid;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "EventBook [id=" + id + ", statues=" + statues + ", qr_data=" + qr_data + ", Attend=" + Attend
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", user_mobile=" + user_mobile + ", User_email="
				+ User_email + ", User_address=" + User_address + ", User_img=" + User_img + ", Eventid=" + Eventid
				+ ", eventName=" + eventName + ", startDate=" + startDate + ", location=" + location + ", name=" + name
				+ ", profileImg=" + profileImg + ", email=" + email + "]";
	}
	public EventBook(int id, String statues, String qr_data, String attend, int user_id, String user_name,
			String user_mobile, String user_email, String user_address, String user_img, int eventid, String eventName,
			String startDate, String location, String name, String profileImg, String email) {
		super();
		this.id = id;
		this.statues = statues;
		this.qr_data = qr_data;
		Attend = attend;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_mobile = user_mobile;
		User_email = user_email;
		User_address = user_address;
		User_img = user_img;
		Eventid = eventid;
		this.eventName = eventName;
		this.startDate = startDate;
		this.location = location;
		this.name = name;
		this.profileImg = profileImg;
		this.email = email;
	}
	public EventBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
