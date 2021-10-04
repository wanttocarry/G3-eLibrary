package com.uts.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class SQLUtil {
	private static SQLUtil instance = null;

	public static synchronized SQLUtil getInstance() {
		if (instance == null) {
			instance = new SQLUtil();
		}
		return instance;
	}

	public boolean update(String sql, Object[] paramArray) {

		boolean update = true;

		Connection con = DBUtil2.getInstance().getConnection();

		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(sql);
			if (paramArray != null) {
				for (int i = 0; i < paramArray.length; i++) {
					pstm.setObject(i + 1, paramArray[i]);
				}
			}
			pstm.executeUpdate();
		} catch (SQLException e) {
			update = false;
		} finally {
			DBUtil2.getInstance().close(con, pstm, null);
		}
		return update;
	}

	public ArrayList<String> getColumnName(String sql) {
		ArrayList<String> columnName = new ArrayList<String>();

		Connection con = DBUtil2.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;

		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int column = rsmd.getColumnCount();
			for (int i = 1; i <= column; i++) {
				columnName.add(rsmd.getColumnName(i).toString());
			}
		} catch (SQLException e) {
			return null;
		} finally {
			DBUtil2.getInstance().close(con, stm, rs);
		}
		return columnName;
	}

	public Object[] getSingleRow(String sql) {
		Object obj[] = null;

		Connection con = DBUtil2.getInstance().getConnection();
		Statement stm = null;
		ResultSet rs = null;

		try {
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			int colCount = rs.getMetaData().getColumnCount();
			if (rs.next()) {
				obj = new Object[colCount];
				for (int i = 1; i <= colCount; i++) {
					obj[i - 1] = rs.getObject(i);
				}
			}
		} catch (SQLException e) {
			return null;
		} finally {
			DBUtil2.getInstance().close(con, stm, rs);
		}
		return obj;
	}

	public Map<String, Object> getSingleObject(String sql) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> columnName = getColumnName(sql);
		Object obj[] = getSingleRow(sql);
		if (columnName == null || obj == null) {
			return null;
		}
		for (int i = 0; i < columnName.size(); i++) {
			map.put(columnName.get(i), obj[i]);
		}
		return map;
	}

}
