package com.anmozilla.mvc.member.model.dao;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.anmozilla.mvc.common.util.PageInfo;
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
	// 여기서 부터 두번째 병합
	
	public List<Member> findAll(Connection connection, PageInfo pageInfo) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, MEM_NO, MEM_ID, MEM_NICKNAME, MEM_EMAIL, MEM_PHONE, MEM_WARNING, MEM_STATUS "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "MEM_NO, "
						+ 			"MEM_ID, "
						+ 			"MEM_NICKNAME, "
						+ 			"MEM_EMAIL, "
						+ 			"MEM_PHONE, "
						+  			"MEM_WARNING, "
						+     		"MEM_STATUS "
						+ 	 "FROM ("
						+ 	    "SELECT MEM_NO, "
						+ 			   "MEM_ID, "
						+  			   "MEM_NICKNAME, "
						+ 			   "MEM_EMAIL, "
						+ 			   "MEM_PHONE, "
						+ 			   "MEM_WARNING, "
						+ 	   		   "MEM_STATUS "
						+ 		"FROM MEM_LIST "
						+ 		"WHERE MEM_STATUS = 'Y' ORDER BY MEM_NO DESC"
						+ 	 ")"
						+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				
				member.setRowNum(rs.getInt("RNUM"));
				member.setNo(rs.getInt("MEM_NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setNickName(rs.getString("MEM_NICKNAME"));
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setWarning(rs.getInt("MEM_WARNING"));
				member.setStatus(rs.getString("MEM_STATUS"));
				
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		
		return list;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEM_LIST SET MEM_STATUS=? WHERE MEM_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberWarning(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEM_LIST SET MEM_WARNING=? WHERE MEM_NO=?";
	
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, member.getWarning());
			pstmt.setInt(2, member.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public List<Member> memberSearchWord(Connection connection, String searchOption, String searchWord, PageInfo pageInfo) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUMS, MEM_NO, MEM_ID, MEM_NICKNAME, MEM_EMAIL, MEM_PHONE, MEM_WARNING, MEM_STATUS "
						+ "FROM ( "
						+	"SELECT ROWNUM AS RNUMS,"
						+			"RNUM," 					
						+ 			"MEM_NO, "
						+ 			"MEM_ID, "
						+ 			"MEM_NICKNAME, "
						+ 			"MEM_EMAIL, "
						+ 			"MEM_PHONE, "
						+ 			"MEM_WARNING, "
						+ 			"MEM_STATUS "
				+ 			"FROM ( "
						+ 		"SELECT ROWNUM AS RNUM, "
						+ 				"MEM_NO, "
						+ 				"MEM_ID, "
						+ 				"MEM_NICKNAME, "
						+ 				"MEM_EMAIL, "
						+ 				"MEM_PHONE, "
						+ 				"MEM_WARNING, "
						+ 				"MEM_STATUS "
						+ 		"FROM MEM_LIST "
						+ 		"WHERE MEM_STATUS = 'Y' ORDER BY MEM_NO DESC"
						+ 	") "
						+ " WHERE "+ searchOption.trim();
		
		try {
			if(searchWord != null && !searchWord.equals("")) {
				query += " LIKE '%" + searchWord.trim() + "%')" + "WHERE RNUMS BETWEEN ? AND ?";
				System.out.println("서치단어" + searchOption.trim() + "/" + searchWord.trim());
				System.out.println("시작페이지" + pageInfo.getStartList() + ",마지막 페이지" + pageInfo.getEndList());
			}
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				
				member.setRowNum(rs.getInt("RNUMS"));
				member.setNo(rs.getInt("MEM_NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setNickName(rs.getString("MEM_NICKNAME"));
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setWarning(rs.getInt("MEM_WARNING"));
				member.setStatus(rs.getString("MEM_STATUS"));
				
				list.add(member);
				System.out.println("다오 리스트" +list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int getMemberSearchCount(Connection connection, String searchOption, String searchWord) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT  COUNT(*) "
					+ " FROM ("
					+ 	"SELECT ROWNUM AS RNUM, "
					+ 			"MEM_NO, "
					+ 			"MEM_ID, "
					+ 			"MEM_NICKNAME, "
					+ 			"MEM_EMAIL, "
					+ 			"MEM_PHONE, "
					+ 			"MEM_WARNING, "
					+ 			"MEM_STATUS "
					+ 	"FROM MEM_LIST "
					+ 	"WHERE MEM_STATUS = 'Y' ORDER BY MEM_NO DESC"
					+ 	") "
					+ " WHERE "+ searchOption.trim();
	
		try {
			if(searchWord != null && !searchWord.equals("")) {
				query += " LIKE '%" + searchWord.trim() + "%'";
			}
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
	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement ps = null;
		String query = "UPDATE "
					 + "MEM_LIST "
					 + "SET "
					 + "MEM_NICKNAME=?, "
					 + "MEM_EMAIL=?, "
					 + "MEM_PHONE=? "
					 + "WHERE MEM_NO=? ";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setString(1, member.getNickName());
			ps.setString(2, member.getEmail());
			ps.setString(3, member.getPhone());
			ps.setInt(4, member.getNo());
			
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
		String query = "UPDATE MEM_LIST SET MEM_STATUS=? WHERE MEM_NO=?";
		
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


	// 비밀번호 수정
	public int updateMemberPwd(Connection connection, int no, String newPwd) {
		int result = 0;
		PreparedStatement ps = null;
		String query = "UPDATE MEM_LIST SET MEM_PW=? WHERE MEM_NO=?";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setString(1, newPwd);
			ps.setInt(2, no);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		System.out.println("result : " + result);
		return result;
	}

	// myPage 비밀번호 확인 
	public Member pwdDoubleCheckByNo(Connection connection, int userNo) {
		Member result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT  "
						+ "RNUM, "
						+ "MEM_NO, "
						+ "MEM_ID, "
						+ "MEM_PW, "
						+ "MEM_NICKNAME, "
						+ "MEM_EMAIL, "
						+ "MEM_PHONE, "
						+ "MEM_WARNING, "
						+ "MEM_STATUS "
						+ "FROM MEM_LIST"
						+ "WHERE MEM_NO = ?";
		
		try {
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, userNo);
			
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		System.out.println("result : " + result);
		return result;
	}

}
