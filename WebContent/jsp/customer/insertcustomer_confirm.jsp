<%@ include file="../database/dbconnection.jsp"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String cname = new String(request.getParameter("cname").getBytes(
			"Cp1252"), "EUC-KR");
	String pNum = new String(request.getParameter("pnum").getBytes(
			"Cp1252"), "EUC-KR");
	int point = Integer.parseInt(request.getParameter("point"));

	pstmt = conn
			.prepareStatement("INSERT INTO `customer` (`cname`, `p_num`, `point`) "
					+ "VALUES (?,?,?)");

	pstmt.setString(1, cname);
	pstmt.setString(2, pNum);
	pstmt.setInt(3, point);
	int isConfirm = pstmt.executeUpdate();

	pstmt = conn
			.prepareStatement("ALTER TABLE `customer` AUTO_INCREMENT=1;");
	pstmt.executeUpdate();
	pstmt = conn.prepareStatement("SET @CNT = 0;");
	pstmt.executeUpdate();
	pstmt = conn
			.prepareStatement("UPDATE `customer` SET `customer`.`cid` = @CNT:=@CNT+1;");
	pstmt.executeUpdate();

	if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 저장되었습니다.');
	location.replace('customer.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('insertcustomer.jsp');
</script>
<%
	}
	pstmt.close();
	conn.close();
%>