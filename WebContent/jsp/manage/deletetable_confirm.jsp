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
	alert('�� ���̺��� �̹� ������̹Ƿ� ������ �� �����ϴ�.');
	location.replace('manage.jsp');
</script>
<%
	}
		if (isConfirm == 1) {
%>
<script>
	alert('���������� �����Ͱ� �����Ǿ����ϴ�.');
	location.replace('manage.jsp');
</script>
<%
	} else {
%>
<script>
	alert('�����Ͽ����ϴ�.');
	location.replace('manage.jsp');
</script>
<%
	}
	}

	pstmt.close();
	conn.close();
%>