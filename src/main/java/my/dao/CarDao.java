package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Car;
import my.model.CarListView;
import my.util.JdbcUtil;


public class CarDao {
	
	public void insert(Connection conn, Car car) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into car (name, price, mainimage, catalogimage, detailimage, origin, oil, size, person)"
					+ " values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, car.getName());
			pstmt.setInt(2, car.getPrice());
			pstmt.setString(3, car.getMainimage());
			pstmt.setString(4, car.getCatalogimage());
			pstmt.setString(5, car.getDetailimage());			
			pstmt.setString(6, car.getOrigin());
			pstmt.setString(7, car.getOil());
			pstmt.setString(8, car.getSize());
			pstmt.setInt(9, car.getPerson());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
		public Car selectById(Connection conn, int carId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Car car = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from car where carId = ?");
			pstmt.setInt(1, carId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				car = new Car(); 
				car.setCarId(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setPrice(rs.getInt(3));
				car.setMainimage(rs.getString(4));
				car.setCatalogimage(rs.getString(5));
				car.setDetailimage(rs.getString(6));			
				car.setOrigin(rs.getString(7));
				car.setOil(rs.getString(8));
				car.setSize(rs.getString(9));
				car.setPerson(rs.getInt(10));
				
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return car;
	}
		
	
	public List<Car> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		Car car = null;
		String sql = "select * from car ";
		if (keyword != null && !keyword.equals("")) {
	         sql += "where " + target.trim() + " like '%" + keyword.trim() + "%'";
	    }
		List<Car> cars = new ArrayList<Car>();
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				car = new Car(); 
				car.setCarId(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setPrice(rs.getInt(3));
				car.setMainimage(rs.getString(4));
				car.setCatalogimage(rs.getString(5));
				car.setDetailimage(rs.getString(6));			
				car.setOrigin(rs.getString(7));
				car.setOil(rs.getString(8));
				car.setSize(rs.getString(9));
				car.setPerson(rs.getInt(10));
				cars.add(car);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return cars;
	}

/*	
	public List<Car> selectTheme(Connection conn, String theme) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Car car = null;
		String sql = "select * from car " + theme; 	
		
		List<Car> cars = new ArrayList<Car>();
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				car = new Car(); 
				car.setCarid(rs.getInt(1));
				car.setTitle(rs.getString(2));
				car.setName(rs.getString(3));
				car.setMemo(rs.getString(4));
				car.setImage(rs.getString(5));
				car.setPrice(rs.getInt(6));
				car.setRdate(rs.getTimestamp(7));
				car.setFavorite(rs.getInt(8));
				car.setKind(rs.getString(9));
				cars.add(car);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return cars;
	}
	*/
	public void update(Connection conn, Car car) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update car set name=?, price=?, mainimage=?, catalogimage=?, detailimage=?, "
					+ "   origin=?, oil=?, size=?, person=? where carId=?");
			pstmt.setString(1, car.getName());
			pstmt.setInt(2, car.getPrice());
			pstmt.setString(3, car.getMainimage());
			pstmt.setString(4, car.getCatalogimage());
			pstmt.setString(5, car.getDetailimage());			
			pstmt.setString(6, car.getOrigin());
			pstmt.setString(7, car.getOil());
			pstmt.setString(8, car.getSize());
			pstmt.setInt(9, car.getPerson());
			pstmt.setInt(10, car.getCarId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public void updateFav(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update car set favorite = favorite +1 where carId=?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
*/
	
	public void deleteById(Connection conn, int carId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from car where carId = ?");
			pstmt.setInt(1, carId);
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
			rs = stmt.executeQuery("select count(*) from car");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

	
	public List<Car> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Car> carList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from car ");			
			rs  = pstmt.executeQuery(); 
			carList = new ArrayList<Car>();
			while (rs.next()){
				Car car = new Car();
				car.setCarId(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setPrice(rs.getInt(3));
				car.setMainimage(rs.getString(4));
				car.setCatalogimage(rs.getString(5));
				car.setDetailimage(rs.getString(6));			
				car.setOrigin(rs.getString(7));
				car.setOil(rs.getString(8));
				car.setSize(rs.getString(9));
				car.setPerson(rs.getInt(10));
				carList.add(car);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return carList;
	}

/*
	public List<Car> selectListKindView(Connection conn, String kind) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Car> carList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from car where kind=?");
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			carList = new ArrayList<Car>();
			while (rs.next()){
				Car car = new Car();
				car.setCarid(rs.getInt(1));
				car.setTitle(rs.getString(2));
				car.setName(rs.getString(3));
				car.setMemo(rs.getString(4));
				car.setImage(rs.getString(5));
				car.setPrice(rs.getInt(6));
				car.setRdate(rs.getTimestamp(7));
				car.setFavorite(rs.getInt(8));
				car.setKind(rs.getString(9));
				carList.add(car);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return carList;
	}
	
	public List<String> selectListKind(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> kindList = null;
		try {
			pstmt = conn.prepareStatement
					("select kind from car group by kind");			
			rs  = pstmt.executeQuery(); 
			kindList = new ArrayList<String>();
			while (rs.next()){
				String kind = rs.getString(1);				
				kindList.add(kind);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return kindList;
	}
*/	
	private static final int carCountPerPage = 9;

	public CarListView getCarList(Connection conn, int pageNumber)
			throws SQLException {
		int currentPageNumber = pageNumber;
		CarListView clv = null;
		
		try {
			
			int carTotalCount = selectCount(conn);
			List<Car> carList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if (carTotalCount > 0) {
				firstRow =
				(pageNumber - 1) * carCountPerPage;
				endRow = carCountPerPage;
				carList = selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				carList = Collections.emptyList();
			}
			clv = new CarListView(carTotalCount,
					currentPageNumber, carList, 
					carCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		
		return clv;
	}


	public List<Car> selectListByLimit(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Car> carList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from car limit ?,?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			carList = new ArrayList<Car>();
			while (rs.next()){
				Car car = new Car();
				car.setCarId(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setPrice(rs.getInt(3));
				car.setMainimage(rs.getString(4));
				car.setCatalogimage(rs.getString(5));
				car.setDetailimage(rs.getString(6));			
				car.setOrigin(rs.getString(7));
				car.setOil(rs.getString(8));
				car.setSize(rs.getString(9));
				car.setPerson(rs.getInt(10));			
				carList.add(car);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return carList;
	}

}

















