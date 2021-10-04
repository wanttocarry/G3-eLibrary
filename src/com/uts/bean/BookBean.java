package com.uts.bean;

public class BookBean {
	
	private int bid;
	private String name;
	private String card;
	private String author;
	private String type;
	private String press;
	private float bookPrice;
	private float borrowPrice;
	private float overduePrice;

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public float getOverduePrice() {
		return overduePrice;
	}

	public void setOverduePrice(float overduePrice) {
		this.overduePrice = overduePrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}



	public float getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(float bookPrice) {
		this.bookPrice = bookPrice;
	}

	public float getBorrowPrice() {
		return borrowPrice;
	}

	public void setBorrowPrice(float borrowPrice) {
		this.borrowPrice = borrowPrice;
	}

	

}
