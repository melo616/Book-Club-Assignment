package com.codingdojo.loginreg.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	//1. attributes
	//required fields: email, password
	@NotEmpty(message="Email is required")
	@Email(message="Please enter a valid email")
	private String email;
	
	@NotEmpty(message="Password is required")
	@Size(min=8, max=128, message="Password must be between 8 and 128 characters long")
	private String password;
	//2. zero-argument constructor
	
	public LoginUser() {}

	//3. getters/setters
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
//This class is for databinding and will not be stored in the database.
