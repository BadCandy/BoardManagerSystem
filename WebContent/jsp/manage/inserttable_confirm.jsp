<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String tId = new String(request.getParameter("tid").getBytes(
			"Cp1252"), "EUC-KR");
	String tNum = new String(request.getParameter("tnum").getBytes(
			"Cp1252"), "EUC-KR");

	pstmt = conn
			.prepareStatement("INSERT INTO `table` (`tid`, `total_num`, `is_empty`) "
					+ "VALUES (?,?,?)");

	pstmt.setString(1, tId);
	pstmt.setString(2, tNum);
	pstmt.setBoolean(3, true);
	try {
		int isConfirm = pstmt.executeUpdate();
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
	alert('테이블 번호가 중복되어 실패하였습니다.');
	location.replace('inserttable.jsp');
</script>
<%
	}
	} catch (Exception e) {
%>
<script>
	alert('테이블 번호가 중복되어 실패하였습니다.');
	location.replace('inserttable.jsp');
</script>
<%
	}
	pstmt.close();
	conn.close();
%>