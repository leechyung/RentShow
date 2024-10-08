package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Nboard;
import my.model.NboardListView;
import my.util.JdbcUtil;

public class NboardDao {
	
	public void insert(Connection conn, Nboard nboard) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into nboard (ntitle,ncontent,nuserId,ndate)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, nboard.getNtitle());
			pstmt.setString(2, nboard.getNcontent());
			pstmt.setString(3, nboard.getNuserId());
			pstmt.setTimestamp(4, new Timestamp(nboard.getNdate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Nboard selectById(Connection conn, int nboardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Nboard nboard = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from nboard where nboardId = ?");
			pstmt.setInt(1, nboardId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				nboard = new Nboard(); 
				nboard.setNboardId(rs.getInt(1));
				nboard.setNtitle(rs.getString(2));
				nboard.setNcontent(rs.getString(3));
				nboard.setNuserId(rs.getString(4));
				nboard.setNdate(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nboard;
	}
	
	public List<Nboard> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Nboard nboard = null; 
		List<Nboard> nboards = new ArrayList<Nboard>();
		try {
			pstmt = conn.prepareStatement
			("select * from nboard where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				nboard = new Nboard(); 
				nboard.setNboardId(rs.getInt(1));
				nboard.setNtitle(rs.getString(2));
				nboard.setNcontent(rs.getString(3));
				nboard.setNuserId(rs.getString(4));
				nboard.setNdate(rs.getTimestamp(5));
				nboards.add(nboard);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nboards;
	}
	
	public void update(Connection conn, Nboard nboard) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update nboard set ntitle=?,ncontent=?,nuserId=?, "
					+ "   ndate=? where nboardId=?");
			pstmt.setString(1, nboard.getNtitle());
			pstmt.setString(2, nboard.getNcontent());
			pstmt.setString(3, nboard.getNuserId());
			pstmt.setTimestamp(4, new Timestamp(nboard.getNdate().getTime()));
			pstmt.setInt(5, nboard.getNboardId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int nboardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from nboard where nboardId = ?");
			pstmt.setInt(1, nboardId);
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
			rs = stmt.executeQuery("select count(*) from nboard");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Nboard> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Nboard> nboardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from nboard ");			
			rs  = pstmt.executeQuery(); 
			nboardList = new ArrayList<Nboard>();
			while (rs.next()){
				Nboard nboard = new Nboard();
				nboard.setNboardId(rs.getInt(1));
				nboard.setNtitle(rs.getString(2));
				nboard.setNcontent(rs.getString(3));
				nboard.setNuserId(rs.getString(4));
				nboard.setNdate(rs.getTimestamp(5));
				nboardList.add(nboard);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nboardList;
	}
	
	public List<Nboard> selectListLimit(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Nboard> nboardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from nboard LIMIT 5");			
			rs  = pstmt.executeQuery(); 
			nboardList = new ArrayList<Nboard>();
			while (rs.next()){
				Nboard nboard = new Nboard();
				nboard.setNboardId(rs.getInt(1));
				nboard.setNtitle(rs.getString(2));
				nboard.setNcontent(rs.getString(3));
				nboard.setNuserId(rs.getString(4));
				nboard.setNdate(rs.getTimestamp(5));
				nboardList.add(nboard);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nboardList;
	}
	
	public List<Nboard> selectListByLimit(Connection conn,int startRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Nboard> nboardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from nboard limit ?,? ");	
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs  = pstmt.executeQuery(); 
			nboardList = new ArrayList<Nboard>();
			while (rs.next()){
				Nboard nboard = new Nboard();
				nboard.setNboardId(rs.getInt(1));
				nboard.setNtitle(rs.getString(2));
				nboard.setNcontent(rs.getString(3));
				nboard.setNuserId(rs.getString(4));
				nboard.setNdate(rs.getTimestamp(5));
				nboardList.add(nboard);

			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nboardList;
	}
	
	private static final int nboardCountPerPage = 8;

	public NboardListView getNboardList(Connection conn, int pageNumber)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		NboardListView nlv = null;
		try {
			int nboardTotalCount = selectCount(conn);

			List<Nboard> nboardList = null;
			int firstRow = 0;
			int endRow = 0;
			if (nboardTotalCount > 0) {
				firstRow =
				(pageNumber - 1) * nboardCountPerPage; //1page -> firstRow: 0
				endRow = nboardCountPerPage; // 1page endRow :5
				nboardList =selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				nboardList = Collections.emptyList();
			}
			nlv = new NboardListView(nboardTotalCount, currentPageNumber, nboardList,
					nboardCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return nlv;
	}
	
	
}




