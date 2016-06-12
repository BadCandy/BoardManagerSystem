<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String cId = request.getParameter("cid");
	String cName = new String(request.getParameter("cname").getBytes(
			"Cp1252"), "EUC-KR");
	String pNum = request.getParameter("pnum");
	int point = Integer.parseInt(request.getParameter("point"));

	pstmt = conn
			.prepareStatement(" SELECT * FROM `customer` WHERE `cid` = ?");
	pstmt.setString(1, cId);

	rs = pstmt.executeQuery();
	if (rs != null) {
		rs.next();

		pstmt = conn.prepareStatement("UPDATE `customer` "
				+ "SET `cname` = ?, `p_num` = ?, `point` = ? "
				+ "WHERE `cid` = " + cId);
		pstmt.setString(1, cName);
		pstmt.setString(2, pNum);
		pstmt.setInt(3, point);
		int isConfirm = pstmt.executeUpdate();
		if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 수정되었습니다.');
	location.replace('customer.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('modifycustomer.jsp');
</script>
<%
	}
	}
	pstmt.close();
	conn.close();
%>