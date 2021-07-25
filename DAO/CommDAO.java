//커뮤니티 DB 관련 DAO//
package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommDAO {

	private Connection conn;
	private ResultSet rs;

	public CommDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public int getNext() {
		String SQL = "SELECT commID FROM COMM ORDER BY commID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int write(String commTitle, String userID, String commContent) {
		String SQL = "INSERT INTO COMM VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, commTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, commContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Comm> getList(int pageNumber) {
		String SQL = "SELECT * FROM COMM WHERE commID < ? AND commAvailable = 1 ORDER BY commID DESC LIMIT 15";
		ArrayList<Comm> list = new ArrayList<Comm>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 15);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comm comm = new Comm();
				comm.setCommID(rs.getInt(1));
				comm.setCommTitle(rs.getString(2));
				comm.setUserID(rs.getString(3));
				comm.setCommDate(rs.getString(4));
				comm.setCommContent(rs.getString(5));
				comm.setCommAvailable(rs.getInt(6));
				list.add(comm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM COMM WHERE commID < ? AND commAvailable = 1 ORDER BY commID DESC LIMIT 15";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 15);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류

	}

	public Comm getComm(int commID) {
		String SQL = "SELECT * FROM COMM WHERE commID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Comm comm = new Comm();
				comm.setCommID(rs.getInt(1));
				comm.setCommTitle(rs.getString(2));
				comm.setUserID(rs.getString(3));
				comm.setCommDate(rs.getString(4));
				comm.setCommContent(rs.getString(5));
				comm.setCommAvailable(rs.getInt(6));
				return comm;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}

	public int update(int commID, String commTitle, String commContent) {
		String SQL = "UPDATE COMM SET commTitle=?, commContent =? WHERE commID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commTitle);
			pstmt.setString(2, commContent);
			pstmt.setInt(3, commID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int delete(int commID) {
		String SQL = "UPDATE COMM SET commAvailable = 0 WHERE commID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
