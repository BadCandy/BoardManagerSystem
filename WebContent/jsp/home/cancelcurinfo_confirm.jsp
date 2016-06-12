<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String tId = request.getParameter("tid");

	String sql = "SELECT * FROM `sit` WHERE `tid` = ?";
	String sql2 = "SELECT * FROM `play` WHERE `tid` = ?";
	String sql3 = "";

	pstmt = conn.prepareStatement(sql); //sit
	pstmt.setString(1, tId);
	rs = pstmt.executeQuery();
	pstmt = conn.prepareStatement(sql2);//play
	pstmt.setString(1, tId);
	rs2 = pstmt.executeQuery();
	int isConfirm = 0;
	
	if (rs2.next()) { //play
		String bId = rs2.getString("bid");
		pstmt = conn
				.prepareStatement("DELETE FROM `play` WHERE `tid` = ?");
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();

		sql3 = "UPDATE `boardgame` SET `is_use` = true WHERE `bid` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, bId);
		isConfirm = pstmt.executeUpdate();
	}
	
	if (rs.next()) { //sit
		sql3 = "DELETE FROM `sit` WHERE `tid` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();
		sql3 = "UPDATE `table` SET `is_empty` = true WHERE `tid` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();

		if (isConfirm == 1) {
%>
<script>
	alert('취소 되었습니다.');
	location.replace('home.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('home.jsp');
</script>
<%
	}
	}

	pstmt.close();
	conn.close();
%>