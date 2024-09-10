package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO) 
	private int id;
  private String eventName;
  private String startDate;
  private String endDate;
  private String location;
  private String name;
  private String profileImg;
  private String eventImg;
  private String email;
  private String eventType;
  private String status;
  private String description;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public String getEndDate() {
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
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
public String getEventImg() {
	return eventImg;
}
public void setEventImg(String eventImg) {
	this.eventImg = eventImg;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEventType() {
	return eventType;
}
public void setEventType(String eventType) {
	this.eventType = eventType;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Event(int id, String eventName, String startDate, String endDate, String location, String name,
		String profileImg, String eventImg, String email, String eventType, String status, String description) {
	super();
	this.id = id;
	this.eventName = eventName;
	this.startDate = startDate;
	this.endDate = endDate;
	this.location = location;
	this.name = name;
	this.profileImg = profileImg;
	this.eventImg = eventImg;
	this.email = email;
	this.eventType = eventType;
	this.status = status;
	this.description = description;
}
public Event() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "Event [id=" + id + ", eventName=" + eventName + ", startDate=" + startDate + ", endDate=" + endDate
			+ ", location=" + location + ", name=" + name + ", profileImg=" + profileImg + ", eventImg=" + eventImg
			+ ", email=" + email + ", eventType=" + eventType + ", status=" + status + ", description=" + description
			+ "]";
}
  
}
