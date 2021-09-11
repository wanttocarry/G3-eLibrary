package com.uts.bean;

public class AdminBean {

	private int aid;
	private String username;
	private String name;
	private String password;
	private String email;
	private String phone;
	private int status;
	private int lend_num;
	private int maxbq_num;
	private double balance;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getLend_num() {
		return lend_num;
	}

	public void setLend_num(int lend_num) {
		this.lend_num = lend_num;
	}


	public double getBalance() {
		return balance;
	}

	public int getMaxbq_num() {
		return maxbq_num;
	}

	public void setMaxbq_num(int maxbq_num) {
		this.maxbq_num = maxbq_num;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

}
