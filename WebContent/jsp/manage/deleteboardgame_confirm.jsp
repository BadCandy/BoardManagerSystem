<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int isConfirm = 0;
	String bId = request.getParameter("bid");

	pstmt = conn
			.prepareStatement("SELECT * FROM `boardgame` WHERE `bid` = ?");
	pstmt.setString(1, bId);
	rs = pstmt.executeQuery();
	if (rs != null) {
		rs.next();
		try {
			pstmt = conn
					.prepareStatement("DELETE FROM `boardgame` WHERE `bid` = ?");
			pstmt.setString(1, bId);
			isConfirm = pstmt.executeUpdate();
		} catch (Exception e) {		
%>
<script>
	alert('�� ��������� �̹� ������̹Ƿ� ������ �Ұ����մϴ�.');
	location.replace('manage.jsp');
</script>
<%
	}
		if (isConfirm == 1) {
			pstmt = conn
					.prepareStatement("ALTER TABLE `boardgame` AUTO_INCREMENT=1;");
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("SET @CNT = 0;");
			pstmt.executeUpdate();
			pstmt = conn
					.prepareStatement("UPDATE `boardgame` SET `boardgame`.`bid` = @CNT:=@CNT+1;");
			pstmt.executeUpdate();
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