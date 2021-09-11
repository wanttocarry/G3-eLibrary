package com.uts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.uts.util.DBUtil;
import com.uts.bean.TypeBean;

public class TypeDao {

	
	public ArrayList<TypeBean> get_ListInfo() {
		ArrayList<TypeBean> tag_Array = new ArrayList<TypeBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from booktype";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				TypeBean tag = new TypeBean();
				tag.setBooktypeid(rs.getInt("booktypeid"));
				tag.setName(rs.getString("name"));
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
}
