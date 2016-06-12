<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int time = Integer.parseInt(request.getParameter("time"));
	int isConfirm = 0;
	if (time == 1) {
		pstmt = conn
				.prepareStatement("INSERT INTO `fee_per_time` (`time`, `fee`, `point`) "
						+ "VALUES (?,?,?)");
		pstmt.setInt(1, time);
		pstmt.setInt(2, 0);
		pstmt.setInt(3, 0);
	} else {
		pstmt = conn
				.prepareStatement("SELECT * FROM `fee_per_time` WHERE `time` = 1");
		rs = pstmt.executeQuery();
		rs.next();
		int fee = rs.getInt("fee");
		int point = rs.getInt("point");
		pstmt = conn
				.prepareStatement("INSERT INTO `fee_per_time` (`time`, `fee`, `point`) "
						+ "VALUES (?,?,?)");
		pstmt.setInt(1, time);
		pstmt.setInt(2, fee * time);
		pstmt.setInt(3, point * time);

	}

	try {
		isConfirm = pstmt.executeUpdate();
	} catch (Exception e) {
%>
<script>
	alert('시간이 중복 됩니다.');
	location.replace('insertfee.jsp');
</script>
<%
	}
	if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 저장되었습니다.');
	location.replace('manage.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('insertfee.jsp');
</script>
<%
	}
	pstmt.close();
	conn.close();
%>