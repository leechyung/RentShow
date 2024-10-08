package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Purchase;
import my.util.JdbcUtil;

public class PurchaseDao {
	
	public void insert(Connection conn, Purchase purchase) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into purchase (buyerId, name, phonenum, address, cid, price, sdate, edate)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, purchase.getBuyerId());
			pstmt.setString(2, purchase.getName());
			pstmt.setInt(3, purchase.getPhonenum());
			pstmt.setString(4, purchase.getAddress());
			pstmt.setInt(5, purchase.getCid());
			pstmt.setInt(6, purchase.getPrice());
			pstmt.setTimestamp(7, new Timestamp(purchase.getSdate().getTime()));
			pstmt.setTimestamp(8, new Timestamp(purchase.getEdate().getTime()));
			
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	

	public List<Purchase> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Purchase> purchaseList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from purchase ");			
			rs  = pstmt.executeQuery(); 
			purchaseList = new ArrayList<Purchase>();
			while (rs.next()){
				Purchase purchase = new Purchase();
				purchase.setPurchaseId(rs.getInt(1));
				purchase.setBuyerId(rs.getString(2));
				purchase.setName(rs.getString(3));
				purchase.setPhonenum(rs.getInt(4));
				purchase.setCid(rs.getInt(5));
				purchase.setPrice(rs.getInt(6));
				purchase.setSdate(rs.getTimestamp(7));
				purchase.setSdate(rs.getTimestamp(8));
				
				purchaseList.add(purchase);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return purchaseList;
	}

}




















