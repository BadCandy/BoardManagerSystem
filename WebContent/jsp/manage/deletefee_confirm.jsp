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
	alert('�ش� ��ݽð��� �̹� ������̹Ƿ� ������ �Ұ����մϴ�.');
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