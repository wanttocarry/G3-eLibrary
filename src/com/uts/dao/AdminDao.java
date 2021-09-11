package com.uts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.uts.bean.AdminBean;
import com.uts.util.DBUtil;


public class AdminDao {

	
	public boolean Login_verify(String username, String password) {
		Connection conn = DBUtil.getConnectDb();
		PreparedStatement stm = null;
		ResultSet rs = null;
		String sql = "select * from admin where username='" + username + " 'and password='" + password + "'";
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return false;
	}
	
	public AdminBean getAdminInfo(String username,String password) {
		
		AdminBean adminbean = new AdminBean();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from admin where username= '" + username + "' and password= '" + password + "'";

		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if (rs.next()) {
				adminbean.setAid(rs.getInt("aid"));
				adminbean.setUsername(rs.getString("username"));
				adminbean.setName(rs.getString("name"));
				adminbean.setPassword(rs.getString("password"));
				adminbean.setEmail(rs.getString("email"));
				adminbean.setPhone(rs.getString("phone"));
				adminbean.setStatus(rs.getInt("status"));
				adminbean.setLend_num(rs.getInt("lend_num"));
				adminbean.setMaxbq_num(rs.getInt("maxbq_num"));
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return adminbean;
	}
	
	
	public void readerRegister(String username,String password,String email) {
		
		Connection conn = DBUtil.getConnectDb();
		String sql = "insert into admin(username,password,email) values(?,?,?)";
		int rs = 0;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, username);
			stm.setString(2, password);
			stm.setString(3, email);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	
}
