<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int isConfirm = 0;
	String tId = request.getParameter("tid");

	pstmt = conn
			.prepareStatement("SELECT * FROM `table` WHERE `tid` = ?");
	pstmt.setString(1, tId);
	rs = pstmt.executeQuery();
	if (rs != null) {
		rs.next();
		try {
			pstmt = conn
					.prepareStatement("DELETE FROM `table` WHERE `tid` = ?");
			pstmt.setString(1, tId);

			isConfirm = pstmt.executeUpdate();
		} catch (Exception e) {
%>
<script>
	alert('그 테이블은 이미 사용중이므로 삭제할 수 없습니다.');
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