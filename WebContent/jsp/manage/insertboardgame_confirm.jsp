<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String bName = new String(request.getParameter("bname").getBytes(
			"Cp1252"), "EUC-KR");

	pstmt = conn
			.prepareStatement("INSERT INTO `boardgame` (`bname`, `is_use`) "
					+ "VALUES (?,?)");

	pstmt.setString(1, bName);
	pstmt.setBoolean(2, true);
	try {
		int isConfirm = pstmt.executeUpdate();

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
	alert('정상적으로 데이터가 저장되었습니다.');
	location.replace('manage.jsp');
</script>
<%
	} else {
%>
<script>
	alert('데이터 저장에 실패하였습니다.');
	location.replace('insertboardgame.jsp');
</script>
<%
	}
	} catch (Exception e) {
%>
<script>
	alert('보드게임 번호가 중복되어 실패하였습니다.');
	location.replace('insertboardgame.jsp');
</script>
<%
	}
	pstmt.close();
	conn.close();
%>