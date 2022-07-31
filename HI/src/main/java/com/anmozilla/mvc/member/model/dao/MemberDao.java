package com.anmozilla.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

import com.anmozilla.mvc.member.model.vo.Member;

public class MemberDao {
	// 솔이님 !!!!!!!!!!!!!!!!!!!!! ♡
	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEM_LIST VALUES(SEQ_MEM_NO.NEXTVAL,?,?,?,?,?,DEFAULT,?,?,DEFAULT,DEFAULT)";
				
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getNickName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getImg());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public Member findMemberById(Connection connection, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEM_LIST WHERE MEM_ID=? AND MEM_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setNickName(rs.getString("MEM_NICKNAME"));
		    	member.setPassword(rs.getString("MEM_PW"));
		    	member.setName(rs.getString("MEM_NAME"));
		    	member.setPhone(rs.getString("MEM_PHONE"));
		    	member.setWarning(rs.getInt("MEM_WARNING"));
		    	member.setEmail(rs.getString("MEM_EMAIL"));
		    	member.setImg(rs.getString("MEM_IMG"));
		    	member.setRole(rs.getString("MEM_ROLE"));
		    	member.setStatus(rs.getString("MEM_STATUS"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}

	public Member findMemberByNick(Connection connection, String userNick) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEM_LIST WHERE MEM_NICKNAME=? AND MEM_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setNickName(rs.getString("MEM_NICKNAME"));
		    	member.setPassword(rs.getString("MEM_PW"));
		    	member.setName(rs.getString("MEM_NAME"));
		    	member.setPhone(rs.getString("MEM_PHONE"));
		    	member.setWarning(rs.getInt("MEM_WARNING"));
		    	member.setEmail(rs.getString("MEM_EMAIL"));
		    	member.setImg(rs.getString("MEM_IMG"));
		    	member.setRole(rs.getString("MEM_ROLE"));
		    	member.setStatus(rs.getString("MEM_STATUS"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}

	public Member findMemberByEmail(Connection connection, String userEmail) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEM_LIST WHERE MEM_EMAIL=? AND MEM_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setNickName(rs.getString("MEM_NICKNAME"));
		    	member.setPassword(rs.getString("MEM_PW"));
		    	member.setName(rs.getString("MEM_NAME"));
		    	member.setPhone(rs.getString("MEM_PHONE"));
		    	member.setWarning(rs.getInt("MEM_WARNING"));
		    	member.setEmail(rs.getString("MEM_EMAIL"));
		    	member.setImg(rs.getString("MEM_IMG"));
		    	member.setRole(rs.getString("MEM_ROLE"));
		    	member.setStatus(rs.getString("MEM_STATUS"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}

	public int getMemberCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM MEM_LIST WHERE MEM_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 현진!!!!!!!!!!!!!

	// myPage 정보 업데이트
	public static int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement ps = null;
		String query = "INSERT INTO MEM_LIST VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,DEFAULT,?,?,DEFAULT,DEFAULT)";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setString(1, member.getId());
			ps.setString(2, member.getNickName());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getName());
			ps.setString(5, member.getPhone());
			ps.setString(6, member.getEmail());
			ps.setString(7, member.getImg());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return result;
		
	}

	// 회원 탈퇴
	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement ps = null;
		String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setString(1, status);
			ps.setInt(2, no);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return result;
	}

	

	public int updateMemberPwd(Connection connection, int no, String userPwd) {
		int result = 0;
		PreparedStatement ps = null;
		String query = "UPDATE MEM_LIST SET PASSWORD=? WHERE NO=?";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setString(1, userPwd);
			ps.setInt(2, no);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return result;
	}

}
