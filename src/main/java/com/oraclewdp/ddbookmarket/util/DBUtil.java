package com.oraclewdp.ddbookmarket.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 数据库工具类:
 *   1 用于减少代码重复
 *   2 让修改用户名，主机和密码等不需要重新编译类
 */
public class DBUtil {
	private static Properties pro;
	//文件内容在运行前已经指定好，因而只需要加载一次即可
	static {
		pro = new Properties();
		try {
			//加载和DBUtil放置相同包下的属性文件
			pro.load(DBUtil.class.getResourceAsStream("db.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 只需要注册一次即可，正如你到工地报告你来了一次
	static {
		try {
			Class.forName(pro.getProperty("driverClass"));
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(pro.getProperty("url"), pro.getProperty("user"), pro.getProperty("pwd"));
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	public static void free(ResultSet rs, Statement stmt, Connection conn) {
		//注意关闭的顺序
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void free(Statement stmt, Connection conn) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
