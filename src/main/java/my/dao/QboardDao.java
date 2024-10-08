package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Qboard;
import my.util.JdbcUtil;

public class QboardDao {
	
	public void insert(Connection conn, Qboard board) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into qboard (qtitle,qcontent,quserId,qdate)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, board.getQtitle());
			pstmt.setString(2, board.getQcontent());
			pstmt.setString(3, board.getQuserId());
			pstmt.setTimestamp(4, new Timestamp(board.getQdate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Qboard selectById(Connection conn, int qboardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Qboard qboard = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from qboard where qboardId = ?");
			pstmt.setInt(1, qboardId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				qboard = new Qboard(); 
				qboard.setQboardId(rs.getInt(1));
				qboard.setQtitle(rs.getString(2));
				qboard.setQcontent(rs.getString(3));
				qboard.setQuserId(rs.getString(4));
				qboard.setQdate(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return qboard;
	}
	
	public List<Qboard> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Qboard qboard = null; 
		List<Qboard> qboards = new ArrayList<Qboard>();
		try {
			pstmt = conn.prepareStatement
			("select * from qboard where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				qboard = new Qboard(); 
				qboard.setQboardId(rs.getInt(1));
				qboard.setQtitle(rs.getString(2));
				qboard.setQcontent(rs.getString(3));
				qboard.setQuserId(rs.getString(4));
				qboard.setQdate(rs.getTimestamp(5));
				qboards.add(qboard);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return qboards;
	}
	
	public void update(Connection conn, Qboard qboard) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update qboard set qtitle=?,qcontent=?,quserId=?, "
					+ "   qdate=? where qboardId=?");
			pstmt.setString(1, qboard.getQtitle());
			pstmt.setString(2, qboard.getQcontent());
			pstmt.setString(3, qboard.getQuserId());
			pstmt.setTimestamp(4, new Timestamp(qboard.getQdate().getTime()));
			pstmt.setInt(5, qboard.getQboardId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int qboardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from qboard where qboardId = ?");
			pstmt.setInt(1, qboardId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from qboard");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Qboard> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qboard> qboardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from qboard ");			
			rs  = pstmt.executeQuery(); 
			qboardList = new ArrayList<Qboard>();
			while (rs.next()){
				Qboard qboard = new Qboard();
				qboard.setQboardId(rs.getInt(1));
				qboard.setQtitle(rs.getString(2));
				qboard.setQcontent(rs.getString(3));
				qboard.setQuserId(rs.getString(4));
				qboard.setQdate(rs.getTimestamp(5));
				qboardList.add(qboard);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return qboardList;
	}
}




















