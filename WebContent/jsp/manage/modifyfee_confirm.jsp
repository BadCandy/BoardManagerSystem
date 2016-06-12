<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int time;
	int fee = Integer.parseInt(request.getParameter("fee"));
	int point = Integer.parseInt(request.getParameter("point"));
	int isConfirm = 0;

	pstmt = conn
			.prepareStatement(" SELECT * FROM `fee_per_time` ORDER BY `time` ASC");
	rs = pstmt.executeQuery();

	while (rs.next()) {
		time = rs.getInt("time");
		if (time == 1) {
			pstmt = conn.prepareStatement("UPDATE `fee_per_time` "
					+ "SET `time` = ?, `fee` = ?, `point` = ? "
					+ "WHERE `time` = ?");
			pstmt.setInt(1, time);
			pstmt.setInt(2, fee);
			pstmt.setInt(3, point);
			pstmt.setInt(4, time);
			isConfirm = pstmt.executeUpdate();
		} else {
			pstmt = conn.prepareStatement("UPDATE `fee_per_time` "
					+ "SET `time` = ?, `fee` = ?, `point` = ? "
					+ "WHERE `time` = ?");
			pstmt.setInt(1, time);
			pstmt.setInt(2, fee * time);
			pstmt.setInt(3, point * time);
			pstmt.setInt(4, time);
			isConfirm = pstmt.executeUpdate();
		}
	}

	if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 수정되었습니다.');
	location.replace('manage.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('modifyfee.jsp');
</script>
<%
	}

	pstmt.close();
	conn.close();
%>