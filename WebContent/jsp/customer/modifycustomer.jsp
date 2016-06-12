<%@ include file="../database/dbconnection.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	String cId = request.getParameter("cid");
	pstmt = conn
			.prepareStatement(" SELECT * FROM `customer` WHERE `cid` = "
					+ cId);
	rs = pstmt.executeQuery();

	if (rs != null) {
		rs.next();
		String cName = rs.getString("cname");
		String pNum = rs.getString("p_num");
		String point = rs.getString("point");
%>



<html>
<%@ include file="../head/head.jsp"%>

<body>
	<h2>고객정보 수정</h2>
	<form name="update" action="modifycustomer_confirm.jsp" method="post">
		<input type="hidden" name="cid" value="<%=cId%>">
		<div class="form_settings">
			<p>
				<span>이름</span> <input type="text" name="cname" value=<%=cName%>>
			</p>
			<br>
			<p>
				<span>전화 번호(Form : 01099792598의 형태)</span> <input type="text"
					name="pnum" value=<%=pNum%>>
			</p>
			<br>
			<p>
				<span>포인트</span> <input type="text" name="point" value=<%=point%>>
			</p>
			<br>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit" name="save"
					value="수정완료">
			</p>
		</div>
	</form>
</body>
</html>

<%
	}
	pstmt.close();
	conn.close();
%>