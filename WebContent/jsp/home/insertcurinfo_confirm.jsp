<%@ include file="../database/dbconnection.jsp"%>
<%@ page import="java.util.Calendar" import="java.text.SimpleDateFormat"
	contentType="text/html; charset=EUC-KR"%>
<%
	int isConfirm = 0;
	String cId = "1";
	String bId = null;
	String tId = new String(request.getParameter("tid").getBytes(
			"Cp1252"), "EUC-KR");
	String bName = new String(request.getParameter("bname").getBytes(
			"Cp1252"), "EUC-KR");
	System.out.println(bName);
	int time = Integer.parseInt(request.getParameter("time"));
	String pNum = new String(request.getParameter("pnum").getBytes(
			"Cp1252"), "EUC-KR");

	Calendar calendar = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	String startDate = dateFormat.format(calendar.getTime()).toString();
	calendar.add(Calendar.HOUR, time);
	String endDate = dateFormat.format(calendar.getTime()).toString();

	try {
		if (pNum != "0") {
			pstmt = conn
					.prepareStatement("SELECT `cid` FROM `customer` WHERE `p_num` = ?");
			pstmt.setString(1, pNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cId = rs.getString("cid");
			}
		}

		pstmt = conn
				.prepareStatement("INSERT INTO `sit` (`s_time`, `e_time`, `cid`, `tid`) VALUES (?,?,?,?)");
		pstmt.setString(1, startDate);
		pstmt.setString(2, endDate);
		pstmt.setString(3, cId);
		pstmt.setString(4, tId);
		isConfirm = pstmt.executeUpdate();

	} catch (Exception e) {
%>
<script>
	alert('등록된 전화번호인지 확인하세요.');
	location.replace('insertcurinfo.jsp');
</script>
<%
	}

	pstmt = conn
			.prepareStatement("SELECT `bid` FROM `boardgame` WHERE `bname` = ?");
	pstmt.setString(1, bName);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		bId = rs.getString("bid");
	}
	pstmt = conn
			.prepareStatement("INSERT INTO `play` (`time`, `tid`, `bid`) VALUES (?,?,?)");
	pstmt.setInt(1, time);
	pstmt.setString(2, tId);
	pstmt.setString(3, bId);
	isConfirm = pstmt.executeUpdate();

	pstmt = conn
			.prepareStatement("UPDATE `boardgame` SET `is_use` = false WHERE `bid` = ?");
	pstmt.setString(1, bId);
	isConfirm = pstmt.executeUpdate();

	pstmt = conn
			.prepareStatement("UPDATE `table` SET `is_empty` = false WHERE `tid` = ?");
	pstmt.setString(1, tId);
	isConfirm = pstmt.executeUpdate();

	if (isConfirm == 1) {
%>
<script>
	alert('정상적으로 데이터가 저장되었습니다.');
	location.replace('home.jsp');
</script>
<%
	} else {
%>
<script>
	alert('실패하였습니다.');
	location.replace('insertcurinfo.jsp');
</script>
<%
	}
	pstmt.close();
	conn.close();
%>