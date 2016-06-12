<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int isConfirm = 0;
	String time = request.getParameter("time");

	pstmt = conn
			.prepareStatement("SELECT * FROM `fee_per_time` WHERE `time` = ?");
	pstmt.setString(1, time);
	rs = pstmt.executeQuery();
	if (rs != null) {
		rs.next();
		try {
			pstmt = conn
					.prepareStatement("DELETE FROM `fee_per_time` WHERE `time` = ?");
			pstmt.setString(1, time);
		} catch (Exception e) {

			isConfirm = pstmt.executeUpdate();
%>
<script>
	alert('해당 요금시간은 이미 사용중이므로 삭제가 불가능합니다.');
	location.replace('manage.jsp');
</script>
<%
	}
		if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 삭제되었습니다.');
	location.replace('manage.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('manage.jsp');
</script>
<%
	}
	}

	pstmt.close();
	conn.close();
%>