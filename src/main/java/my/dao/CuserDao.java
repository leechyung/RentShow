package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Cuser;
import my.util.JdbcUtil;

public class CuserDao {
	
	public void insert(Connection conn, Cuser user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into cuser values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getCuserId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setInt(4, user.getYear());
			pstmt.setInt(5, user.getMonth());
			pstmt.setInt(6, user.getDay());
			pstmt.setInt(7, user.getPhonenum());
			pstmt.setString(8, user.getSex());
			pstmt.setTimestamp(9, new Timestamp(user.getLoginTime().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Cuser selectById(Connection conn, String cuserId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Cuser user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from cuser where cuserId = ?");
			pstmt.setString(1, cuserId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new Cuser(); 
				user.setCuserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setYear(rs.getInt(4));
				user.setMonth(rs.getInt(5));
				user.setDay(rs.getInt(6));
				user.setPhonenum(rs.getInt(7));
				user.setSex(rs.getString(8));
				user.setLoginTime(rs.getTimestamp(9));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	
	public boolean checkPassword(Connection conn, String cuserId, String password) 
	throws SQLException{
		Cuser cuser = selectById(conn, cuserId); 
		if (cuser.getPassword().equals(password)==true)
			return true;
		else
			return false;
	}
	
	public List<Cuser> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Cuser user = null; 
		List<Cuser> users = new ArrayList<Cuser>();
		try {
			pstmt = conn.prepareStatement
			("select * from user where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				user = new Cuser(); 
				user.setCuserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setYear(rs.getInt(4));
				user.setMonth(rs.getInt(5));
				user.setDay(rs.getInt(6));
				user.setPhonenum(rs.getInt(7));
				user.setSex(rs.getString(8));
				user.setLoginTime(rs.getTimestamp(9));
				users.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return users;
	}
	
	public void update(Connection conn, Cuser user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update user set password=?,name=? where userId=?");
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getCuserId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String cuserId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from user where userId = ?");
			pstmt.setString(1, cuserId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from user");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Cuser> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Cuser> userList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from user ");			
			rs  = pstmt.executeQuery(); 
			userList = new ArrayList<Cuser>();
			while (rs.next()){
				Cuser user = new Cuser();
				user.setCuserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setLoginTime(rs.getTimestamp(4));
				userList.add(user);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return userList;
	}
	
	public int idCheck(Connection conn, String uid){
		  int rst = 0;
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  try{
		   String sql = "select * from cuser where cuserId=?";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, uid);
		   rs = ps.executeQuery();
		   if(rs.next()){
		    rst = 1;
		   }
		  }catch(Exception e){
		   e.printStackTrace();
		  }finally{
			  JdbcUtil.close(conn);
			  JdbcUtil.close(rs);
			  JdbcUtil.close(ps);
		  }
		  return rst;
	}

}




















