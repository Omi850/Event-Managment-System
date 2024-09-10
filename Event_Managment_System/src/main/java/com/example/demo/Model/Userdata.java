package com.example.demo.Model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Userdata {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
  private int id;
  private String user;
  private String email;
  private String mobile;
  private String Address;
  private String password;
  private String img;
  private String Block_Unblock;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getBlock_Unblock() {
	return Block_Unblock;
}
public void setBlock_Unblock(String block_Unblock) {
	Block_Unblock = block_Unblock;
}
@Override
public String toString() {
	return "Userdata [id=" + id + ", user=" + user + ", email=" + email + ", mobile=" + mobile + ", Address=" + Address
			+ ", password=" + password + ", img=" + img + ", Block_Unblock=" + Block_Unblock + "]";
}
public Userdata() {
	super();
	// TODO Auto-generated constructor stub
}
public Userdata(int id, String user, String email, String mobile, String address, String password, String img,
		String block_Unblock) {
	super();
	this.id = id;
	this.user = user;
	this.email = email;
	this.mobile = mobile;
	Address = address;
	this.password = password;
	this.img = img;
	Block_Unblock = block_Unblock;
}

}
