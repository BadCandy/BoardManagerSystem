<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String cId = request.getParameter("cid");
	int isConfirm = 0;

	pstmt = conn
			.prepareStatement("SELECT * FROM `customer` WHERE `cid` = ?");
	pstmt.setString(1, cId);
	rs = pstmt.executeQuery();

	if (rs != null) {
		rs.next();
		try {
			pstmt = conn
					.prepareStatement("DELETE FROM `customer` WHERE `cid` = ?");
			pstmt.setString(1, cId);
			isConfirm = pstmt.executeUpdate();
		} catch (Exception e) {
%>
<script>
	alert('보드게임을 하고 계신 고객님은 삭제할 수 없습니다.');
	location.replace('customer.jsp');
</script>
<%
	}
		pstmt = conn
				.prepareStatement("ALTER TABLE `customer` AUTO_INCREMENT = 1;");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("SET @CNT = 0;");
		pstmt.executeUpdate();
		pstmt = conn
				.prepareStatement("UPDATE `customer` SET `customer`.`cid` = @CNT:=@CNT+1;");
		pstmt.executeUpdate();
	}
	if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 삭제되었습니다.');
	location.replace('customer.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('customer.jsp');
</script>
<%
	}

	pstmt.close();
	conn.close();
%>