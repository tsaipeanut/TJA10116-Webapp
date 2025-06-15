package com.store.model;

import java.util.*;

import com.store.model.StoreVO;
import java.sql.*;

public class StoreJDBCDAO implements StoreDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/eatfast_db?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = 
		"INSERT INTO store (store_name, store_loc, store_phone, store_time, store_status) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT store_id, store_name, store_loc, store_phone, store_time, store_status, create_time FROM store ORDER BY store_id";
	private static final String GET_ONE_STMT = 
		"SELECT store_id, store_name, store_loc, store_phone, store_time, store_status, create_time FROM store WHERE store_id = ?";
	private static final String DELETE = 
		"DELETE FROM store WHERE store_id = ?";
	private static final String UPDATE = 
		"UPDATE store SET store_name=?, store_loc=?, store_phone=?, store_time=?, store_status=?, create_time=? WHERE store_id = ?";

	@Override
	public void insert(StoreVO storeVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			Class.forName(driver);

			pstmt.setString(1, storeVO.getStoreName());
			pstmt.setString(2, storeVO.getStoreLoc());
			pstmt.setString(3, storeVO.getStorePhone());
			pstmt.setString(4, storeVO.getStoreTime());
			pstmt.setString(5, storeVO.getStoreStatus());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	
	@Override
	public void update(StoreVO storeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, storeVO.getStoreName());
			pstmt.setString(2, storeVO.getStoreLoc());
			pstmt.setString(3, storeVO.getStorePhone());
			pstmt.setString(4, storeVO.getStoreTime());
			pstmt.setString(5, storeVO.getStoreStatus());
			pstmt.setTimestamp(6, storeVO.getCreateTime());
			pstmt.setInt(7, storeVO.getStoreId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	
	
	
	
	

	@Override
	public void delete(Integer storeId) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);;

			Class.forName(driver);

			pstmt.setInt(1, storeId);
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}


	@Override
	public StoreVO findByPrimaryKey(Integer storeId) {
		StoreVO storeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, storeId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
					storeVO = new StoreVO();
					storeVO.setStoreId(rs.getInt("store_id"));
					storeVO.setStoreName(rs.getString("store_name"));
					storeVO.setStoreLoc(rs.getString("store_loc"));
					storeVO.setStorePhone(rs.getString("store_phone"));
					storeVO.setStoreTime(rs.getString("store_time"));
					storeVO.setStoreStatus(rs.getString("store_status"));
					storeVO.setCreateTime(rs.getTimestamp("create_time"));
				}
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return storeVO;
	}

	@Override
	public List<StoreVO> getAll() {
		List<StoreVO> list = new ArrayList<StoreVO>();
		
		StoreVO storeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStoreId(rs.getInt("store_id"));
				storeVO.setStoreName(rs.getString("store_name"));
				storeVO.setStoreLoc(rs.getString("store_loc"));
				storeVO.setStorePhone(rs.getString("store_phone"));
				storeVO.setStoreTime(rs.getString("store_time"));
				storeVO.setStoreStatus(rs.getString("store_status"));
				storeVO.setCreateTime(rs.getTimestamp("create_time"));
				list.add(storeVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	// 測試用 main 方法
	public static void main(String[] args) {
		StoreJDBCDAO dao = new StoreJDBCDAO();

//		// 新增
//		StoreVO storeVO1 = new StoreVO();
//		storeVO1.setStoreName("二號店");
//		storeVO1.setStoreLoc("桃園市中壢區復興路46號9樓");
//		storeVO1.setStorePhone("034251108");
//		storeVO1.setStoreTime("平日05:30~13:00 / 假日 07:00~18:00 周一公休");
//		storeVO1.setStoreStatus("休息中");
//		storeVO1.setCreateTime(java.sql.Timestamp.valueOf("2025-06-11 09:58:24"));
//		dao.insert(storeVO1);
////
////		// 修改
//		StoreVO storeVO2 = new StoreVO();
//		storeVO2.setStoreId(2);
//		storeVO2.setStoreName("五號店");
//		storeVO2.setStoreLoc("桃園市中壢區復興路46號9樓");
//		storeVO2.setStorePhone("034251108");
//		storeVO2.setStoreTime("平日05:30~13:00 / 假日 07:00~18:00 周一公休");
//		storeVO2.setStoreStatus("營業中");
//		storeVO2.setCreateTime(java.sql.Timestamp.valueOf("2025-06-11 09:58:24"));
//		dao.update(storeVO2);
////
////		// 刪除
//		dao.delete(3);
////
////		// 查詢單筆
//		StoreVO storeVO3 = dao.findByPrimaryKey(1);
//		System.out.print(storeVO3.getStoreId() + ",");
//		System.out.print(storeVO3.getStoreName() + ",");
//		System.out.print(storeVO3.getStoreLoc() + ",");
//		System.out.print(storeVO3.getStorePhone() + ",");
//		System.out.print(storeVO3.getStoreTime() + ",");
//		System.out.print(storeVO3.getStoreStatus() + ",");
//		System.out.print(storeVO3.getCreateTime());
//		System.out.println();
//		// 查詢全部
//		System.out.println("查詢全部:");
//		List<StoreVO> list = dao.getAll();
//		for (StoreVO aStore : list) {
//			System.out.print(aStore.getStoreId() + ",");
//			System.out.print(aStore.getStoreName() + ",");
//			System.out.print(aStore.getStoreLoc() + ",");
//			System.out.print(aStore.getStorePhone() + ",");
//			System.out.print(aStore.getStoreTime() + ",");
//			System.out.print(aStore.getStoreStatus() + ",");
//			System.out.print(aStore.getCreateTime());
//			System.out.println();
//		}
	}
}
