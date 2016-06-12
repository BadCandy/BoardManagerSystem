<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String tId = request.getParameter("tid");

	int point = 0;
	int fee = 0;
	String inDate = new java.text.SimpleDateFormat("yyyyMMdd")
			.format(new java.util.Date());

	String sql = "SELECT * FROM `sit` WHERE `tid` = ?";
	String sql2 = "SELECT * FROM `play` WHERE `tid` = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, tId);
	rs = pstmt.executeQuery();
	pstmt = conn.prepareStatement(sql2);
	pstmt.setString(1, tId);
	rs2 = pstmt.executeQuery();
	
	int isConfirm = 0;
	if (rs2.next()) {
		String time = rs2.getString("time");
		String bId = rs2.getString("bid");

		String sql3 = "SELECT * FROM `fee_per_time` WHERE `time` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, time);
		rs3 = pstmt.executeQuery();
		if (rs3.next()) {
			point = rs3.getInt("point");
			fee = rs3.getInt("fee");
		}

		sql3 = "UPDATE `boardgame` " + "SET `is_use` = true "
				+ "WHERE `bid` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, bId);
		isConfirm = pstmt.executeUpdate();

		sql3 = "UPDATE `table` " + "SET `is_empty` = true WHERE `tid` = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();

		pstmt = conn
				.prepareStatement("DELETE FROM `play` WHERE `tid` = ?");
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();
	}
	if (rs.next()) {
		String cId = rs.getString("cid");
		if (cId != "0") {
			String sql3 = "SELECT * FROM `customer` WHERE `cid` = ?";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, cId);
			rs3 = pstmt.executeQuery();
			if (rs3.next()) {
				point = point + rs3.getInt("point");
				sql3 = "UPDATE `customer` SET `point` = ? WHERE `cid` = ?";
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, point);
				pstmt.setString(2, cId);
				isConfirm = pstmt.executeUpdate();
			}
		}
		pstmt = conn
				.prepareStatement("DELETE FROM `sit` WHERE `tid` = ?");
		pstmt.setString(1, tId);
		isConfirm = pstmt.executeUpdate();

		String sql4 = "SELECT * FROM `total_cal` WHERE date = ?";
		pstmt = conn.prepareStatement(sql4);
		pstmt.setString(1, inDate);
		rs4 = pstmt.executeQuery();

		if (rs4.next()) {
			int totalMon = rs4.getInt("total_money");
			System.out.println();
			totalMon += fee;
			sql4 = "UPDATE `total_cal` SET `total_money` = ? WHERE `date` = ?";
			pstmt = conn.prepareStatement(sql4);
			pstmt.setInt(1, totalMon);
			pstmt.setString(2, inDate);
			pstmt.executeUpdate();
		} else {
			sql4 = "INSERT INTO `total_cal` (`date`, `total_money`) VALUES (?,?)";
			pstmt = conn.prepareStatement(sql4);
			pstmt.setString(1, inDate);
			pstmt.setInt(2, fee);
			pstmt.executeUpdate();
		}

		if (isConfirm == 1) {
%>
<script>
	alert('정산이 완료 되었습니다.');
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