package com.uts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.uts.bean.BookBean;
import com.uts.util.DBUtil;

public class BookDao {

	public void deleteBook(int bid) {
		Connection conn = DBUtil.getConnectDb();
		String sql = "delete from book where bid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, bid);
			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BookBean> get_ListInfo() {
		ArrayList<BookBean> tag_Array = new ArrayList<BookBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from book";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				BookBean tag = new BookBean();
				tag.setBid(rs.getInt("bid"));
				tag.setName(rs.getString("name"));
				tag.setCard(rs.getString("card"));
				tag.setType(rs.getString("type"));
				tag.setAuthor(rs.getString("author"));
				tag.setPress(rs.getString("press"));
				tag.setOverduePrice(rs.getFloat("overduePrice"));
				tag.setBookPrice(rs.getFloat("bookPrice"));
				tag.setBorrowPrice(rs.getFloat("borrowPrice"));
				tag.setState(rs.getInt("state"));
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
	
	
	public ArrayList<BookBean> getLikeList(String name) {
		ArrayList<BookBean> tag_Array = new ArrayList<BookBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from book where name like '%" + name + "%' or author like '%" + name
				+ "%' or type like '%" + name + "%'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				BookBean tag = new BookBean();
				tag.setBid(rs.getInt("bid"));
				tag.setName(rs.getString("name"));
				tag.setCard(rs.getString("card"));
				tag.setType(rs.getString("type"));
				tag.setAuthor(rs.getString("author"));
				tag.setPress(rs.getString("press"));
				tag.setOverduePrice(rs.getFloat("overduePrice"));
				tag.setBookPrice(rs.getFloat("bookPrice"));
				tag.setBorrowPrice(rs.getFloat("borrowPrice"));
				tag.setState(rs.getInt("state"));
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}

	public void addBook(String card, String name, String type, String author, String press, Float bookPrice,
			Float borrowPrice, Float overduePrice) {
		

		Connection conn = DBUtil.getConnectDb();
		String sql = "insert into book(card,name,type,author,press,bookPrice,borrowPrice,overduePrice) values(?,?,?,?,?,?,?,?)";
		int rs = 0;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, card);
			stm.setString(2, name);
			stm.setString(3, type);
			stm.setString(4, author);
			stm.setString(5, press);
			stm.setFloat(6, bookPrice);
			stm.setFloat(7, borrowPrice);
			stm.setFloat(8, overduePrice);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


	

}
