package com.uts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;


import com.uts.bean.HistoryBean;
import com.uts.bean.AdminBean;
import com.uts.bean.BookBean;
import com.uts.util.DBUtil;
import com.uts.util.SQLUtil;

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

	public void updateBook(int bid, String card, String name, String type, String author, String press, float bookPrice,
			float borrowPrice, float overduePrice) {
		Connection conn = DBUtil.getConnectDb();
		String sql = "update book set name=?,card=?,type=?,author=?,press=?,bookPrice=?,borrowPrice=?,overduePrice=? where bid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, name);
			stm.setString(2, card);
			stm.setString(3, type);
			stm.setString(4, author);
			stm.setString(5, press);
			stm.setFloat(6, bookPrice);
			stm.setFloat(7, borrowPrice);
			stm.setFloat(8, overduePrice);
			stm.setInt(9, bid);
			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void borrowBook(int bid, String card, String name, Float borrowPrice, AdminBean adminbean) {

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);

		String begintime = "" + year + "-" + month + "-" + day;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cd = Calendar.getInstance();
		try {
			cd.setTime(sdf.parse(begintime));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		cd.add(Calendar.DATE, 5);
		String endtime = sdf.format(cd.getTime());


		Connection conn = DBUtil.getConnectDb();
		String sql = "insert into history(aid,bid,card,bookname,username,begintime,endtime,status) values(?,?,?,?,?,?,?,?)";
		int rs = 0;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, adminbean.getAid());
			stm.setInt(2, bid);
			stm.setString(3, card);
			stm.setString(4, name);
			stm.setString(5, adminbean.getName());
			stm.setString(6, begintime);
			stm.setString(7, endtime);
			stm.setInt(8, 1);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<HistoryBean> get_HistoryListInfo(int status, int aid) {

		ArrayList<HistoryBean> tag_Array = new ArrayList<HistoryBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from history where aid=" + aid + " and status=" + status;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				HistoryBean history = new HistoryBean();
				history.setHid(rs.getInt("hid"));
				history.setAid(rs.getInt("aid"));
				history.setBid(rs.getInt("bid"));
				history.setBookname(rs.getString("bookname"));
				history.setCard(rs.getString("card"));
				history.setUsername(rs.getString("username"));
				history.setBegintime(rs.getString("begintime"));
				history.setEndtime(rs.getString("endtime"));
				history.setStatus(rs.getInt("status"));
				history.setOutPrice(rs.getInt("outPrice"));
				history.setOutNum(rs.getInt("outNum"));
				tag_Array.add(history);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}

	public Map<String, Object> getCountNoReturnNum(int aid) {

		String sql = "SELECT COUNT(*) as count FROM history where aid=" + aid + " AND `status`=1 ";

		return SQLUtil.getInstance().getSingleObject(sql);

	}

	public void borrowBook2(int hid) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		String endtime = "" + year + "-" + month + "-" + day;
		Connection conn = DBUtil.getConnectDb();
		String sql = "update history set endtime=?,status=? where hid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, endtime);
			stm.setInt(2, 0);
			stm.setInt(3, hid);
			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public BookBean get_BookInfo(int bid) {
		BookBean tag = new BookBean();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from book where bid=" + bid;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				tag.setBid(rs.getInt("bid"));
				tag.setName(rs.getString("name"));
				tag.setCard(rs.getString("card"));
				tag.setType(rs.getString("type"));
				tag.setAuthor(rs.getString("author"));
				tag.setPress(rs.getString("press"));
				tag.setOverduePrice(rs.getFloat("overduePrice"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag;
	}

	public boolean updateOut(int hid, Double outNum, double outPrice) {
		String sql = "update history set outNum=?,outPrice=? where hid=?";

		Object[] paramArray = new Object[3];
		paramArray[0] = outNum;
		paramArray[1] = outPrice;
		paramArray[2] = hid;

		return SQLUtil.getInstance().update(sql, paramArray);

	}

	public boolean updateBookReturnTime(int hid, String endTime) {

		String sql = "update history set endTime=? where hid=?";

		Object[] paramArray = new Object[2];
		paramArray[0] = endTime;
		paramArray[1] = hid;

		return SQLUtil.getInstance().update(sql, paramArray);

	}

}
